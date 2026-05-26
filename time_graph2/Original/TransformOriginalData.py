import pandas as pd

# -----------------------------
# 1. Load CSVs
# -----------------------------
events = pd.read_csv("Events.csv")
pages = pd.read_csv("StartPageEndPage.csv")
telling_time = pd.read_csv("TellingTime.csv")

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
    "Explanation": "Evidence"
})

pages = pages.rename(columns={
    "Event": "Event Name",
    "Start page": "Start Page",
    "End page": "End Page",
    "TellingTime": "TT Description"   # IMPORTANT CHANGE
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
# 7. OPTIONAL SORT
# -----------------------------
if "Start Page" in merged.columns:
    merged = merged.sort_values(by=["Event Name", "Start Page"])

# -----------------------------
# 8. SAVE
# -----------------------------
merged.to_csv("Merged_Output.csv", index=False)

print("\n✅ Success! File saved as Merged_Output.csv")