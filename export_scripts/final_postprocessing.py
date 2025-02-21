from datetime import datetime

import pandas as pd

# Read the final data

df = pd.read_csv('data/pod/Feb212025_exports/TEST_pod_exports_processed_final_20250221-10H35M.csv')

df_no_duplicates = df[~df.duplicated(
    subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category'])].sort_values(by=[
    'Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])


df_no_duplicates["category"] = pd.Categorical(df_no_duplicates["category"], categories=["Exchange", "Knows", "Knows of"], ordered=True)


# df_no_duplicates_with_rel_type_diff_kind = df_no_duplicates.drop_duplicates(subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'],keep=False).sort_values(by=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])

df_no_duplicates = df_no_duplicates.sort_values(by=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage', 'category']).drop_duplicates(subset=['Character 1 <br />(choose)', 'Character 2 <br />(choose)', 'startPage'])

# final_df = final_df[['source', 'target', "Character 1 <br />(choose)",
#                      "Character 2 <br />(choose)", 'type', 'weight', 'startPage', 'category']]

date = datetime.now().strftime("%Y%m%d-%HH%MM")
df_no_duplicates.to_csv(f'data/pod/Feb212025_exports/TEST_pod_exports_TWICE_processed_final_{date}.csv', index=False)

pass
