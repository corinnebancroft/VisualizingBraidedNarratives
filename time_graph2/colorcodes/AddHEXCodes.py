#This script adds HEX codes to the color key files for the time graphs.
import os
import pandas as pd

# Color → HEX mapping (all lowercase keys)
color_map = {
    "red": "#FF0000",
    "pink": "#d6769e",
    "salmon": "#e5b4af",
    "orange": "#FFA500",
    "peach": "#FFD1A6",
    "medium orange": "#ffda00",
    "yellow": "#FFFF00",
    "butter": "#FFF2A8",
    "pale yellow": "#d2e49d",
    "chartreuse": "#C9FF00",
    "green": "#00FF00",
    "mint": "#98FFB3",
    "dark green": "#006400",
    "teal": "#008080",
    "blue": "#2891ff",
    "cyan": "#00FFFF",
    "dark blue": "#1d4da1",
    "baby blue": "#89CFF0",
    "violet": "#bdb4f9",
    "purple": "#8D01FF",
    "magenta": "#FF00FF",
    "maroon": "#800000",
    "lavender": "#E6CCFF",
    "gray": "#C0C0C0",
}

# Get current folder
folder_path = os.path.dirname(os.path.abspath(__file__))

# Process each CSV file
for filename in os.listdir(folder_path):
    if filename.endswith(".csv"):
        file_path = os.path.join(folder_path, filename)

        # Read CSV
        df = pd.read_csv(file_path)

        # Normalize column names
        cols = {col.lower(): col for col in df.columns}

        if "name" not in cols or "color" not in cols:
            print(f"Skipping {filename}: missing required columns")
            continue

        # Get actual column names
        name_col = cols["name"]
        color_col = cols["color"]

        # Create HEX Code column
        df["HEX Code"] = df[color_col].str.lower().map(color_map)

        # Rename columns to required format
        df.rename(columns={
            name_col: "Name",
            color_col: "Color"
        }, inplace=True)

        # Keep only desired columns and order
        df = df[["Name", "Color", "HEX Code"]]

        # Save (overwrite original)
        df.to_csv(file_path, index=False)

        print(f"Processed: {filename}")
