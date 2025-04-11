
import plotly.graph_objects as go

# Data for scatter plot
scatter_x = [1, 2, 3, 4, 5]
scatter_y = [10, 11, 12, 13, 14]

# Data for pie charts
pie_data = [
    [10, 20, 30, 40],
    [20, 30, 10, 40],
    [30, 10, 20, 40],
    [40, 20, 30, 10],
    [10, 40, 20, 30]
]

# Create scatter plot
fig = go.Figure()

# Add scatter plot points
fig.add_trace(go.Scatter(
    x=scatter_x,
    y=scatter_y,
    mode='markers',
    marker=dict(size=20, symbol='circle', opacity=0)  # Invisible markers to position the pies
))

# Add pie charts as annotations
for i in range(len(scatter_x)):
    fig.add_trace(go.Pie(
        values=pie_data[i],
        labels=['A', 'B', 'C', 'D'],
        domain=dict(x=[scatter_x[i] / 6 - 0.05, scatter_x[i] / 6 + 0.05], y=[scatter_y[i] / 15 - 0.05, scatter_y[i] / 15 + 0.05]),
        hole=0.3,
        showlegend=False
    ))

# Update layout to remove grid and axes
fig.update_layout(
    xaxis=dict(showgrid=False, zeroline=False, showticklabels=False),
    yaxis=dict(showgrid=False, zeroline=False, showticklabels=False)
)

fig.show()
