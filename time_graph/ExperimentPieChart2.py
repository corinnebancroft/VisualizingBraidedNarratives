import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import matplotlib.dates as mdates
from matplotlib.offsetbox import OffsetImage, AnnotationBbox
from io import BytesIO
from PIL import Image, ImageDraw
import matplotlib.colors as mcolors

# Load your data into a DataFrame
# Replace 'your_data.csv' with the path to your dataset
df = pd.read_csv('PoDTimeGraphApril2.csv')

# Convert 'Start Date' and 'End Date' to datetime format
df['Start Date'] = pd.to_datetime(df['Start Date'])
df['End Date'] = pd.to_datetime(df['End Date'])

# Calculate midpoints for X and Y coordinates
df['Mid Date'] = df['Start Date'] + (df['End Date'] - df['Start Date']) / 2
df['Mid Page'] = df['Start Page'] + (df['End Page'] - df['Start Page']) / 2

# Extract x and y coordinates
x = df['Mid Date']
y = df['Mid Page']

# Convert datetime to numerical values
x_num = mdates.date2num(x)

# Detect column titles starting from column 16 (index 15)
pie_columns = df.columns[15:]

# Create pie chart data based on the presence of 'T' in the specified columns
pie_data = []
for index, row in df.iterrows():
    slices = [1 if row[col] == 'T' else 0 for col in pie_columns]
    total_slices = sum(slices)
    if total_slices > 0:
        pie_data.append([slice / total_slices for slice in slices])
    else:
        pie_data.append([0] * len(pie_columns))

# Assign colors to unique narrators
unique_narrators = df['Narrator'].unique()
colors = list(mcolors.TABLEAU_COLORS.values())
narrator_colors = {narrator: colors[i % len(colors)] for i, narrator in enumerate(unique_narrators)}

# Create scatter plot with pie charts as points
fig, ax = plt.subplots()
fig.patch.set_facecolor('gray')  # Set background color of the figure to gray
ax.set_facecolor('gray')  # Set background color of the axes to gray

# Detect the earliest and latest dates in the dataset
earliest_date = df['Start Date'].min()
latest_date = df['End Date'].max()

# Calculate the total range of dates in days
total_days = (latest_date - earliest_date).days

# Detect the earliest and latest pages in the dataset
earliest_page = df['Start Page'].min()
latest_page = df['End Page'].max()

# Calculate the total range of pages
total_pages = abs(latest_page - earliest_page)

# Get the width of the plot in inches
plot_width_in_inches = fig.get_size_inches()[0]

for (i, j, data, is_approx, start_date, end_date, start_page, end_page, narrator) in zip(x_num, y, pie_data,
                                                                                         df['Is Approximate?'],
                                                                                         df['Start Date'],
                                                                                         df['End Date'],
                                                                                         df['Start Page'],
                                                                                         df['End Page'],
                                                                                         df['Narrator']):
    # Determine width based on "Start Date" and "End Date"
    if start_date == end_date:
        width = 20
    else:
        date_diff_days = (end_date - start_date).days
        width = 20 + (date_diff_days / total_days) * plot_width_in_inches * 100  # Convert to inches and scale

    # Determine height based on "Start Page" and "End Page"
    if start_page == end_page:
        height = 20
    else:
        page_diff = abs(end_page - start_page)
        height = 20 + (page_diff / total_pages) * plot_width_in_inches * 100  # Convert to inches and scale

    # Create a new figure for each pie chart without extra whitespace around it.
    fig_pie, ax_pie = plt.subplots(figsize=(width / 100, height / 100), dpi=300)

    # Check if data contains NaN or invalid values and handle them by replacing with zeros
    data = [0 if np.isnan(slice) else slice for slice in data]

    # Ensure that data is valid for pie chart creation by checking if all values are zero
    if all(slice == 0 for slice in data):
        data[0] = 1  # Assign a value to avoid invalid pie chart creation

    wedges, texts = ax_pie.pie(data, wedgeprops=dict(linewidth=0))

    # Set border color and thickness based on narrator
    for wedge in wedges:
        wedge.set_edgecolor(narrator_colors[narrator])
        wedge.set_linewidth(2)  # Adjust the thickness here (default is 1)

    ax_pie.axis('off')  # Hide axes

    # Set background color based on "Is Approximate?" column
    background_color = narrator_colors[narrator] # this will avoid whitespace
    if is_approx == 'T':
        fig_pie.patch.set_facecolor(background_color)
        pad_inches_value = 0  # No background space between border and edge of image
    else:
        fig_pie.patch.set_facecolor('black')
        pad_inches_value = 10 / fig_pie.dpi  # Space of about the same width as the pie chart border

    # Save figure into buffer without extra padding or margins.
    buf = BytesIO()
    fig_pie.savefig(buf, format='png', bbox_inches='tight', pad_inches=pad_inches_value)
    buf.seek(0)
    image = Image.open(buf)

    # Resize the image to create an elliptical shape
    image = image.resize((int(width), int(height)), Image.Resampling.LANCZOS)

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
