import pandas as pd

# Load the CSV files
file1 = 'Satan1-2Mar62025.csv'
file2 = 'Satan2Mar62025.csv'

df1 = pd.read_csv(file1)
df2 = pd.read_csv(file2)

# Concatenate the dataframes
merged_df = pd.concat([df1, df2])

# Save the merged dataframe to a new CSV file
merged_df.to_csv('SatanCompleteNovelMar14.csv', index=False)

print("Files merged successfully!")