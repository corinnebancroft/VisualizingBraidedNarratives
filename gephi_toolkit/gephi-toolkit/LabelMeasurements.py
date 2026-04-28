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

import xml.etree.ElementTree as ET

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

        estimates.append({
            "label": label,
            "font_size": font_size,
            "width": estimated_width,
            "height": estimated_height
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
