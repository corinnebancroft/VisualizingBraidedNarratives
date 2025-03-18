import pandas as pd

# Read the CSV file
input_file = 'data/gs/Mar12/GSGephiReadyMar12/GSStorySpaceEdgesMar12.csv'
df = pd.read_csv(input_file)

# Filter the data where category is 'Exchange'
filtered_df = df[df['category'] == 'Exchange']

# Write the filtered data to a new CSV file
output_file = 'data/gs/Mar12/GSGephiReadyMar12/GSExchangesOnlyMar12.csv'
filtered_df.to_csv(output_file, index=False)

print(f"Filtered data has been written to {output_file}.")