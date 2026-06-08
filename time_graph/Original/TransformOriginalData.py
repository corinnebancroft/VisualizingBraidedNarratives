import pandas as pd

# -----------------------------
# 1. Load CSVs
# -----------------------------
events = pd.read_csv("Events.csv")
pages = pd.read_csv("StartPageEndPage.csv")
telling_time = pd.read_csv("TellingTime.csv")
containers = pd.read_csv("Containers.csv")

# -----------------------------
# 2. CLEAN COLUMN NAMES (robust)
# -----------------------------
def clean_columns(df):
    df.columns = (
        df.columns
        .str.replace("&lt;br /&gt;", "", regex=False)   # remove encoded HTML
        .str.replace(r"<.*?>", "", regex=True)         # remove any HTML tags
        .str.replace(r"\(.*?\)", "", regex=True)       # remove parentheses content
        .str.replace(r"\s+", " ", regex=True)          # normalize spaces
        .str.strip()
    )
    return df

events = clean_columns(events)
pages = clean_columns(pages)
telling_time = clean_columns(telling_time)

# -----------------------------
# 3. DEBUG: CHECK CLEANED NAMES
# -----------------------------
print("\nCleaned column names:")
print("Events:", events.columns.tolist())
print("Pages:", pages.columns.tolist())
print("TellingTime:", telling_time.columns.tolist())

# -----------------------------
# 4. RENAME COLUMNS (your schema)
# -----------------------------
events = events.rename(columns={
    "Description": "Event Name",
    "Not Beforeyyyy[-mm-dd]": "Start Date",
    "Not Afteryyyy[-mm-dd]": "End Date",
    "Explanation": "Evidence",
    "Duration": "Duration",
    "Novel": "Novel"
})

pages = pages.rename(columns={
    "Event": "Event Name",
    "Start page": "Start Page",
    "End page": "End Page",
    "TellingTime": "TT Description"
})

telling_time = telling_time.rename(columns={
    "Description": "TT Description",
    "Not Beforeyyyy[-mm-dd]": "Start Date TT",
    "Not Afteryyyy[-mm-dd]": "End Date TT"
})


# -----------------------------
# 5. SANITY CHECK
# -----------------------------
print("\nAfter renaming:")
print("Events:", events.columns.tolist())
print("Pages:", pages.columns.tolist())
print("TellingTime:", telling_time.columns.tolist())

# Check required keys exist

assert "Event Name" in events.columns
assert "Event Name" in pages.columns

assert "TT Description" in pages.columns
assert "TT Description" in telling_time.columns

assert "Start Date TT" in telling_time.columns
assert "End Date TT" in telling_time.columns

# -----------------------------
# 6. MERGE
# -----------------------------

# Merge Events + Pages (1-to-many)
merged = pd.merge(
    events,
    pages,
    on="Event Name",
    how="left"
)

# Merge with TellingTime using Start Date TT
merged = pd.merge(
    merged,
    telling_time,
    on="TT Description",
    how="left"
)

# -----------------------------
# MERGE CONTAINERS → ADD TT PAGE RANGES
# -----------------------------

# Clean and rename containers columns to match
containers = clean_columns(containers)

containers = containers.rename(columns={
    "Title": "Container",
    "Start Page": "Start Page TT",
    "End Page": "End Page TT"
})

# Merge with main dataframe on Container
merged = pd.merge(
    merged,
    containers[["Container", "Start Page TT", "End Page TT"]],
    on="Container",
    how="left"
)

# -----------------------------
# ADD REQUIRED COLUMNS + STRUCTURE
# -----------------------------

# Ensure no NaN (important for later script)
merged = merged.fillna("")

# --- Add missing columns ---

# Relative Order (empty)
merged["Relative Order"] = ""

# -----------------------------
# IS APPROXIMATE? (duration-aware)
# -----------------------------

