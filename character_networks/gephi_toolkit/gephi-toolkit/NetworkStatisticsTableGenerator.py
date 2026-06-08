import pandas as pd

file_path = "network_statistics.csv"
df = pd.read_csv(file_path)


def generate_table(row):
    def format_value(v):
        # Only round numbers, leave everything else unchanged
        if isinstance(v, (int, float)):
            return round(v, 3)
        return v

    # Base columns
    headers = [
        "Characters",
        "Relationships",
        "Average Degree",
        "Mean Node Strength",
        "Average Weighted Degree",
        "Network Diameter",
        "Graph Density",
        "Modularity",
        "Number of Communities"
    ]

    values = [
        format_value(row["NumNodes"]),
        format_value(row["NumEdges"]),
        format_value(row["AverageDegree"]),
        format_value(row["MeanNodeStrength"]),
        format_value(row["AverageWeightedDegree"]),
        format_value(row["NetworkDiameter"]),
        format_value(row["GraphDensity"]),
        format_value(row["Modularity"]),
        format_value(row["NumCommunities"])
    ]

    # Conditional column
    if row["GraphType"] in ["exnf", "exnfncn"]:
        headers.append("Number of Characters Removed")
        values.append(format_value(row["NumFloatersRemoved"]))

    # Build HTML
    html = "<table>\n<thead>\n<tr>\n"

    for h in headers:
        html += f"  <th>{h}</th>\n"

    html += "</tr>\n</thead>\n<tbody>\n<tr>\n"

    for v in values:
        html += f"  <td>{v}</td>\n"

    html += "</tr>\n</tbody>\n</table>\n"

    return html

# Keep only the last occurrence of each Dataset
df_latest = df.drop_duplicates(subset=["Dataset", "GraphType"], keep="last")

# Loop through those rows
for _, row in df_latest.iterrows():
    print(f"Dataset: {row['Dataset']}")
    print(f"Graph Type: {row['GraphType']}")
    print(generate_table(row))
    print("\n" + "-"*50 + "\n")  # separator for readability

# Keep only the last occurrence of each Dataset
df_latest = df.drop_duplicates(subset=["Dataset", "GraphType"], keep="last")

# Open an HTML file for writing
with open("tables_output.html", "w", encoding="utf-8") as f:
    # Optional: basic HTML structure
    f.write("<html>\n<body>\n")

    # Loop through rows
    for _, row in df_latest.iterrows():
        f.write(f"<p><strong>Dataset:</strong> {row['Dataset']}<br>\n")
        f.write(f"<strong>Graph Type:</strong> {row['GraphType']}</p>\n")

        f.write(generate_table(row))
        f.write("<hr>\n")  # separator between tables

    f.write("</body>\n</html>")