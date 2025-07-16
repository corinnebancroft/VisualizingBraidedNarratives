#This script combines the data from the 2 datasets

import pandas as pd

# Define the page ranges to keep
page_ranges = [(1, 130), (164, 172), (184, 189), (204, 207), (233, 247)]

# Define the list of file pairs and output paths
file_pairs = [
    {
        'input_file': 'OriginalPnP/PnP_edges.csv',
        'second_file': 'July12Exports/pnp_StorySpaceEdges_20250713-11H17M.csv',
        'output_file': 'July13Exports/StorySpaceEdges.csv'
    },
    {
        'input_file': 'OriginalPnP/PnP_edgesAllCharsOnPage3col.csv',
        'second_file': 'July12Exports/pnpTextSpaceEdges_20250713-11H17M.csv',
        'output_file': 'July13Exports/TextSpaceEdges.csv'
    },
    {
        'input_file': 'OriginalPnP/PnP_edgesExchangesOnly.csv',
        'second_file': 'July12Exports/pnpExchangesOnlyJune24.csv',
        'output_file': 'July13Exports/ExchangesOnlyEdges.csv'
    },
    # Add more file pairs as needed
]

# Loop through each file pair
for pair in file_pairs:
    # Read the CSV files
    df = pd.read_csv(pair['input_file'])
    second_df = pd.read_csv(pair['second_file'])

    # Filter rows based on the startPage column
    filtered_df = df[df['startPage'].apply(
        lambda x: any(start <= x <= end for start, end in page_ranges)
    )]

    # Combine the filtered DataFrame with the second one
    combined_df = pd.concat([filtered_df, second_df], ignore_index=True)

    # Replace specific values in the 'category' column, if it exists
    if 'category' in combined_df.columns:
        combined_df['category'] = combined_df['category'].replace(
            {'Knows': 'Relationship', 'Knows of': 'Relationship'}
        )

    # Sort the combined DataFrame by 'startPage' in ascending order
    combined_df = combined_df.sort_values(by='startPage').reset_index(drop=True)

    # Save the combined DataFrame to a new CSV file
    combined_df.to_csv(pair['output_file'], index=False)

    print(f"Processed and saved: {pair['output_file']}")

