import pandas as pd
import os

# Define folders
source_folder = 'July26GephiReadyExports'       # Folder where your original CSVs are
destination_folder = 'Aug5GephiReadyExports'    # Folder where cleaned CSVs will be saved

# Make sure the destination folder exists
os.makedirs(destination_folder, exist_ok=True)

# File paths
main_file = 'FinalPnPChars.csv'  # The file with "id" and "names"
other_files = ['StorySpaceEdges.csv', 'ExchangesOnlyEdges.csv', 'TextSpaceEdges.csv']  # The files with "source" and "target"

# Read valid IDs from the main file
main_df = pd.read_csv(main_file)
valid_ids = set(main_df['id'])

# Process each file
for filename in other_files:
    file_path = os.path.join(source_folder, filename)
    df = pd.read_csv(file_path)

    # Find missing IDs
    missing_sources = set(df['source']) - valid_ids
    missing_targets = set(df['target']) - valid_ids

    if missing_sources or missing_targets:
        print(f"\nMissing IDs in {filename}:")
        if missing_sources:
            print(f"  Missing 'source' IDs: {sorted(missing_sources)}")
        if missing_targets:
            print(f"  Missing 'target' IDs: {sorted(missing_targets)}")
    else:
        print(f"\nAll IDs in {filename} are valid.")

    # Remove rows with invalid source or target IDs
    cleaned_df = df[df['source'].isin(valid_ids) & df['target'].isin(valid_ids)]

    # Save cleaned file to destination folder with same filename
    cleaned_path = os.path.join(destination_folder, filename)
    cleaned_df.to_csv(cleaned_path, index=False)

    print(f"  Cleaned file saved as: {cleaned_path}")
    print(f"  Rows before cleaning: {len(df)}")
    print(f"  Rows after cleaning: {len(cleaned_df)}")
    print(f"  Rows removed: {len(df) - len(cleaned_df)}")
