from datetime import datetime

import pandas as pd

# Read the final data

df = pd.read_csv('data/tt/ExportsFeb26/tt_exports_processed_gephi_interm_final_20250227-16H29M.csv')

# this script removes some "duplicated" relationships by ranking the relationships in terms of specificity.
# for example, if you have an "Exchange", a "Knows" and also a "Knows of" relationship between Char A and Char B,
# only the "Exchange" will be kept. If there is a "Knows" and also a "Knows of", the "Knows" will be kept.
# I'm making use of pandas.Categorical to preferentially rank the relationships, and then removing overlapping relationships.

df_no_duplicates = df[~df.duplicated(
    subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category'])].sort_values(by=[
    'Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])


df_no_duplicates["category"] = pd.Categorical(df_no_duplicates["category"], categories=["Exchange", "Knows", "Knows of"], ordered=True)

df_no_duplicates = df_no_duplicates.sort_values(by=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category']).drop_duplicates(subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])

# df_no_duplicates = df_no_duplicates.drop(columns=['Character 1 <br />(choose)', 'Character 2 <br />(choose)'])
date = datetime.now().strftime("%Y%m%d-%HH%MM")
df_no_duplicates.to_csv(f'data/tt/ExportsFeb26/tt_exports_TWICE_processed_final_{date}.csv', index=False)


