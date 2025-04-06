from datetime import datetime

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import matplotlib as mpl

mpl.use('macosx')
cwd = os.getcwd()
path_to_time_graph_data = os.path.join(cwd, 'PoDTimeGraphApril2.csv')
df = pd.read_csv(path_to_time_graph_data)

df['Start Date'] = pd.to_datetime(df['Start Date'])
df['End Date'] = pd.to_datetime(df['End Date'])
df['Start Date TT'] = pd.to_datetime(df['Start Date TT'])
df['End Date TT'] = pd.to_datetime(df['End Date TT'])

df.sort_values(by='id', inplace=True)

fig = plt.figure(figsize=(12, 10))
axs = plt.axes()

narrators = df['Narrator'].unique()
num_narrators = len(narrators)

# Print the names of the narrators
print("Narrators:")
for i, narrator in enumerate(narrators):
    print(f"{i+1}. {narrator}")

# Define custom colors with their names
custom_colors = {
    'Red': '#FF0000',
    'Blue': '#0000FF',
    'Yellow': '#FFFF00',
    'Magenta': '#FF00FF',
    'Green': '#00FF00',
    'Cyan': '#00FFFF',
    'Orange': '#FFA500',
    'Violet': '#8D01FF',
    'Chartreuse': '#C9FF00',
    'Pink': '#FFC0CB',
    'Teal': '#008080',
    'Purple': '#800080'

}

narrator_colors = {}

for narrator in narrators:
    while True:
        print(f"Available colors: {list(custom_colors.keys())}")
        color_name = input(f"Enter the color name for {narrator}: ")
        if color_name in custom_colors:
            narrator_colors[narrator] = custom_colors[color_name]
            break
        else:
            print("Invalid color name. Please choose from the available colors.")

print("\nNarrator Colors:")
for narrator, color in narrator_colors.items():
    print(f"{narrator}: {color}")

# Use the custom colors in your plot
line_colours = [narrator_colors[narrator] for narrator in narrators]

# Combine narrators and colors into a list of tuples
narrator_color_pairs = list(zip(narrators, line_colours))

# Sort the list of tuples by narrator name
narrator_color_pairs.sort(key=lambda x: x[0])

legend_items = []

# Sample data for pie charts
pie_data = [np.random.rand(4) for _ in range(len(df))]

for index, (row, p_data) in enumerate(zip(df.iterrows(), pie_data)):
    row = row[1]
    idx_narr = [i for i, x in enumerate(narrators) if x == row['Narrator']][0]

    line_style = ['--' if row['Is Approximate?'] == 'T' else '-']
    marker_style = ['*' if row['Is Approximate?'] == 'T' else '.']

    # Plot scatter points if the start and end dates are the same
    if row['Start Date'] == row['End Date']:
        sizes = p_data / np.sum(p_data) * 100
        wedges, texts = axs.pie(sizes, radius=0.05, center=(row['Start Date'].toordinal(), row['Start Page']),
                                frame=True)
        for wedge in wedges:
            wedge.set_edgecolor('black')

        # Change the edge color of the pie chart circle based on narrator color
        circle = plt.Circle((row['Start Date'].toordinal(), row['Start Page']), 0.05, edgecolor=line_colours[idx_narr],
                            facecolor='none', linewidth=1.5)
        axs.add_artist(circle)


    # Plot lines if the start and end dates are different
    else:
        axs.plot([row['Start Date'],
                  row['End Date']],
                 [row['Start Page'], row['Start Page']],
                 color=line_colours[idx_narr],
                 linewidth=5,
                 linestyle=line_style[0],
                 label=f"{row['Narrator']}"
                 )
    # Plot additional lines if 'Start Date TT' is not Not a Time
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

for idx, narrator in enumerate(narrators):
    legend_items += [(plt.Rectangle((0, 0), 1, 1, color=line_colours[idx]), narrator)]

# Add the legend to the plot
axs.legend(handles=[item[0] for item in legend_items], labels=[item[1] for item in legend_items], loc='upper right')

# Set labels and title
axs.set_xlabel('Event Date')
axs.set_ylabel('Page Number')
axs.set_title('Time Graph')

# Display the plot
plt.show()
