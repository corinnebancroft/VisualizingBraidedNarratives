import xml.etree.ElementTree as ET
import csv
import os
import math

def get_svg_filename():
    # Prompt the user for inputs
    acronym = input("Enter acronym: ").strip()
    date = input("Enter date (e.g., April16): ").strip()
    graph_type = input("Enter graph type: ").strip()

    # Construct filename
    filename = f"{acronym}_{graph_type}_{date}.svg"

    return filename


if __name__ == "__main__":
    svg_filename = get_svg_filename()
    print(f"\nSVG filename will be: {svg_filename}")


def list_unique_font_sizes(svg_filename):
    tree = ET.parse(svg_filename)
    root = tree.getroot()

    # SVG namespace (required)
    ns = {"svg": "http://www.w3.org/2000/svg"}

    font_sizes = set()

    # Iterate over all <text> elements
    for text in root.findall(".//svg:text", ns):
        # Case 1: font-size attribute
        if "font-size" in text.attrib:
            font_sizes.add(text.attrib["font-size"])

        # Case 2: font-size inside style attribute
        elif "style" in text.attrib:
            style = text.attrib["style"]
            for part in style.split(";"):
                if part.strip().startswith("font-size"):
                    size = part.split(":")[1].strip()
                    font_sizes.add(size)

    return sorted(font_sizes, key=lambda x: float(x))


if __name__ == "__main__":
    svg_file = "s_ss_April16.svg"  # or any SVG in the same folder
    sizes = list_unique_font_sizes(svg_file)

    print("Unique font sizes found:")
    for size in sizes:
        print(size)
import math

def compute_label_bounding_radius(width, height):
    """
    Returns half the diagonal length of the label bounding box.
    This is the label bounding radius.
    """
    return 0.5 * math.sqrt(width**2 + height**2)

def estimate_label_space(svg_filename,
                         avg_char_width=0.6,
                         line_height_factor=1.2):
    """
    Returns a list of estimated label bounding boxes.
    Each entry contains:
      - text
      - font_size
      - estimated_width
      - estimated_height
    """

    tree = ET.parse(svg_filename)
    root = tree.getroot()
    ns = {"svg": "http://www.w3.org/2000/svg"}

    estimates = []

    for text_elem in root.findall(".//svg:text", ns):
        label = "".join(text_elem.itertext()).strip()
        if not label:
            continue

        font_size = None

        # Case 1: font-size attribute
        if "font-size" in text_elem.attrib:
            font_size = float(text_elem.attrib["font-size"])

        # Case 2: font-size in style
        elif "style" in text_elem.attrib:
            for part in text_elem.attrib["style"].split(";"):
                if part.strip().startswith("font-size"):
                    font_size = float(part.split(":")[1].strip())

        if font_size is None:
            continue

        char_count = len(label)

        estimated_width = font_size * avg_char_width * char_count
        estimated_height = font_size * line_height_factor

        label_radius = compute_label_bounding_radius(
            estimated_width, estimated_height
        )

        estimates.append({
            "label": label,
            "font_size": font_size,
            "width": estimated_width,
            "height": estimated_height,
            "label_radius": label_radius
        })

    return estimates

if __name__ == "__main__":
    svg_file = svg_filename  # use the user-provided filename

    estimates = estimate_label_space(svg_file)

    print("\nEstimated label sizes:\n")
    for e in estimates:
        print(
            f"{e['label']}: "
            f"{e['width']:.1f} × {e['height']:.1f} "
            f"(font-size {e['font_size']})"
        )

def percentile(values, p):
    """
    Compute the p-th percentile (0–100) of a list of numbers.
    Uses the simplest, standard definition.
    """
    if not values:
        return None

    values = sorted(values)
    k = (len(values) - 1) * (p / 100.0)
    f = int(k)
    c = min(f + 1, len(values) - 1)

    if f == c:
        return values[f]

    return values[f] * (c - k) + values[c] * (k - f)

def percentile(values, p):
    """
    Compute the p-th percentile (0–100) of a list of numbers.
    Uses the simplest, standard definition.
    """
    if not values:
        return None

    values = sorted(values)
    k = (len(values) - 1) * (p / 100.0)
    f = int(k)
    c = min(f + 1, len(values) - 1)

    if f == c:
        return values[f]

    return values[f] * (c - k) + values[c] * (k - f)

def export_measurements_to_csv(svg_filename, estimates):
    """
    Exports label measurements to a CSV file.
    Output filename: <svg_name>_measurements.csv
    """

    base_name, _ = os.path.splitext(svg_filename)
    csv_filename = f"{base_name}_measurements.csv"

    with open(csv_filename, mode="w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["label", "width", "height", "font_size", "label_radius"])

        for e in estimates:
            writer.writerow([
                e["label"],
                f"{e['width']:.2f}",
                f"{e['height']:.2f}",
                e["font_size"],
                f"{e['label_radius']:.2f}"
            ])

    print(f"\nMeasurements exported to: {csv_filename}")

def append_label_summary(
    dataset,
    date,
    graph_type,
    radius_90,
    radius_median,
    radius_max,
    label_count,
    csv_filename="LabelMeasurements.csv"
):
    """
    Appends a single summary row to LabelMeasurements.csv.
    Creates the file and header if it does not exist.
    """

    file_exists = os.path.isfile(csv_filename)

    with open(csv_filename, mode="a", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)

        # Write header only once
        if not file_exists:
            writer.writerow([
                "Dataset",
                "Date",
                "GraphType",
                "LabelRadius90",
                "LabelRadiusMedian",
                "LabelRadiusMax",
                "LabelCount"
            ])

        writer.writerow([
            dataset,
            date,
            graph_type,
            f"{radius_90:.2f}",
            f"{radius_median:.2f}",
            f"{radius_max:.2f}",
            label_count
        ])

if __name__ == "__main__":
    svg_file = svg_filename  # user-provided filename

    estimates = estimate_label_space(svg_file)

    print("\nEstimated label sizes:\n")
    for e in estimates:
        print(
            f"{e['label']}: "
            f"{e['width']:.1f} × {e['height']:.1f} "
            f"(font-size {e['font_size']})"
        )

    export_measurements_to_csv(svg_file, estimates)

    # --- Compute and report 90th-percentile label radius ---

    label_radii = [
        e["label_radius"]
        for e in estimates
        if e["label_radius"] is not None
    ]

    radius_90 = percentile(label_radii, 90)

    print(f"\n90th-percentile label bounding radius: {radius_90:.2f} px")

    # Optional: helpful sanity checks
    print(f"Median label radius: {percentile(label_radii, 50):.2f} px")
    print(f"Maximum label radius: {max(label_radii):.2f} px")
    print(f"Number of labels measured: {len(label_radii)}")

    # --- Compute summary statistics ---
    label_radii = [e["label_radius"] for e in estimates]

    radius_90 = percentile(label_radii, 90)
    radius_median = percentile(label_radii, 50)
    radius_max = max(label_radii)
    label_count = len(label_radii)

    # --- Append to master CSV ---
    append_label_summary(
        dataset=svg_filename.split("_")[0],  # acronym
        date=svg_filename.split("_")[-1].replace(".svg", ""),
        graph_type=svg_filename.split("_")[1],
        radius_90=radius_90,
        radius_median=radius_median,
        radius_max=radius_max,
        label_count=label_count
    )

    print("\nLabel summary appended to LabelMeasurements.csv")