import pandas as pd

# Load the nodes and edges CSV files
nodes_df = pd.read_csv('DemolitionNovelNodesMar62025.csv')
edges_df = pd.read_csv('Demolition2Mar62025.csv')

# Function to find and replace 'id' and 'label' in nodes and edges dataframes
def find_and_replace_multiple(nodes_df, edges_df, replacements):
    for old_id, new_id, new_label in replacements:
        # Replace in nodes dataframe
        nodes_df.loc[nodes_df['id'] == old_id, 'id'] = new_id
        nodes_df.loc[nodes_df['id'] == new_id, 'label'] = new_label

        # Replace in edges dataframe
        edges_df.loc[edges_df['source'] == old_id, 'source'] = new_id
        edges_df.loc[edges_df['target'] == old_id, 'target'] = new_id
        edges_df.loc[edges_df['Character 1 <br />(choose)'] == old_id, 'Character 1 <br />(choose)'] = new_label
        edges_df.loc[edges_df['Character 2 <br />(choose)'] == old_id, 'Character 2 <br />(choose)'] = new_label

    # Ensure the 'label' column is updated correctly in nodes_df
    for _, new_id, new_label in replacements:
        nodes_df.loc[nodes_df['id'] == new_id, 'label'] = new_label

    # Debugging: Print intermediate results
    print("Nodes DataFrame after replacements:")
    print(nodes_df.head())
    print("Edges DataFrame after replacements:")
    print(edges_df.head())

# List of replacements: (old_id, new_id, new_label)
replacements = [
    (334, 480, "Sprecht"),
    (4, 481, "Narrator"),
    (250, 482, "C.'s Patients"),
    (338, 483, "C.'s Receptionist"),
    (6, 484, "C."),
    (281, 485, "Narrator's Mother"),
    (225, 486, "Narrator's Father"),
]

find_and_replace_multiple(nodes_df, edges_df, replacements)

# Save the updated dataframes back to CSV files
nodes_df.to_csv('DemolitionStoryNodesMar182025.csv', index=False)
edges_df.to_csv('DemolitionStoryEdgesMar182025.csv', index=False)

print("The 'id' values and their corresponding 'label' have been successfully updated in both spreadsheets.")