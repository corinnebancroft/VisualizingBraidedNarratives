import pandas as pd

# --- Dataset selection ---
acronym = input("Enter dataset acronym (e.g. 's'): ").strip()

base_path = f"data/{acronym}/dump/"

rels = pd.read_csv(f"{base_path}narratives_{acronym}_relationships.csv")
chars = pd.read_csv(f"{base_path}narratives_{acronym}_characters.csv")
conts = pd.read_csv(f"{base_path}narratives_{acronym}_containers.csv")

# --- Attach Narrator to relationships via container title ---

rels = rels.merge(
    conts[["Title", "Narrator"]],
    left_on="Narrative Container",
    right_on="Title",
    how="left"
)


# --- Load StorySpace output ---
storyspace_path = input("Enter path to StorySpace CSV: ").strip()
storyspace_df = pd.read_csv(storyspace_path)

#How many rows in relationships.csv
print("Base relationships:", len(rels))

# --- How many rows after page expansion (from base relationships only) ---

# Ensure page columns are numeric (defensive)
rels["Start Page"] = pd.to_numeric(rels["Start Page"], errors="coerce")
rels["End Page"] = pd.to_numeric(rels["End Page"], errors="coerce")

# Identify invalid page ranges
invalid_pages = rels[rels["End Page"] < rels["Start Page"]]

print("Relationships with invalid page ranges:", len(invalid_pages))

# Compute expansion size per relationship
rels["page_expansion_count"] = (
    rels["End Page"] - rels["Start Page"] + 1
)

# Drop rows with invalid or missing page data before summing
valid_rels = rels.dropna(subset=["page_expansion_count"])
valid_rels = valid_rels[valid_rels["page_expansion_count"] > 0]

# Total expected rows after page expansion
expected_page_rows = valid_rels["page_expansion_count"].sum()

print("Expected rows after page expansion:", int(expected_page_rows))

# --- How many rows added by the reciprocal rule ---

# Defensive: normalize column name and type
rels["Is Reciprocal?"] = pd.to_numeric(
    rels["Is Reciprocal?"], errors="coerce"
).fillna(0)

# Count reciprocal-triggering relationships
num_reciprocal_base = (rels["Is Reciprocal?"] == 1).sum()

print("Base reciprocal relationships:", num_reciprocal_base)

# --- How many rows added by the Follow-the-Narrator rule ---

# Normalize narrator field
rels["Narrator"] = rels["Narrator"].fillna("[NULL]").astype(str)

# Select relationships that trigger the rule
narrated_rels = rels[rels["Narrator"] != "[NULL]"]

print("Base relationships with narrator:", len(narrated_rels))

# Count narrator → character expansions
def narrator_expansion_count(row):
    count = 0
    if row["Narrator"] != row["Character 1"]:
        count += 1
    if row["Narrator"] != row["Character 2"]:
        count += 1
    return count

# --- Narrator rows AFTER narrator-internal dedup (matches script) ---

narrator_rows = []

for _, row in narrated_rels.iterrows():
    narrator = row["Narrator"]
    start_pg = row["Start Page"]
    end_pg = row["End Page"]

    if narrator != row["Character 1"]:
        narrator_rows.append(
            (narrator, row["Character 1"], start_pg, end_pg)
        )

    if narrator != row["Character 2"]:
        narrator_rows.append(
            (narrator, row["Character 2"], start_pg, end_pg)
        )

# Deduplicate using the same *semantic identity* as the script
narrator_unique = set(narrator_rows)

expected_narrator_rows = len(narrator_unique)

print("Narrator rows after internal dedup:", expected_narrator_rows)


# --- Duplicate range for Follow-the-Narrator rule (ignoring reciprocity) ---

# Select narrated relationships
narrated = rels[rels["Narrator"] != "[NULL]"].copy()

# Build list of all attempted narrator -> character edges
attempted_pairs = []

for _, row in narrated.iterrows():
    narrator = row["Narrator"]

    if narrator != row["Character 1"]:
        attempted_pairs.append((narrator, row["Character 1"]))

    if narrator != row["Character 2"]:
        attempted_pairs.append((narrator, row["Character 2"]))

attempted_count = len(attempted_pairs)
unique_pairs = set(attempted_pairs)
unique_count = len(unique_pairs)

