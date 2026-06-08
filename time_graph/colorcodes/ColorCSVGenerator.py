import pandas as pd
import os
from pathlib import Path

# Get the directory where the script is located
base_dir = Path(__file__).parent

# Create output folder
output_dir = base_dir / "colorcodes"
output_dir.mkdir(exist_ok=True)

# Loop through all files in the directory
for file in base_dir.iterdir():
    if file.is_file() and "input.csv" in file.name:
        print(f"Processing {file.name}")

        # Read CSV
        df = pd.read_csv(file)

        # --- Extract narrators ---
        if 'Narrator' in df.columns:
            narrators = df['Narrator'].dropna().unique()
        else:
            narrators = []

        # --- Extract characters ---
        participating_character_columns = df.columns[15:]
        characters = sorted(participating_character_columns)

        # --- Combine and deduplicate ---
        all_names = sorted(set(narrators).union(characters))

        # --- Create output DataFrame ---
        out_df = pd.DataFrame(all_names, columns=['name'])

        # --- Build output filename ---
        # Extract prefix (e.g., "de" from "deinput.csv")
        prefix = file.name.split("input.csv")[0]
        output_file = output_dir / f"{prefix}color.csv"

        # --- Save CSV ---
        out_df.to_csv(output_file, index=False)

        print(f"Saved {output_file}")

print("✅ All files processed.")