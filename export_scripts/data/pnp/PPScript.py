import pandas as pd

# csv files for all Pride and Prejudice data
originalChars = pd.read_csv('OriginalPnP/PnPOriginalNodes8-5.csv')
newChars = pd.read_csv('dump/narratives_pnp_characters.csv')

# Merge based on matching names (Perform a full outer join on the name/label columns)
merged = pd.merge(
    originalChars[['id', 'Label']],
    newChars[['id', 'Name']],
    left_on='Label',
    right_on='Name',
    how='outer'
)

# Fill in the name/label column from either source
merged['Name/Label'] = merged['Label'].combine_first(merged['Name'])

# Rename columns for clarity
merged = merged.rename(columns={
    'id_x': 'Original id',
    'id_y': 'New id'
})

# Select and reorder the desired columns
final_df = merged[['Original id', 'New id', 'Name/Label']]

# Save the result to a CSV file in the 'pnp' directory
final_df.to_csv('PnPmerged_characters.csv', index=False)

print("✅ Merged CSV file saved as 'data/pnp/merged_characters.csv'")

# Make a copy to avoid SettingWithCopyWarning
final_df = final_df.copy()

# Create a new 'id' column: prefer 'Original id', fall back to 'New id'
final_df['id'] = final_df['Original id'].combine_first(final_df['New id'])

# Create the final DataFrame with only 'id' and 'label'
final_chars_df = final_df[['id', 'Name/Label']].rename(columns={'Name/Label': 'label'})

# Save to FinalPnPChars.csv
final_chars_df.to_csv('FinalPnPChars.csv', index=False)

print("✅ FinalPnPChars.csv created with columns 'id' and 'label'.")