max_duplicates = attempted_count - unique_count

print("Narrator rule attempted rows:", attempted_count)
print("Unique narrator→character pairs:", unique_count)
print("Maximum possible narrator duplicates:", max_duplicates)
print("Minimum possible narrator duplicates: 0")

base_pairs = set(zip(rels["Character 1"], rels["Character 2"]))

collisions_with_base = sum(
    1 for pair in unique_pairs if pair in base_pairs
)

print("Narrator pairs colliding with base relationships:", collisions_with_base)

# --- Priority rule: how many rows were collapsed by category priority ---

# The priority rule guarantees only ONE relationship survives per:
# (Character 1, Character 2, startPage)
#
# If k rows exist for the same key, (k - 1) are dropped.

group_sizes = (
    storyspace_df
    .groupby(["Character 1", "Character 2", "startPage"])
    .size()
)

rows_dropped_by_priority = (group_sizes - 1).sum()

print("Rows dropped by priority rule:", int(rows_dropped_by_priority))


# --- Priority rule: how many rows were collapsed by category priority ---

# The priority rule guarantees only ONE relationship survives per:
# (Character 1, Character 2, startPage)
#
# If k rows exist for the same key, (k - 1) are dropped.

group_sizes = (
    storyspace_df
    .groupby(["Character 1", "Character 2", "startPage"])
    .size()
)

rows_dropped_by_priority = (group_sizes - 1).sum()

print("Rows dropped by priority rule:", int(rows_dropped_by_priority))


# --- How often the priority rule actually mattered (category competition) ---

category_competition = (
    storyspace_df
    .groupby(["Character 1", "Character 2", "startPage"])["category"]
    .nunique()
)

groups_with_competition = category_competition[category_competition > 1]

print("Groups with multiple competing categories:",
      len(groups_with_competition))


# --- Optional sanity bounds ---

total_storyspace_rows = len(storyspace_df)
unique_priority_keys = storyspace_df.groupby(
    ["Character 1", "Character 2", "startPage"]
).ngroups

max_possible_priority_drops = (
    total_storyspace_rows - unique_priority_keys
)

print("Priority drop sanity check:")
print("  Total StorySpace rows:", total_storyspace_rows)
print("  Unique (Char1, Char2, Page) keys:", unique_priority_keys)
print("  Max possible priority drops:", max_possible_priority_drops)

assert rows_dropped_by_priority <= max_possible_priority_drops

# --- Compare expected StorySpace row range to actual output ---

minimum_expected_rows = int(expected_page_rows)

maximum_expected_rows = int(
    expected_page_rows
    + num_reciprocal_base
    + expected_narrator_rows
)

actual_storyspace_rows = len(storyspace_df)

print("\n--- StorySpace Row Count Reconciliation ---")
print(f"Minimum possible rows : {minimum_expected_rows}")
print(f"Maximum possible rows : {maximum_expected_rows}")
print(f"Actual StorySpace rows: {actual_storyspace_rows}")

if actual_storyspace_rows < minimum_expected_rows:
    print("❌ ERROR: StorySpace has fewer rows than the theoretical minimum.")
elif actual_storyspace_rows > maximum_expected_rows:
    print("❌ ERROR: StorySpace has more rows than the theoretical maximum.")
else:
    print("✅ StorySpace row count falls within the expected range.")

# --- Compare PRE-DEDUPE diagnostic file to expected row count ---

pre_dedup_path = f"data/DiagnosticTestFiles/{acronym}_PRE_DEDUP.csv"

pre_dedup_df = pd.read_csv(pre_dedup_path)

expected_pre_dedup_rows = (
    len(rels)
    + num_reciprocal_base
    + expected_narrator_rows
)

actual_pre_dedup_rows = len(pre_dedup_df)

print("\n--- Pre-Dedup Row Reconciliation ---")
print("Expected pre-dedup rows:", expected_pre_dedup_rows)
print("Actual pre-dedup rows  :", actual_pre_dedup_rows)

if actual_pre_dedup_rows != expected_pre_dedup_rows:
    print("❌ ERROR: Pre-dedup row count does not match expectation.")
else:
    print("✅ Pre-dedup row count matches expected value exactly.")






