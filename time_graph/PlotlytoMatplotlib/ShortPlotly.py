#This script does everything. For each new novel, upload the novel csv, a color code csv, and change the novel title.

import pandas as pd
import plotly.graph_objects as go
import textwrap
import math

novel_title = "Plague of Doves"

# Load the CSV file
df = pd.read_csv('PoDTimeGraphApril2.csv')

# Load custom color codes
color_df = pd.read_csv('PoDColorCode.csv')
color_dict = dict(zip(color_df.iloc[:, 0], color_df.iloc[:, 2]))


# Convert 'Start Date' and 'End Date' to datetime
df['Start Date'] = pd.to_datetime(df['Start Date'])
df['End Date'] = pd.to_datetime(df['End Date'])

# Calculate the midpoint date
df['Midpoint Date'] = df['Start Date'] + (df['End Date'] - df['Start Date']) / 2

# Create telling time dataframes
df['Start Date TT'] = pd.to_datetime(df['Start Date TT'], errors='coerce')
df['End Date TT'] = pd.to_datetime(df['End Date TT'], errors='coerce')

# Identify Participating Character columns (starting from column index 15)
participating_character_columns = df.columns[15:]
all_characters = sorted(participating_character_columns)

def list_participating_characters(row):
    return [char for char in all_characters if str(row[char]).strip().upper() in ['T', 'TRUE']]

df['Participating Characters'] = df.apply(list_participating_characters, axis=1)

# Identify Narrators and assign them colors
unique_narrators = df['Narrator'].dropna().unique()
narrator_color_map = {narrator: color_dict.get(narrator, 'gray') for narrator in unique_narrators}

# Generate color map for each participating character
color_map = {char: color_dict.get(char, 'gray') for char in all_characters}

# Initialize the plotly figure and supporting lists for traces
fig = go.Figure()
event_traces = []
character_traces = []
legend_added = set()

# Calculate date range and offset step for vertical positioning
min_date = df['Midpoint Date'].min()
max_date = df['Midpoint Date'].max()
date_range_days = (max_date - min_date).days
y_offset_step = 0.004 * date_range_days


#Prepare narrator traces and legend tracking
narrator_traces = []
narrator_legend_added = set()
first_narrator = sorted(unique_narrators)[0] if len(unique_narrators) > 0 else None

#Iterate through each row to create character and narrator traces
for _, row in df.iterrows():
    x_base = row['Start Page']
    y_base = row['Midpoint Date']
    characters = row['Participating Characters']
    narrator = row['Narrator']
    narrator_color = narrator_color_map.get(narrator, 'gray')
    legendgroup_name = f"narrator-{narrator}"
    show_narrator_legend = narrator not in narrator_legend_added

    #Add narrator marker
    narrator_traces.append(go.Scatter(
        x=[x_base],
        y=[y_base],
        mode='markers',
        marker=dict(size=14, color=narrator_color, symbol='circle'),
        name=narrator,
        legendgroup=f"narrator-{narrator}",
        legendgrouptitle=dict(text="Narrators") if narrator == sorted(unique_narrators)[0] else None,
        hovertemplate=hover_text + "<extra></extra>",
        showlegend=show_narrator_legend
    ))

    narrator_legend_added.add(narrator)

    # Arrange character markers in a circle around narrator marker
    # Radius of the circle (adjust as needed)
    # Define a visual radius in pixels
    visual_radius_px = 6  # adjust this to control visual distance

    # Estimate axis ranges
    x_range = [df['Start Page'].min(), df['Start Page'].max()]
    y_range_days = (df['Midpoint Date'].max() - df['Midpoint Date'].min()).days

    # Estimate pixels per axis (based on typical figure size)
    fig_width_px = 800
    fig_height_px = 600

    # Convert pixel radius to data units
    radius_x = (x_range[1] - x_range[0]) / fig_width_px * visual_radius_px
    radius_y_days = y_range_days / fig_height_px * visual_radius_px

    n = len(characters)
    for i, char in enumerate(characters):
        angle = 2 * math.pi * i / n  # angle in radians

        # Use visually consistent radius in data units
        x_offset = radius_x * math.sin(angle)
        y_offset = pd.Timedelta(days=radius_y_days * math.cos(angle))

        x_char = x_base + x_offset
        y_char = y_base + y_offset

        show_legend = char not in legend_added

        # Add character marker
        character_traces.append(go.Scatter(
            x=[x_char],
            y=[y_char],
            mode='markers',
            marker=dict(size=7, color=color_map[char], symbol='circle'),
            name=char,
            legendgroup=f"character-{char}",
            legendgrouptitle=dict(text="Participating Characters") if char == all_characters[0] else None,
            showlegend=show_legend
        ))
        legend_added.add(char)

        fig.add_trace(go.Scatter(
            x=[x_base, x_char],
            y=[y_base, y_char],
            mode='lines',
            line=dict(color=color_map[char], width=1),
            hoverinfo='skip',
            showlegend=False,  # Don't show in legend
            legendgroup=f"character-{char}",  # Match the character's legend group
        ))

