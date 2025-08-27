import pandas as pd
import matplotlib.pyplot as plt
import math
import re
import argparse
from datetime import timedelta
from matplotlib.lines import Line2D
from pathlib import Path

# Parse command-line arguments.
argparser = argparse.ArgumentParser(description="Figuring out input files")

argparser.add_argument("--in_df", type=str, default="PoDTimeGraphApril2.csv", help="The main input CSV.")
argparser.add_argument("--in_color_df", type=str, default="PoDColorCode.csv", help="The CSV specifying colours for chars/narrators.")
args = argparser.parse_args()
print(f"Processing input documents {args.in_df} and {args.in_color_df}")

# Pattern for turning names into usable id components.
rePattern = r'[^0-9a-zA-Z]+'

# Ensure text is output as text rather than weird vectors.
plt.rcParams['svg.fonttype'] = 'none' 

# Load data
#df = pd.read_csv('PoDTimeGraphApril2.csv')
df = pd.read_csv(args.in_df)
#color_df = pd.read_csv('PoDColorCode.csv')
color_df = pd.read_csv(args.in_color_df)
color_dict = dict(zip(color_df.iloc[:, 0], color_df.iloc[:, 2]))

# Render the CSV as JSON so we can read it later in the XSLT transformation.
df.to_json(Path(args.in_df).with_suffix('.json'))

# Convert date columns
df['Start Date'] = pd.to_datetime(df['Start Date'])
df['End Date'] = pd.to_datetime(df['End Date'])
df['Midpoint Date'] = df['Start Date'] + (df['End Date'] - df['Start Date']) / 2
df['Start Date TT'] = pd.to_datetime(df['Start Date TT'], errors='coerce')
df['End Date TT'] = pd.to_datetime(df['End Date TT'], errors='coerce')

# Identify characters
participating_character_columns = df.columns[15:]
all_characters = sorted(participating_character_columns)

def list_participating_characters(row):
    return [char for char in all_characters if str(row[char]).strip().upper() in ['T', 'TRUE']]

df['Participating Characters'] = df.apply(list_participating_characters, axis=1)

# Narrator and character colors
unique_narrators = df['Narrator'].dropna().unique()
narrator_color_map = {narrator: color_dict.get(narrator, 'gray') for narrator in unique_narrators}
color_map = {char: color_dict.get(char, 'gray') for char in all_characters}

# Create figure size
fig, ax = plt.subplots(figsize=(15, 8))

# Define a single radius in page units
circle_radius = 4  # adjust this value to control spacing

# Estimate conversion factor from pages to days
x_span = df['Start Page'].max() - df['Start Page'].min()
y_span_days = (df['Midpoint Date'].max() - df['Midpoint Date'].min()).days
page_to_day_ratio = y_span_days / x_span if x_span != 0 else 1


# Plot narrator and character markers
for _, row in df.iterrows():
    x_base = row['Start Page']
    y_base = row['Midpoint Date']
    narrator = row['Narrator']
    narrator_color = narrator_color_map.get(narrator, 'gray')
    ax.plot(x_base, y_base, 'o', color=narrator_color, markersize=4, gid='narrmark_' + str(_) + '_' + re.sub(rePattern, '_', narrator))

    characters = row['Participating Characters']
    n = len(characters)
    for i, char in enumerate(characters):
        angle = 2 * math.pi * i / n
        x_offset = circle_radius * math.sin(angle)
        y_offset = timedelta(days=circle_radius * math.cos(angle) * page_to_day_ratio)
        x_char = x_base + x_offset
        y_char = y_base + y_offset
        ax.plot(x_char, y_char, 'o', color=color_map[char], markersize=2.5, gid='char_' + str(_) + '_' + re.sub(rePattern, '_', char))
        ax.plot([x_base, x_char], [y_base, y_char], '-', color=color_map[char], linewidth=0.5, gid='charline_' + str(_) + '_' + re.sub(rePattern, '_', char))

# Connect narrator points
narrator_line_df = df[['Narrator', 'Start Page', 'Midpoint Date']].dropna().sort_values(by='Start Page')
for i in range(len(narrator_line_df) - 1):
    row1 = narrator_line_df.iloc[i]
    row2 = narrator_line_df.iloc[i + 1]
    if row1['Narrator'] == row2['Narrator']:
        color = narrator_color_map.get(row1['Narrator'], 'gray')
        ax.plot([row1['Start Page'], row2['Start Page']],
                [row1['Midpoint Date'], row2['Midpoint Date']],
                '-', color=color, linewidth=0.5, gid='narr_' + str(i) + '_' + re.sub(rePattern, '_', row1['Narrator']))

# Telling time lines and vertical guidelines
for _, row in df.iterrows():
    if pd.notnull(row['Start Date TT']) and pd.notnull(row['End Date TT']) and \
       pd.notnull(row['Start Page TT']) and pd.notnull(row['End Page TT']):
        x0 = row['Start Page TT']
        x1 = row['End Page TT']
        y0 = row['Start Date TT']
        y1 = row['End Date TT']
        narrator = row['Narrator']
        color = narrator_color_map.get(narrator, 'gray')
        x_mid = (x0 + x1) / 2
        y_mid = y0 + (y1 - y0) / 2
        ax.plot([x0, x_mid, x1], [y0, y_mid, y1], '-', color=color, linewidth=3, gid='tellline_1_' + re.sub(rePattern, '_', narrator) + '_' + str(_))

        x_event = row['Start Page']
        y_event = row['Midpoint Date']
        if x0 != x1 and min(x0, x1) <= x_event <= max(x0, x1):
            fraction = (x_event - x0) / (x1 - x0)
            y_interp = y0 + (y1 - y0) * fraction
            ax.plot([x_event, x_event], [y_event, y_interp], '--', color=color, linewidth=0.25, gid='tellline_2_' + re.sub(rePattern, '_', narrator) + '_' + str(_))

# Final touches
ax.set_title("Time Graph: " + args.in_df, gid='graphTitle')
ax.set_xlabel("Text Time")
ax.set_ylabel("Story Time")

# Narrator legend handles
narrator_handles = [
    Line2D([0], [0], marker='o', color='w', label=narrator,
           markerfacecolor=narrator_color_map[narrator], markersize=10, gid='narrHandle' + re.sub(rePattern, '_', narrator))
    for narrator in sorted(narrator_color_map)
]

# Character legend handles
character_handles = [
    Line2D([0], [0], marker='o', color='w', label=char,
           markerfacecolor=color_map[char], markersize=5, gid='charHandle' + re.sub(rePattern, '_', narrator))
    for char in sorted(color_map)
]

# Add narrator legend
legend1 = ax.legend(handles=narrator_handles, title="Narrators",
                    loc='upper left', bbox_to_anchor=(1.02, 1), borderaxespad=0.)
ax.add_artist(legend1)

# Add character legend
legend2 = ax.legend(handles=character_handles, title="Participating Characters",
                    loc='upper left', bbox_to_anchor=(1.02, 0.5), borderaxespad=0.)

# Plot graph
plt.tight_layout()  # Optional: helps with spacing of other elements
# Calculate output filename
outFile = Path(args.in_df).with_suffix('.svg')
plt.savefig(outFile, format="svg", bbox_inches='tight')

# We don't show the image because that blocks subsequent processing.
# Open the image locally if you would like to see it.
# plt.show()




