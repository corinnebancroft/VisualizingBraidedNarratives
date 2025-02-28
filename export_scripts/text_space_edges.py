import itertools
from datetime import datetime

import pandas as pd

# Read the final data

df_og = pd.read_csv('data/tt/ExportsFeb26/tt_exports_TWICE_processed_final_20250227-16H30M.csv')

char1_tuples = df_og.groupby(by='startPage')['source'].apply(list)
char2_tuples = df_og.groupby(by='startPage')['target'].apply(list)

df = pd.concat([char1_tuples, char2_tuples], axis=1)

s = df['source'] + df['target']

# Create the dictionary using list comprehension
result = {i: list(set(value)) for i, value in s.items()}

# final_df = pd.DataFrame(columns=['source', 'target', 'startPage'])

i = 0
rows_human_list = []
rows_gephi_list = []

# now append each permutation of a tuple as an entry on a given page
for page_num, characters in result.items():
    # Generate all unique tuple permutations
    permutations = set(itertools.combinations(characters, 2))
    # Convert to a list if you prefer to work with a list of tuples
    permutations = list(permutations)

    for permutation in permutations:
        # Extracting character names from df_og for the source and target
        char1_name_series = df_og.loc[df_og['source'] == permutation[0], 'Character 1 <br />(choose)']

        if not char1_name_series.empty:
            char1_name = char1_name_series.iloc[0]
        else:
            char1_name = df_og.loc[df_og['target'] == permutation[0], 'Character 2 <br />(choose)'].iloc[0]

        char2_name_series = df_og.loc[df_og['target'] == permutation[1], 'Character 2 <br />(choose)']

        if not char2_name_series.empty:
            char2_name = char2_name_series.iloc[0]
        else:
            char2_name = df_og.loc[df_og['source'] == permutation[1], 'Character 1 <br />(choose)'].iloc[0]

        row_human_dict = {'source': permutation[0], 'target': permutation[1], 'Char 1 Name': char1_name,
                    'Char 2 Name': char2_name, 'startPage': page_num, 'type': 'Undirected', 'weight': 1}

        row_gephi_dict = {'source': permutation[0], 'target': permutation[1], 'startPage': page_num, 'type': 'Undirected', 'weight': 1}


        i += 1
        rows_human_list.append(row_human_dict)
        rows_gephi_list.append(row_gephi_dict)

final_human_df = pd.DataFrame(rows_human_list)
final_gephi_df = pd.DataFrame(rows_gephi_list)

date = datetime.now().strftime("%Y%m%d-%HH%MM")
final_human_df.to_csv(f'data/tt/ExportsFeb26/tt_exports_text_human_space_edges_{date}.csv', index=False)
final_gephi_df.to_csv(f'data/tt/ExportsFeb26/tt_exports_text_gephi_space_edges_{date}.csv', index=False)