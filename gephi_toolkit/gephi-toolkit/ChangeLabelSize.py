import xml.etree.ElementTree as ET

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

tree = ET.parse(svg_filename)
root = tree.getroot()

font_sizes = []

for elem in root.iter():
    fs = elem.attrib.get("font-size")
    if fs is not None:
        try:
            font_sizes.append(float(fs))
        except ValueError:
            pass

old_min = min(font_sizes)
old_max = max(font_sizes)

new_min = old_min      # keep ≈ 24
new_max = 150.0

import math

def rescale_font(size, old_min, old_max, new_min, new_max):
    if size <= old_min:
        return new_min
    return (
        new_min +
        math.log(size / old_min)
        / math.log(old_max / old_min)
        * (new_max - new_min)
    )

for elem in root.iter():
    fs = elem.attrib.get("font-size")
    if fs is not None:
        try:
            old_size = float(fs)
            new_size = rescale_font(
                old_size,
                old_min,
                old_max,
                new_min,
                new_max
            )
            elem.attrib["font-size"] = f"{new_size:.2f}"
        except ValueError:
            pass

output_file = svg_filename.replace(".svg", "_rescaled.svg")
tree.write(output_file)
print(f"Saved rescaled SVG to: {output_file}")

