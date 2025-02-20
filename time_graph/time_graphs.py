import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import matplotlib as mpl

mpl.use('macosx')
cwd = os.getcwd()
path_to_time_graph_data = os.path.join(cwd, 'TheSoundandtheFuryTimeGraphJuly2024.xlsx')
df_events = pd.read_excel(path_to_time_graph_data, sheet_name='Events', header=1)
df_pages = pd.read_excel(path_to_time_graph_data, sheet_name='Pages')

path_to_telling_time_data = os.path.join(cwd, 'TheSoundandtheFuryTellingTimesJuly2024.xlsx')
df_tt = pd.read_excel(path_to_telling_time_data, sheet_name='OriginalTellingTimes')

fig = plt.figure(figsize=(12, 10))
ax = plt.axes()  # axes(projection='3d')
# ax = plt.subplot(211)
# ax3 = plt.subplot(212)
x_key = [key for key in df_events.keys() if 'Description' in key][0]
df_events.sort_values(by=x_key, inplace=True)
x = df_events[x_key]
y1_key = [key for key in df_events.keys() if 'Not Before' in key][0]
y2_key = [key for key in df_events.keys() if 'Not After' in key][0]
y1 = df_events[y1_key]
y2 = df_events[y2_key]

df_pages.sort_values(by='Event', inplace=True)

events_in_pages_condition = df_events[x_key].isin(df_pages['Event'])

events_in_pages = df_events.loc[events_in_pages_condition]

df_events.rename(columns={x_key: 'Event'}, inplace=True)
df_tt.rename(columns={x_key: 'Telling Time'}, inplace=True)

df = pd.merge(df_events, df_pages, on='Event')
df = df.sort_values(by=[y1_key])

df_tt = pd.merge(df_tt, df_pages, on='Telling Time')
df_tt = df_tt.sort_values(by=[y1_key])

containers = df['Container'].unique()
narrators = df['Narrator'].unique()
# line_styles = ['-', '--', '-.', ':']
line_colours = plt.cm.Dark2(np.linspace(0.25, 0.75, 4))
# markers = ['.', 'x', '+', '*']
barcode = ''
texts = []
scatter, lines = None, None
h2, l2 = [], []
scs = []
line = []
vert_alignment = ['top', 'bottom']
i = 0
min_time = df[y1_key].min()
max_time = df[y2_key].max()

df = df.sort_values(by=[y1_key])
df_tt = df_tt.sort_values(by=[y1_key])

for index, row in df.iterrows():
    start_time = row[y1_key]
    end_time = row[y2_key]
    y1 = row['StartPage']
    y2 = row['EndPage']

    if row['Caddy']:
        barcode += 'C'
    if row['Quentin']:
        barcode += 'Q'
    if row['Benjy']:
        barcode += 'B'
    if row['Jason']:
        barcode += 'J'
    if row['Dilsey']:
        barcode += 'D'
    if row['Quentin Jr']:
        barcode += 'K'

    idx_narr = [i for i, x in enumerate(narrators) if x == row['Narrator']][0]
    # idx_cont = [i for i, x in enumerate(containers) if x == row['Container']][0]
    idx_align = i % 2
    i += 1

    ax2 = ax.twinx()
    ax2.tick_params(left=False, labelleft=False, top=False, labeltop=False,
                    right=False, labelright=False, bottom=False, labelbottom=False)
    if row['StartPage'] == row['EndPage'] and start_time == end_time:
        scatter = ax2.scatter([start_time.strftime('%Y-%m-%d')], [row['StartPage']], marker='.',
                              color=line_colours[idx_narr], label=f"{row['Narrator']}")
        handles2, labels2 = ax2.get_legend_handles_labels()
        h2.append(handles2)
        l2.append(labels2)
        # ax2.annotate(barcode, xy=(row['StartPage'], start_time.strftime('%Y-%m-%d')),
        #              fontsize=5, rotation=90, verticalalignment=vert_alignment[idx_align])
    else:
        line = ax.plot(
            [start_time.strftime('%Y-%m-%d'), end_time.strftime('%Y-%m-%d')],
            [row['StartPage'], row['EndPage']],
            color=line_colours[idx_narr],
            label=f"{row['Narrator']}")

    # Set axes label
    ax.set_xlabel('Event time', labelpad=20)
    ax.set_ylabel('Page number', labelpad=20)

    handles, labels = ax.get_legend_handles_labels()
    ax.tick_params('x', labelrotation=45)
    by_label = dict(zip(labels, handles))
    ax.legend(by_label.values(), by_label.keys(), loc='upper left', framealpha=0.5)

    barcode = ''

# flatten one of the arrays
l2 = [lll2 for ll2 in l2 for lll2 in ll2]
h2 = [hhh2 for hh2 in h2 for hhh2 in hh2]

by_label = dict(zip(l2, h2))
ax2.legend(by_label.values(), by_label.keys(), loc='lower right', framealpha=0.5)
# # # Set axes label

collapsed_df_min = df_tt.groupby(["Narrator", "Telling Time Timestamp"], as_index=False)[['StartPage']].min()
collapsed_df_max = df_tt.groupby(["Narrator", "Telling Time Timestamp"], as_index=False)[['EndPage']].max()

merged_df = collapsed_df_min.merge(collapsed_df_max, on=['Narrator', 'Telling Time Timestamp'])  # .EndPage

for index, row in merged_df.iterrows():
    telling_time = row["Telling Time Timestamp"]

    idx_narr = [i for i, x in enumerate(narrators) if x == row['Narrator']][0]

    line = ax2.plot(
        [telling_time.strftime('%Y-%m-%d'), telling_time.strftime('%Y-%m-%d')],
        [row['StartPage'], row['EndPage']],
        color=line_colours[idx_narr],
        linewidth=1,
        linestyle='-')

    handles2, labels2 = ax2.get_legend_handles_labels()
    h2.append(handles2)
    l2.append(labels2)

# for index, row in df_tt.iterrows():
    # telling_time = row["Telling Time Timestamp"]
    #
    # idx_narr = [i for i, x in enumerate(narrators) if x == row['Narrator']][0]
    # idx_align = i % 2
    # i += 1

    # scatter = ax2.scatter([telling_time.strftime('%Y-%m-%d')], [row['StartPage']], marker='x',
    #                       color=line_colours[idx_narr], label=f"{row['Narrator']}")

    # line = ax2.plot(
    #     [min_time.strftime('%Y-%m-%d'), max_time.strftime('%Y-%m-%d')],
    #     [row['StartPage'], row['EndPage']],
    #     color='k',
    #     linewidth=1,
    #     linestyle='--',
    #     alpha=0.2,
    #     label=f"{row['Narrator']}")

    # handles2, labels2 = ax2.get_legend_handles_labels()
    # h2.append(handles2)
    # l2.append(labels2)

plt.tight_layout()
plt.show()
