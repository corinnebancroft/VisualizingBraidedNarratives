import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import matplotlib.dates as mdates

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

for (i, j, data) in zip(x_num, y, pie_data):
    size = 10  # Size of the pie chart
    wedges, texts = ax.pie(data, radius=size, center=(i, j), frame=True)
    # Ensure the pie chart is plotted correctly
    for wedge in wedges:
        wedge.set_edgecolor('black')

ax.set_xlim(min(x_num), max(x_num))
ax.set_ylim(0, 21)  # Set y-axis limits to match the range of Start Page values
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
