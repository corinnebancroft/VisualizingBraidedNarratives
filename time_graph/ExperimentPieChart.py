import matplotlib.pyplot as plt
import numpy as np

# Sample data for scatter plot
x = np.random.rand(10)
y = np.random.rand(10)

# Sample data for pie charts
pie_data = [np.random.rand(4) for _ in range(10)]

# Create scatter plot with pie charts as points
fig, ax = plt.subplots()

for (i, j, data) in zip(x, y, pie_data):
    size = 0.1  # Size of the pie chart
    wedges, texts = ax.pie(data, radius=size, center=(i, j), frame=True)

ax.set_xlim(0, 1)
ax.set_ylim(0, 1)
ax.set_aspect('equal')

plt.show()
