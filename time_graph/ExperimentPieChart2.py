import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import matplotlib.dates as mdates
from matplotlib.offsetbox import OffsetImage, AnnotationBbox
from io import BytesIO

# Load your data into a DataFrame
# Replace 'TestPie.csv' with the path to your dataset
df = pd.read_csv('TestPie.csv')

# Convert 'Start Date' to datetime format
df['Start Date'] = pd.to_datetime(df['Start Date'])

# Extract x and y coordinates
x = df['Start Date']
y = df['Start Page']

# Convert datetime to numerical values
x_num = mdates.date2num(x)

# Define colors for each character
colors = {
    "Evelina Harp": "red",
    "Judge Antone Bazil Coutts": "blue",
    "Marn Wolde": "green",
    "Doctor Cordelia Lochren": "purple",
    "Seraph Milk": "orange",
    "Corwin Peace": "brown",
    "Billy Peace": "pink",
    "Warren Wolde": "gray",
    "Shamengwa Milk": "cyan"
}

# Create scatter plot with pie charts as points
fig, ax = plt.subplots()

for index, row in df.iterrows():
    size = 0.1  # Size of the pie chart

    # Get the characters with 'T' in the current row
    pie_data = [colors[character] for character in colors if row[character] == 'T']

    # Create a new figure for each pie chart without extra whitespace around it.
    fig_pie, ax_pie = plt.subplots(figsize=(size, size), dpi=300)
    wedges, texts = ax_pie.pie([1] * len(pie_data), colors=pie_data)
    ax_pie.axis('off')  # Hide axes

    # Save figure into buffer without extra padding or margins.
    buf = BytesIO()
    fig_pie.savefig(buf, format='png', bbox_inches='tight', pad_inches=0)
    buf.seek(0)
    image = plt.imread(buf)
    imagebox = OffsetImage(image, zoom=0.3)  # Adjust the zoom level

    ab = AnnotationBbox(imagebox, (x_num[index], y[index]), frameon=False)
    ax.add_artist(ab)
    plt.close(fig_pie)  # Close the pie chart figure

# Add buffer to the x and y limits
buffer_x = 400  # Adjust this value as needed
buffer_y = 1  # Adjust this value as needed

ax.set_xlim(min(x_num) - buffer_x, max(x_num) + buffer_x)
ax.set_ylim(0 - buffer_y, 21 + buffer_y)  # Set y-axis limits with buffer

ax.set_aspect('auto')

# Format the x-axis to show dates
ax.xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d'))
ax.xaxis.set_major_locator(mdates.AutoDateLocator())

plt.xlabel('Start Date')
plt.ylabel('Start Page')
plt.title('Scatter Plot of Start Date vs Start Page with Pie Charts as Points')

# Rotate date labels for better readability
plt.gcf().autofmt_xdate()

plt.show()
