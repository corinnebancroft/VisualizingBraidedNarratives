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

# --- Page Range Expansion Diagnostics ---

# Only valid page ranges are expanded in the production code
valid_ranges = rels[rels["End Page"] >= rels["Start Page"]]

# Each relationship expands to (End - Start + 1) rows instead of 1
expected_expanded_rows = (valid_ranges["End Page"] - valid_ranges["Start Page"] + 1).sum()

# Net rows added by expansion
expected_rows_added_by_expansion = expected_expanded_rows - len(valid_ranges)

print("Relationships with valid page ranges:", len(valid_ranges))
print("EXPECTED rows after page expansion:", expected_expanded_rows)
print("EXPECTED rows ADDED by page expansion:", expected_rows_added_by_expansion)

# --- Reciprocal Rule Diagnostics ---

rels_reciprocal = rels[rels["Is Reciprocal?"] == 1]

print("Relationships marked reciprocal:", len(rels_reciprocal))

expected_reciprocal_edges = len(rels_reciprocal)

print("EXPECTED reciprocal-generated edges:", expected_reciprocal_edges)

# --- Reciprocal Rule Diagnostics ---

rels_reciprocal = rels[rels["Is Reciprocal?"] == 1]

print("Relationships marked reciprocal:", len(rels_reciprocal))

expected_reciprocal_edges = len(rels_reciprocal)

print("EXPECTED reciprocal-generated edges:", expected_reciprocal_edges)


#How many additional rows for follow the narrator rule
#Which rows have narrators
rels_narrated = rels[rels["Narrator"] != "[NULL]"]

print("Narrated relationships:", len(rels_narrated))
print("Non-narrated relationships:", len(rels) - len(rels_narrated))

#Which rows qualify for the Follow the narrator rule
qualifies_fn = rels_narrated[
    (rels_narrated["Narrator"] != rels_narrated["Character 1"]) &
    (rels_narrated["Narrator"] != rels_narrated["Character 2"])
]

print("Qualifying Follow-the-Narrator relationships:", len(qualifies_fn))
expected_narrator_edges = 2 * len(qualifies_fn)

print("EXPECTED narrator-generated edges:", expected_narrator_edges)

def generate_narrator_edges(df):
    rows = []
    for _, r in df.iterrows():
        narrator = r["Narrator"]
        rows.append({
            "Character 1": narrator,
            "Character 2": r["Character 1"],
            "category": "Knows of",
            "startPage": r["Start Page"],
            "endPage": r["End Page"],
            "generated_by": "NarratorRule"
        })
        rows.append({
            "Character 1": narrator,
            "Character 2": r["Character 2"],
            "category": "Knows of",
            "startPage": r["Start Page"],
            "endPage": r["End Page"],
            "generated_by": "NarratorRule"
        })
    return pd.DataFrame(rows)

narrator_edges = generate_narrator_edges(qualifies_fn)

print("Actual generated narrator edges:", len(narrator_edges))

#No Duplicates Rule
before = len(narrator_edges)

narrator_edges_dedup = narrator_edges.drop_duplicates(
    subset=["Character 1", "Character 2", "category", "startPage"]
)

after = len(narrator_edges_dedup)

print("Narrator edges before dedup:", before)
print("Narrator edges after dedup:", after)
print("Dropped as duplicates:", before - after)

#Priority Rule
priority = {"Exchange": 0, "Knows": 1, "Knows of": 2}

combined = pd.concat([
    rels.assign(source="Original"),
    narrator_edges_dedup.assign(source="NarratorRule")
])

combined["priority"] = combined["category"].map(priority)

survivors = (
    combined.sort_values("priority")
            .drop_duplicates(
                subset=["Character 1", "Character 2", "startPage"],
                keep="first"
            )
)

print("Narrator edges surviving priority filter:",
      (survivors["source"] == "NarratorRule").sum())



# --- Priority Rule + Final Duplicate Deletion Diagnostics ---

# Normalize original relationships to match narrator-generated schema
base_rows = rels.rename(columns={
    "Type of Relationship": "category",
    "Start Page": "startPage",
    "End Page": "endPage"
})[
    ["Character 1", "Character 2", "category", "startPage"]
].assign(source="Original")

# Narrator rows already normalized
narrator_rows = narrator_edges_dedup[[
    "Character 1", "Character 2", "category", "startPage"
]].assign(source="NarratorRule")

# Combine all candidate relationships
combined = pd.concat([base_rows, narrator_rows], ignore_index=True)

# Apply same priority ordering as production
priority = {"Exchange": 0, "Knows": 1, "Knows of": 2}
combined["priority"] = combined["category"].map(priority)

# Count rows before priority filtering
before_priority = len(combined)

# Apply priority rule and drop duplicates
survivors = (
    combined
    .sort_values("priority")
    .drop_duplicates(
        subset=["Character 1", "Character 2", "startPage"],
        keep="first"
    )
)

after_priority = len(survivors)

print("\n--- Final Priority + Dedup Diagnostics ---")
print("Rows before priority filter:", before_priority)
print("Rows after priority filter:", after_priority)
print("Rows dropped by priority + dedup:", before_priority - after_priority)

# --- Expected vs Actual StorySpace Diagnostics ---

actual_storyspace_rows = len(storyspace_df)

print("\n--- StorySpace Final Check ---")
print("EXPECTED survivor rows (after priority & dedup):", after_priority)
print("ACTUAL StorySpace rows:", actual_storyspace_rows)
print(
    "DIFFERENCE (actual - expected):",
    actual_storyspace_rows - after_priority
)
