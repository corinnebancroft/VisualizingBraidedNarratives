from datetime import datetime

import pandas as pd

import itertools

# Read three dataframes, one for each of characters, containers, and relationships tables exported from the DB

df_chars = pd.read_csv('data/gs/Mar12/GSCharsMar12.csv')
df_conts = pd.read_csv('data/gs/Mar12/GSContsMar12.csv')
df_rels = pd.read_csv('data/gs/Mar12/GSRelsMar12.csv')

# merge the containers and relationships "on the right": using keys from the right dataframe
# and also do the merge based on the mutual column named "Narrative Container". Use "_cont" and "_rels" suffixes for the
# replica columns after the merge so we can keep track of where they came from.
# this is our working table, from which we generate reciprocals and follows-narrator relationships
rels = pd.merge(df_conts, df_rels, how='right', left_on='Title <br />(100 chars)',
                right_on='Narrative Container <br />(choose)', suffixes=('_cont', '_rel'))

# only select page 214
# rels = rels.loc[rels["Start Page_rel"] == 129]
# rels = rels.loc[rels["End Page_rel"] == 129]

## FOR THE RECIPROCAL RULE

# get a list of all the column headers from the new, merged "rels" dataframe
col_list = list(rels)

# swap the Char 1 and Char 2 columns, since we are going to be generating reciprocal relationships
col_list[10], col_list[11] = col_list[11], col_list[10]

# retrieve all rows of the "rels" table (i.e. dataframe) where the "Is Reciprocal? <br />(choose)" columns is set to
# "1" (so TRUE) note that this retrieval ALSO generates a dataframe. We want that, because at the end,
# after we generate all the reciprocal and "follows-narrator" rule relationships, we are going to merge all three tables
rels_add_recip = rels.loc[rels["Is Reciprocal? <br />(choose)"] == 1]

# set the column headers to swapped headers we generated above
rels_add_recip.columns = col_list

## FOR THE FOLLOWS-NARRATOR RULE

# select all rows from the "rels" table where the narrator is not "NULL"
rels_add_narrator = rels.loc[rels["Narrator <br />(choose)"] != '[NULL]']

# same columns as the original table
rels_add_narrator.columns = rels.columns

# for each occurrence of a "narrated" relationship, generate TWO additional relationships.
# One "knows of" relationship from Narrator -> Character 1,
# and one "knows of" relationship from Narrator -> Character 2
rels_add_narrator = pd.concat([rels_add_narrator] * 2, ignore_index=True).sort_values(by='id_rel').reset_index()

# these new relationships are NOT reciprocal
rels_add_narrator["Is Reciprocal? <br />(choose)"] = 0

# set the relationship type to "knows of"
rels_add_narrator["Type of Relationship <br />(choose)"] = "Knows of"

# above, I've created TWO additional relationships for EACH "narrated" relationship.
# Now, I have to correctly set Character 1 and Character 2 in these generated relationships.
# Below, what I'm doing is setting the EVEN replica to be the Narrator -> Character 1 relationship
# and I'm setting the ODD replica to be the Narrator -> Character 2 relationship
for i, row in rels_add_narrator.iterrows():
    if i % 2 == 0:
        # this creates a relationship between Narrator and Char 1
        if row['Narrator <br />(choose)'] not in row['Character 1 <br />(choose)']:
            temp = row['Character 1 <br />(choose)']
            row['Character 1 <br />(choose)'] = row['Narrator <br />(choose)']
            row['Character 2 <br />(choose)'] = temp
    else:
        # this creates a relationship between Narrator and Char 2
        if row["Narrator <br />(choose)"] not in row['Character 2 <br />(choose)']:
            row['Character 1 <br />(choose)'] = row['Narrator <br />(choose)']

    # this line adds the newly edited 'row' from above to the correct location in the add_narrator dataframe
    rels_add_narrator.loc[i] = row

# I'm dropping duplicates in the populated "add_narrator" dataframe based on whether the values in a subset of
# columns are the same. For this purpose, I'm considering two entries identical IF Char 1, Char 2,
# Type of Relationship, Reciprocity, Start Pg, and End Page are ALL the same.
rels_add_narrator = rels_add_narrator.drop_duplicates(
    subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'Type of Relationship <br />(choose)',
            'Is Reciprocal? <br />(choose)', 'Start Page_rel', 'End Page_rel'])

# I'm merging the original entries in the "rels" dataframe with the "add_narrator" relationships I've generated above,
# and the "add_reciprocal" relationships I've generated before that.
frames = [rels, rels_add_narrator, rels_add_recip]

# I'm dropping duplicate lines again
rels_final_df = pd.concat(frames).drop_duplicates()