# Add all sorted traces to the figure
character_traces_sorted = sorted(character_traces, key=lambda trace: trace.name)
narrator_traces_sorted = sorted(narrator_traces, key=lambda trace: trace.name)
for trace in narrator_traces_sorted + character_traces_sorted:
    fig.add_trace(trace)

# Sort narrator points by Start Page
narrator_line_df = df[['Narrator', 'Start Page', 'Midpoint Date']].dropna()
narrator_line_df = narrator_line_df.sort_values(by='Start Page')

# Create connecting lines between narrator points
for i in range(len(narrator_line_df) - 1):
    row1 = narrator_line_df.iloc[i]
    row2 = narrator_line_df.iloc[i + 1]

    narrator1 = row1['Narrator']
    narrator2 = row2['Narrator']

    # Only draw line if narrators are the same
    if narrator1 == narrator2:
        line_color = narrator_color_map.get(narrator1, 'gray')

        fig.add_trace(go.Scatter(
            x=[row1['Start Page'], row2['Start Page']],
            y=[row1['Midpoint Date'], row2['Midpoint Date']],
            mode='lines',
            line=dict(color=line_color, width=2),
            showlegend=False,  # Don't show in legend
            legendgroup=f"narrator-{narrator1}",  # Match the narrator's legend group
        ))

# Add telling time lines and vertical guidelines
for _, row in df.iterrows():
    if pd.notnull(row['Start Date TT']) and pd.notnull(row['End Date TT']) and \
       pd.notnull(row['Start Page TT']) and pd.notnull(row['End Page TT']):

        x0 = row['Start Page TT']
        x1 = row['End Page TT']
        y0 = pd.to_datetime(row['Start Date TT'])
        y1 = pd.to_datetime(row['End Date TT'])

        narrator = row['Narrator']
        line_color = narrator_color_map.get(narrator, 'gray')
        x0_int = int(x0)
        x1_int = int(x1)
        x_mid = (x0 + x1) / 2
        y_mid = y0 + (y1 - y0) / 2
        hover_text = (
            f"{narrator}'s Telling Time<br>"
            f"Dates: {y0.date()}–{y1.date()}<br>"
            f"Pages: {x0_int}–{x1_int}"
        )
        legendgroup_name = f"narrator-{narrator}"

        # Add Telling time line
        fig.add_trace(go.Scatter(
            x=[x0, x_mid, x1],
            y=[y0, y_mid, y1],
            mode='lines',
            line=dict(color=line_color, width=3, dash='solid'),
            legendgroup=legendgroup_name,  # Group with narrator
            name="guideline",  # Tag for button toggling
            showlegend=False
        ))

        # Add vertical dashed guideline
        x_event = row['Start Page']
        y_event = row['Midpoint Date']
        if x0 != x1 and min(x0, x1) <= x_event <= max(x0, x1):
            fraction = (x_event - x0) / (x1 - x0)
            y_interp = y0 + (y1 - y0) * fraction
            event_name = row['Event Name']
            approx_tt = str(row.get('Is Approximate TT?', '')).strip().upper() in ['T', 'TRUE']
            approx_text = "approximately " if approx_tt else ""
            hover_text = f"{narrator} narrates '{event_name}' in {approx_text}{y0.date()}–{y1.date()}"

            fig.add_trace(go.Scatter(
                x=[x_event, x_event],
                y=[y_event, y_interp],
                mode='lines',
                line=dict(color=line_color, width=1.5, dash='dash'),
                hovertemplate=hover_text + "<extra></extra>",
                legendgroup=legendgroup_name,  # Group with narrator
                name="guideline",  # Tag for button toggling
                showlegend=False
            ))

# Create Graph
fig.update_layout(
    title=f"{novel_title} Time Graph",
    xaxis=dict(title='Text Time'),
    yaxis=dict(title='Story Time'),
    legend_title_text='Interactive Legend'
)

# Create a filename with underscores instead of spaces
filename = f"{novel_title.replace(' ', '_')}_Time_Graph.html"
fig.write_html(filename)
fig.show()