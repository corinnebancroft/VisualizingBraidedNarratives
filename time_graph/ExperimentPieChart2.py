import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import matplotlib.dates as mdates
from matplotlib.offsetbox import OffsetImage, AnnotationBbox
from io import BytesIO
from PIL import Image, ImageDraw

# Load your data into a DataFrame
# Replace 'your_data.csv' with the path to your dataset
df = pd.read_csv('TestPie.csv')

# Convert 'Start Date' to datetime format
df['Start Date'] = pd.to_datetime(df['Start Date'])

# Extract x and y coordinates
x = df['Start Date']
y = df['Start Page']

# Convert datetime to numerical values
x_num = mdates.date2num(x)

# Sample data for pie charts
pie_data = [np.random.rand(4) for _ in range(len(x))]

# Create scatter plot with pie charts as points
fig, ax = plt.subplots()
fig.patch.set_facecolor('gray')  # Set background color of the figure to gray
ax.set_facecolor('gray')  # Set background color of the axes to gray

for (i, j, data, is_approx) in zip(x_num, y, pie_data, df['Is Approximate?']):
    # Set size based on "Is Approximate?" column
    if is_approx == 'T':
        width, height = 20, 20  # Dimensions for approximate pie charts
    else:
        width, height = 40, 20  # Dimensions for non-approximate pie charts

    # Create a new figure for each pie chart without extra whitespace around it.
    fig_pie, ax_pie = plt.subplots(figsize=(1, 1), dpi=300)
    wedges, texts = ax_pie.pie(data)
    ax_pie.axis('off')  # Hide axes

    # Set background color based on "Is Approximate?" column
    if is_approx == 'T':
        fig_pie.patch.set_facecolor('white')
    else:
        fig_pie.patch.set_facecolor('black')

    # Save figure into buffer without extra padding or margins.
    buf = BytesIO()
    fig_pie.savefig(buf, format='png', bbox_inches='tight', pad_inches=0)
    buf.seek(0)
    image = Image.open(buf)

    # Resize the image to create an elliptical shape
    image = image.resize((width, height), Image.Resampling.LANCZOS)

    # Create a circular mask
    mask = Image.new('L', image.size, 0)
    draw = ImageDraw.Draw(mask)
    draw.ellipse((0, 0, image.size[0], image.size[1]), fill=255)

    # Apply the mask to the image
    image.putalpha(mask)

    # Convert image to array for OffsetImage
    image = np.array(image)
    imagebox = OffsetImage(image, zoom=0.3)  # Adjust the zoom level

    ab = AnnotationBbox(imagebox, (i, j), frameon=False)
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
