import pandas as pd

# Load the nodes and edges CSV files
nodes_df = pd.read_csv('PoDNodesMar52025.csv')
edges_df = pd.read_csv('Shamengwa2Mar62025.csv')

# Get the unique ids and labels from the edges dataframe
unique_ids = pd.unique(edges_df[['source', 'target']].values.ravel('K'))
unique_labels = pd.unique(edges_df[['Character 1 <br />(choose)', 'Character 2 <br />(choose)']].values.ravel('K'))

# Filter the nodes dataframe to include only the rows with ids in unique_ids
filtered_nodes_df = nodes_df[nodes_df['id'].isin(unique_ids)]

# Save the filtered nodes dataframe to a new CSV file
filtered_nodes_df.to_csv('NewFile.csv', index=False)

print("The new 'nodes.csv' with only the 'id' and 'label' that appear in 'source', 'target', 'Character 1 <br />(choose)', and 'Character 2 <br />(choose)' of the 'edges.csv' has been successfully created.")