# find and insert IDs for char 1 and char 2 based on the chars table
temp_chars_extended = pd.merge(df_chars, rels_final_df, how='right', left_on='Name <br />(100 chars)',
                               right_on='Character 1 <br />(choose)')
temp_chars_extended.rename(columns={"id": "source"}, inplace=True)
final_df = pd.merge(df_chars, temp_chars_extended, how='right', left_on='Name <br />(100 chars)',
                    right_on='Character 2 <br />(choose)', suffixes=('_l', '_r'))

# getting the current DATETIME in a string to print files with a timestamp
date = datetime.now().strftime("%Y%m%d-%HH%MM")

# dropping duplicates again from the final DF (dataframe)
final_df = final_df.drop_duplicates(
    subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'Type of Relationship <br />(choose)',
            'Is Reciprocal? <br />(choose)', 'Start Page_rel', 'End Page_rel'])

# finally, write a human-readable output to CSV
#final_df.to_csv(f'data/gs/Mar12/GSHuman{date}.csv', index=False)

## Below is various finagling to make sure the output is Gephi-compatible, and mostly consists of renaming columns
## and dropping columns that are unnecessary for the Gephi output

final_df.rename(columns={"id": "target"}, inplace=True)
final_df.drop(columns=["Name <br />(100 chars)_r", "Name <br />(100 chars)_l"], inplace=True)

# this splits up the relationships so that they repeat for on each page they occur
final_df = final_df.loc[final_df.index.repeat(final_df['End Page_rel'] - final_df['Start Page_rel'] + 1)]
final_df['Start Page_rel'] = final_df.groupby(level=0).cumcount() + final_df['Start Page_rel']
final_df['End Page_rel'] = final_df['Start Page_rel']
final_df = final_df.drop_duplicates(
    subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'Type of Relationship <br />(choose)',
            'Is Reciprocal? <br />(choose)', 'Start Page_rel', 'End Page_rel'])

final_df.rename(columns={"Start Page_rel": "startPage"}, inplace=True)
final_df.rename(columns={"Type of Relationship <br />(choose)": "category"}, inplace=True)
final_df.drop(columns=["id_cont", "Title <br />(100 chars)", "Level <br />(choose)", "Start Page_cont",
                       "End Page_cont", "Narrator <br />(choose)", "Protagonist <br />(choose)",
                       "Embed. Type <br />(choose)", "id_rel", "Is Reciprocal? <br />(choose)",
                       "Narrative Container <br />(choose)", "End Page_rel", "index"], inplace=True)

# note that the source and target values are floats because there are NaN values. This is a pandas gotcha.
# need to test if this will work with Gephi
final_df["weight"] = 1
final_df["type"] = "Directed"
final_df = final_df[['source', 'target', 'Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'type', 'weight', 'startPage', 'category']]

df = final_df

# this script removes some "duplicated" relationships by ranking the relationships in terms of specificity.
# for example, if you have an "Exchange", a "Knows" and also a "Knows of" relationship between Char A and Char B,
# only the "Exchange" will be kept. If there is a "Knows" and also a "Knows of", the "Knows" will be kept.
# I'm making use of pandas.Categorical to preferentially rank the relationships, and then removing overlapping relationships.

df_no_duplicates = df[~df.duplicated(
    subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category'])].sort_values(by=[
    'Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])

# categorical sorting and ranking of all relationships based on priority order
df_no_duplicates["category"] = pd.Categorical(df_no_duplicates["category"], categories=["Exchange", "Knows", "Knows of"], ordered=True)

#dropping duplicates, retaining highest priority
df_no_duplicates = df_no_duplicates.sort_values(by=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category']).drop_duplicates(subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])

# df_no_duplicates = df_no_duplicates.drop(columns=['Character 1 <br />(choose)', 'Character 2 <br />(choose)'])
date = datetime.now().strftime("%Y%m%d-%HH%MM")
df_no_duplicates.to_csv(f'data/gs/Mar27/gs_StorySpaceEdges_{date}.csv', index=False)

df_og = df_no_duplicates

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
    # Generate all unique tuple combinations
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
final_human_df.to_csv(f'data/gs/Mar27/gs_exports_text_human_space_edges_{date}.csv', index=False)
#final_gephi_df.to_csv(f'data/gs/Mar12/gs_exports_text_gephi_space_edges_{date}.csv', index=False)

df = df_no_duplicates
# Filter the data where category is 'Exchange'
filtered_df = df[df['category'] == 'Exchange']

# Write the filtered data to a new CSV file
output_file = 'data/gs/Mar27/GSExchangesOnlyMar12.csv'
filtered_df.to_csv(output_file, index=False)

