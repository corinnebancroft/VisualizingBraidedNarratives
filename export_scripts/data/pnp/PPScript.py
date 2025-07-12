import pandas as pd

# csv files for all Pride and Prejudice data
originalChars = pd.read_csv('OriginalPnP/PnP_nodesInOrder.csv')
newChars = pd.read_csv('dump/narratives_pnp_characters.csv')
newRels = pd.read_csv('dump/narratives_pnp_relationships.csv')

# Merge based on matching names
merged = pd.merge(
    originalChars[['id', 'Label']],
    newChars[['id', 'Name']],
    left_on='Label',
    right_on='Name',
    how='inner'
)

# Rename columns for clarity
merged = merged.rename(columns={
    'id_x': 'Original id',
    'id_y': 'New id',
    'Label': 'Name/Label'
})

# Select only the required columns
final_df = merged[['Original id', 'New id', 'Name/Label']]

# Save the result to a CSV file in the 'pnp' directory
final_df.to_csv('PnPmerged_characters.csv', index=False)

print("✅ Merged CSV file saved as 'data/pnp/merged_characters.csv'")

