from datetime import datetime

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import matplotlib as mpl

mpl.use('macosx')
cwd = os.getcwd()
path_to_time_graph_data = os.path.join(cwd, 'SoundandtheFuryTimeGraphJan92025.csv')
df = pd.read_csv(path_to_time_graph_data)

df['Start Date'] = pd.to_datetime(df['Start Date'])
df['End Date'] = pd.to_datetime(df['End Date'])
df['Start Date TT'] = pd.to_datetime(df['Start Date TT'])
df['End Date TT'] = pd.to_datetime(df['End Date TT'])

df.sort_values(by='Start Date', inplace=True)

fig = plt.figure(figsize=(12, 10))
axs = plt.axes()

fig2 = plt.figure(figsize=(12, 10))
axs2 = plt.axes()

fig3 = plt.figure(figsize=(12, 10))
axs3 = plt.axes()

narrators = df['Narrator'].unique()
line_colours = plt.cm.Dark2(np.linspace(0.25, 0.75, 4))
legend_items = []

for index, row in df.iterrows():
    idx_narr = [i for i, x in enumerate(narrators) if x == row['Narrator']][0]

    if row['Start Date'] == row['End Date']:
        axs.scatter([row['Start Date'],
                     row['End Date']],
                    [row['Start Page'], row['Start Page']],
                    color=line_colours[idx_narr],
                    label=f"{row['Narrator']}"
                    )

    else:
        axs.plot([row['Start Date'],
                  row['End Date']],
                 [row['Start Page'], row['Start Page']],
                 color=line_colours[idx_narr],
                 linewidth=5,
                 label=f"{row['Narrator']}"
                 )

    if row['Start Date TT'] is not pd.NaT:
        axs.plot([row['Start Date TT'],
                  row['End Date TT']],
                 [row['Start Page TT'], row['End Page TT']],
                 color=line_colours[idx_narr], alpha=0.5)

        axs.plot(
            [row['Start Date'], row['End Date TT']],
            [row['Start Page'], row['Start Page']],
            color='k',
            linewidth=1,
            linestyle='--',
            alpha=0.2)
    # xytext = (((-10) * index % 2) * index % 2 , ((-10) * index % 2) * index % 2)
    # axs.annotate(f'{row["id"]}',
    #              xy=(row['Start Date'], row['Start Page']),
    #              xytext=xytext,
    #              textcoords='offset points')

    if row['Caddy']:
        axs2.plot(
            [int(row['id']), int(row['id'])],
            ['Caddy', 'Caddy'],
            color=line_colours[idx_narr],
            linewidth=5)
        axs2.scatter([int(row['id']), int(row['id'])],
                     ['Caddy', 'Caddy'],
                     color='k'
                     )
    if row['Quentin']:
        axs2.plot(
            [int(row['id']), int(row['id'])],
            ['Quentin', 'Quentin'],
            color='k',
            linewidth=5)
        axs2.scatter([int(row['id']), int(row['id'])],
                     ['Quentin', 'Quentin'],
                     color='k'
                     )
    if row['Benjy']:
        axs2.plot(
            [int(row['id']), int(row['id'])],
            ['Benjy', 'Benjy'],
            color='k',
            linewidth=5)
        axs2.scatter([int(row['id']), int(row['id'])],
                     ['Benjy', 'Benjy'],
                     color='k'
                     )
    if row['Jason']:
        axs2.plot(
            [int(row['id']), int(row['id'])],
            ['Jason', 'Jason'],
            color='k',
            linewidth=5)
        axs2.scatter([int(row['id']), int(row['id'])],
                     ['Jason', 'Jason'],
                     color='k'
                     )
    if row['Dilsey']:
        axs2.plot(
            [int(row['id']), int(row['id'])],
            ['Dilsey', 'Dilsey'],
            color='k',
            linewidth=5)
        axs2.scatter([int(row['id']), int(row['id'])],
                     ['Dilsey', 'Dilsey'],
                     color='k'
                     )
    if row['Quentin Jr']:
        axs2.plot(
            [int(row['id']), int(row['id'])],
            ['Quentin Jr', 'Quentin Jr'],
            color='k',
            linewidth=5)
        axs2.scatter([int(row['id']), int(row['id'])],
                     ['Quentin Jr', 'Quentin Jr'],
                     color='k'
                     )

    axs3.scatter([int(row['id']),
                  int(row['id'])],
                 [row['Start Page'], row['End Page']],
                 color=line_colours[idx_narr],
                 label=f"{row['Narrator']}"
                 )
    # axs3.plot([int(row['id']),
    #          int(row['id'])],
    #         [row['Start Page TT'], row['End Page TT']],
    #         color=line_colours[idx_narr],
    #         label=f"{row['Narrator']}"
    #         )