# Convert safely to datetime
start_dt = pd.to_datetime(merged["Start Date"], errors="coerce")
end_dt   = pd.to_datetime(merged["End Date"], errors="coerce")

# Convert Duration to numeric
duration = pd.to_numeric(merged.get("Duration", ""), errors="coerce")

# Compute actual duration (inclusive)
actual_duration = (end_dt - start_dt).dt.days + 1

# Apply your rule:
# F only if duration matches actual span, else T
merged["Is Approximate?"] = [
    "F" if pd.notna(d) and pd.notna(a) and d == a else "T"
    for d, a in zip(duration, actual_duration)
]

# Is Approximate TT? → ALWAYS T unless Start Date TT == End Date TT
merged["Is Approximate TT?"] = merged.apply(
    lambda row: "F" if row["Start Date TT"] == row["End Date TT"] else "T",
    axis=1
)


# -----------------------------
# NORMALIZE DATES + FILL MISSING END DATES
# -----------------------------

def normalize_date_string(s):
    s = str(s).strip()
    if s == "":
        return ""

    # Handle YYYY-00-00 → YYYY-01-01
    if len(s) == 10 and s[4] == "-" and s[7] == "-":
        y, m, d = s.split("-")

        if m == "00":
            m = "01"
        if d == "00":
            d = "01"

        return f"{y}-{m}-{d}"

    # Year only → YYYY-01-01
    if len(s) == 4 and s.isdigit():
        return f"{s}-01-01"

    # Year + month → YYYY-MM-01
    if len(s) == 7 and s[:4].isdigit() and s[5:7].isdigit():
        return f"{s}-01"

    return s


# --- Normalize all date columns ---
for col in ["Start Date", "End Date", "Start Date TT", "End Date TT"]:
    if col in merged.columns:
        merged[col] = merged[col].apply(normalize_date_string)

# --- Fill missing End Dates from Start Dates ---
merged.loc[
    (merged["End Date"] == "") & (merged["Start Date"] != ""),
    "End Date"
] = merged["Start Date"]

merged.loc[
    (merged["End Date TT"] == "") & (merged["Start Date TT"] != ""),
    "End Date TT"
] = merged["Start Date TT"]

# -----------------------------
# REMOVE TT DATA FOR 3rd PERSON NARRATOR
# -----------------------------

mask = merged["Narrator"].astype(str).str.contains("3rd Person Narrator", na=False)

cols_to_clear = ["Start Date TT", "End Date TT", "Start Page TT", "End Page TT", "Is Approximate TT?"]

for col in cols_to_clear:
    if col in merged.columns:
        merged.loc[mask, col] = ""

# --- Ensure Narrator column exists ---
if "Narrator" not in merged.columns:
    merged["Narrator"] = ""



# -----------------------------
# REORDER COLUMNS (keep all columns, just move key ones to front)
# -----------------------------

desired_order = [
    "Novel",
    "Relative Order",
    "Event Name",
    "Start Date",
    "End Date",
    "Is Approximate?",
    "Narrator",
    "Start Page",
    "End Page",
    "Start Date TT",
    "End Date TT",
    "Start Page TT",
    "End Page TT",
    "Is Approximate TT?",
    "Evidence"
]

# Keep only columns that actually exist (no errors)
desired_existing = [col for col in desired_order if col in merged.columns]

# Add all other columns AFTER, preserving their current order
remaining_cols = [col for col in merged.columns if col not in desired_existing]

# Reorder
merged = merged[desired_existing + remaining_cols]

print("\n✅ Columns standardized and ordered correctly")

# -----------------------------
# 7. OPTIONAL SORT
# -----------------------------
if "Start Page" in merged.columns:
    merged = merged.sort_values(by=["Event Name", "Start Page"])

# -----------------------------
# 8. SAVE
# -----------------------------
merged.to_csv("Merged_Output.csv", index=False)

print("\n✅ Success! File saved as Merged_Output.csv")