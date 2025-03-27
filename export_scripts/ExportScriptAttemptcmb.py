from datetime import datetime  # Import the datetime module to work with dates and times
import pandas as pd  # Import the pandas library for data manipulation and analysis

def read_data():
    df_chars = pd.read_csv('data/gs/Mar12/GSCharsMar12.csv')
    df_conts = pd.read_csv('data/gs/Mar12/GSContsMar12.csv')
    df_rels = pd.read_csv('data/gs/Mar12/GSRelsMar12.csv')
    return df_chars, df_conts, df_rels

def merge_data(df_conts, df_rels):
    return pd.merge(df_conts, df_rels, how='right', left_on='Title <br />(100 chars)',
                    right_on='Narrative Container <br />(choose)', suffixes=('_cont', '_rel'))

def generate_reciprocal_relationships(rels):
    col_list = list(rels)
    col_list[10], col_list[11] = col_list[11], col_list[10]
    rels_add_recip = rels.loc[rels["Is Reciprocal? <br />(choose)"] == 1].copy()
    rels_add_recip.columns = col_list
    return rels_add_recip

def generate_follows_narrator_relationships(rels):
    rels_add_narrator = rels.loc[rels["Narrator <br />(choose)"] != '[NULL]'].copy()
    rels_add_narrator.columns = rels.columns
    rels_add_narrator = pd.concat([rels_add_narrator] * 2, ignore_index=True).sort_values(by='id_rel').reset_index(
        drop=True)
    rels_add_narrator["Is Reciprocal? <br />(choose)"] = 0
    rels_add_narrator["Type of Relationship <br />(choose)"] = "Knows of"

    for i in range(0, len(rels_add_narrator), 2):
        rels_add_narrator.at[i, 'Character 1 <br />(choose)'], rels_add_narrator.at[i, 'Character 2 <br />(choose)'] = \
            rels_add_narrator.at[i, 'Narrator <br />(choose)'], rels_add_narrator.at[i, 'Character 1 <br />(choose)']
        rels_add_narrator.at[i + 1, 'Character 1 <br />(choose)'] = rels_add_narrator.at[
            i + 1, 'Narrator <br />(choose)']

    return rels_add_narrator.drop_duplicates(
        subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'Type of Relationship <br />(choose)',
                'Is Reciprocal? <br />(choose)', 'Start Page_rel', 'End Page_rel'])

def merge_all_relationships(rels, rels_add_recip, rels_add_narrator):
    frames = [rels, rels_add_recip, rels_add_narrator]
    return pd.concat(frames).drop_duplicates()

def add_character_ids(df_chars, rels_final_df):
    temp_chars_extended = pd.merge(df_chars, rels_final_df, how='right', left_on='Name <br />(100 chars)',
                                   right_on='Character 1 <br />(choose)')
    temp_chars_extended.rename(columns={"id": "source"}, inplace=True)
    final_df = pd.merge(df_chars, temp_chars_extended, how='right', left_on='Name <br />(100 chars)',
                        right_on='Character 2 <br />(choose)', suffixes=('_l', '_r'))
    return final_df

def prepare_final_output(final_df):
    final_df = final_df.copy()  # Ensure we're working with a copy to avoid SettingWithCopyWarning
    final_df.rename(columns={"id": "target"}, inplace=True)
    final_df.drop(columns=["Name <br />(100 chars)_r", "Name <br />(100 chars)_l"], inplace=True)
    final_df = final_df.loc[final_df.index.repeat(final_df['End Page_rel'] - final_df['Start Page_rel'] + 1)]
    final_df['Start Page_rel'] = final_df.groupby(level=0).cumcount() + final_df['Start Page_rel']
    final_df['End Page_rel'] = final_df['Start Page_rel']
    final_df = final_df.drop_duplicates(
        subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'Type of Relationship <br />(choose)',
                'Is Reciprocal? <br />(choose)', 'Start Page_rel', 'End Page_rel'])
    final_df.rename(columns={"Start Page_rel": "startPage", "Type of Relationship <br />(choose)": "category"},
                    inplace=True)
    final_df.drop(columns=["id_cont", "Title <br />(100 chars)", "Level <br />(choose)", "Start Page_cont",
                           "End Page_cont", "Narrator <br />(choose)", "Protagonist <br />(choose)",
                           "Embed. Type <br />(choose)", "id_rel", "Is Reciprocal? <br />(choose)",
                           "Narrative Container <br />(choose)", "End Page_rel", "index"], inplace=True,
                  errors='ignore')
    final_df["weight"] = 1
    final_df["type"] = "Directed"
    final_df = final_df[
        ['source', 'target', 'Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'type', 'weight', 'startPage',
         'category']]
    return final_df

def remove_duplicates(df):
    """
    Remove duplicated relationships based on specificity and retain the highest priority relationship.
    """
    # Remove duplicated relationships based on specific columns
    df_no_duplicates = df[~df.duplicated(
        subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category'])].copy()

    # Categorical sorting and ranking of all relationships based on priority order
    df_no_duplicates.loc[:, "category"] = pd.Categorical(df_no_duplicates["category"], categories=["Exchange", "Knows", "Knows of"], ordered=True)

    # Drop duplicates, retaining the highest priority relationship
    df_no_duplicates = df_no_duplicates.sort_values(by=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category']).drop_duplicates(subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])

    return df_no_duplicates

def main():
    df_chars, df_conts, df_rels = read_data()
    rels = merge_data(df_conts, df_rels)
    rels_add_recip = generate_reciprocal_relationships(rels)
    rels_add_narrator = generate_follows_narrator_relationships(rels)
    rels_final_df = merge_all_relationships(rels, rels_add_recip, rels_add_narrator)
    final_df = add_character_ids(df_chars, rels_final_df)
    final_df = prepare_final_output(final_df)
    final_df = remove_duplicates(final_df)

    # Generate the current date and time in the specified format
    date = datetime.now().strftime("%Y%m%d-%HH%MM")

    # Save the processed DataFrame to a new CSV file with the current date and time in the filename
    final_df.to_csv(f'data/gs/Mar26/gs_exports_TWICE_processed_final_{date}.csv', index=False)

if __name__ == "__main__":
    main()