# plt.xticks(np.arange(df['id'].min()-1, df['id'].max(), 5))
for idx, narrator in enumerate(narrators):
    legend_items += [(plt.Rectangle((0, 0), 1, 1, color=line_colours[idx]), narrator)]

axs.legend(*zip(*legend_items), loc='best')
axs3.legend(*zip(*legend_items), loc='best')

axs.set_xlabel('Event Date')
axs.set_ylabel('Page Number')

date = datetime.now().strftime("%Y%m%d-%HH%MM")
fig.savefig(f"Fig_1_{date}.png", bbox_inches='tight')

axs2.set_xlabel('Event Occurrence ID')
axs2.set_ylabel('Participating Character')
axs2.vlines(list(range(0, 55, 1)), 'Caddy', 'Quentin Jr', linestyles='--', colors='k', linewidth=0.5)

axs3.set_xlabel('Event Occurrence ID')
axs3.set_ylabel('Page Number')
axs3.vlines(list(range(0, 55, 1)), 0, 350, linestyles='--', colors='k', linewidth=0.5)
axs3.hlines(list(range(0, 350, 10)), 0, 55, linestyles='--', colors='k', linewidth=0.5)

new_tick_locations = df['id']

ax22 = axs2.twiny()
ax22.set_xlim(axs2.get_xlim())
ax22.set_xticks(new_tick_locations)
dates = [item.strftime('%Y-%m-%d ') for item in df['Start Date']]
ax22.set_xticklabels(dates + df['Event Name'].str[0:29])
ax22.tick_params(axis='x', labelrotation=90)
fig2.savefig(f"Fig_2_{date}.png", bbox_inches='tight')


ax32 = axs3.twiny()
ax32.set_xlim(axs3.get_xlim())
ax32.set_xticks(new_tick_locations)
ax32.set_xticklabels(dates + df['Event Name'].str[0:29])
ax32.tick_params(axis='x', labelrotation=90)
fig3.savefig(f"Fig_3_{date}.png", bbox_inches='tight')

plt.tight_layout()
plt.show()

# df = df[['id', 'Event Name', 'Caddy', 'Quentin', 'Benjy', 'Jason', 'Dilsey', 'Quentin Jr']]
#
# writer = pd.ExcelWriter('projection_graph_TSATF.xlsx', engine='xlsxwriter')
#
# df.sort_values('id', ascending=True, inplace=True)
#
# df.to_excel(writer, sheet_name='Sheet1')
#
# workbook = writer.book
# worksheet = writer.sheets['Sheet1']
#
# # Add formats
# orange_format = workbook.add_format({'bg_color': 'orange'})
# green_format = workbook.add_format({'bg_color': 'green'})
# cyan_format = workbook.add_format({'bg_color': 'cyan'})
# magenta_format = workbook.add_format({'bg_color': 'magenta'})
# lime_format = workbook.add_format({'bg_color': 'lime'})
# navy_format = workbook.add_format({'bg_color': 'navy'})
#
# bg_formats = [orange_format, green_format, cyan_format, magenta_format, lime_format, navy_format]
#
# # Get the dimensions of the dataframe.
# (max_row, max_col) = df.shape
#
# for i in range(len(bg_formats)):
#     # Apply a conditional format to the required cell range.
#     worksheet.conditional_format(1, 3 + i, max_row, 3 + i,
#                                  {'type': 'cell',
#                                   'criteria': 'equal to',
#                                   'value': 'true',
#                                   'format': bg_formats[i]})
#
#
# # Close the Pandas Excel writer and output the Excel file.
# # workbook.write()
# writer.close()
