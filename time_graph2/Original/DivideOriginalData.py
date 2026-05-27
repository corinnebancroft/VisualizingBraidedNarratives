import pandas as pd

# -----------------------------
# 1. Load CSVs
# -----------------------------
mergedData = pd.read_csv("Merged_Output.csv")
participatingCharacters = pd.read_csv("participatingcharacters.csv")

# Columns to keep
cols = [
    "Novel_x",
    "Relative Order", "Event Name", "Start Date", "End Date",
    "Is Approximate?", "Narrator", "Start Page", "End Page",
    "Start Date TT", "End Date TT", "Start Page TT", "End Page TT",
    "Is Approximate TT?", "Evidence"
]

filtered_df = mergedData[cols]

novel_dfs = {
    novel: df.reset_index(drop=True)
    for novel, df in filtered_df.groupby("Novel_x")
}

# -----------------------------
# Add Participating Characters
# -----------------------------

for novel, df in novel_dfs.items():
    # Loop through each row in participatingCharacters
    for _, row in participatingCharacters.iterrows():
        event = row["Event"]
        character = row["Character"]

        # Find matching rows in the novel dataframe
        mask = df["Event Name"] == event

        if mask.any():
            # Create column if it doesn't exist
            if character not in df.columns:
                df[character] = ""

            # Mark matching rows with "T"
            df.loc[mask, character] = "T"

    # Save updated dataframe back
    novel_dfs[novel] = df

# Insert "Participating Characters" column after "Evidence"
for novel, df in novel_dfs.items():
    if "Evidence" in df.columns:
        evidence_index = df.columns.get_loc("Evidence")

        # Insert new column right after "Evidence"
        df.insert(evidence_index + 1, "Participating Characters", "")

    novel_dfs[novel] = df

# -----------------------------
# Assign Relative Order
# -----------------------------

for novel, df in novel_dfs.items():
    # Sort by Start Date
    df = df.sort_values(by="Start Date").reset_index(drop=True)

    # Get unique events in order of appearance
    unique_events = df["Event Name"].drop_duplicates()

    # Create mapping: Event Name → order number
    event_order_map = {event: i + 1 for i, event in enumerate(unique_events)}

    # Assign Relative Order using the mapping
    df["Relative Order"] = df["Event Name"].map(event_order_map)

    # Save back
    novel_dfs[novel] = df

# -----------------------------
# Export Dataframes
# -----------------------------

# Mapping of novel names to filenames
file_map = {
    "Emma's The History of Love": "etholinput.csv",
    "Pride and Prejudice": "ppinput.csv",
    "Rowan's History of Love": "tholinput.csv",
    "The Bluest Eye": "beinput.csv",
    "The Sound and the Fury": "tsatf2input.csv"
}

# Export each dataframe without "Novel_x"
for novel, filename in file_map.items():
    if novel in novel_dfs:
        df = novel_dfs[novel].drop(columns=["Novel_x"])
        df.to_csv(filename, index=False)
        print(f"Saved: {filename}")
    else:
        print(f"Warning: {novel} not found in data")




