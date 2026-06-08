import os
import xml.etree.ElementTree as ET
import sys

SVG_NS = "http://www.w3.org/2000/svg"
ET.register_namespace("", SVG_NS)
NS = {"svg": SVG_NS}

LINE_HEIGHT_FACTOR = 1.0   # adjust spacing between lines higher more space lower less space
BASELINE_FACTOR = 0.25     # fraction of font size


def smart_wrap(words, max_chars=14):
    """
    Group words into lines up to max_chars,
    without breaking words.
    """
    lines = []
    current = ""

    for w in words:
        if not current:
            current = w
        elif len(current) + 1 + len(w) <= max_chars:
            current += " " + w
        else:
            lines.append(current)
            current = w

    if current:
        lines.append(current)

    return lines

def process_svg(path):
    with open(path, "rb") as f:
        data = f.read()

    # strip UTF‑8 BOM and junk before <svg or <?xml
    data = data.lstrip(b'\xef\xbb\xbf')
    start = data.find(b'<svg')
    if start == -1:
        start = data.find(b'<?xml')
    data = data[start:]

    root = ET.fromstring(data)
    tree = ET.ElementTree(root)
    root = tree.getroot()

    # -------------------------------------------------
    # 1. Collect node positions from circles
    # -------------------------------------------------
    nodes = {}
    for circle in root.findall(".//svg:circle", NS):
        cls = circle.get("class")
        if not cls:
            continue
        nodes[cls] = (
            float(circle.get("cx")),
            float(circle.get("cy")),
            float(circle.get("r"))
        )

    # -------------------------------------------------
    # 2. Collect labels and remember their parents
    # -------------------------------------------------
    labels = []  # (parent, text_element, label_data)

    for parent in root.findall(".//svg:g", NS):
        for text in parent.findall("svg:text", NS):
            cls = text.get("class")
            if not cls:
                continue

            content = "".join(text.itertext()).strip()
            if not content:
                continue

            labels.append((
                parent,
                text,
                {
                    "class": cls,
                    "text": content,
                    "font-size": text.get("font-size", "12"),
                    "font-family": text.get("font-family", "Arial"),
                    "fill": text.get("fill", "#000000")
                }
            ))

    # -------------------------------------------------
    # 3. Remove original labels (correctly)
    # -------------------------------------------------
    for parent, text, _ in labels:
        parent.remove(text)

    # -------------------------------------------------
    # 3.5 Rescale Font Size (operate on collected labels)
    # -------------------------------------------------

    import math

    font_sizes = []
    for _, _, lbl in labels:
        try:
            font_sizes.append(float(lbl["font-size"]))
        except ValueError:
            pass

    if font_sizes:
        old_min = min(font_sizes)
        old_max = max(font_sizes)

        new_min = old_min  # keep smaller labels similar
        new_max = 125.0  # cap large labels

        def rescale_font(size, old_min, old_max, new_min, new_max):
            if size <= old_min:
                return new_min
            return (
                    new_min +
                    math.log(size / old_min)
                    / math.log(old_max / old_min)
                    * (new_max - new_min)
            )

        for _, _, lbl in labels:
            try:
                old_size = float(lbl["font-size"])
                new_size = rescale_font(
                    old_size,
                    old_min,
                    old_max,
                    new_min,
                    new_max
                )
                lbl["font-size"] = f"{new_size:.2f}"
            except ValueError:
                pass

    # -------------------------------------------------
    # 4. Create new label layer
    # -------------------------------------------------
    label_group = ET.SubElement(root, "g", {"id": "rebuilt-labels"})

    for _, _, lbl in labels:
        cls = lbl["class"]
        if cls not in nodes:
            continue

        words = lbl["text"].split()
        if not words:
            continue

        # Line-breaking strategy
        if len(words) == 2:
            # Keep existing behavior: one word per line
            lines = words
        else:
            # Use smart grouping for longer labels
            lines = smart_wrap(words)

        cx, cy, r = nodes[cls]

        #Calculate block height
        font_size_px = float(lbl["font-size"])
        line_height_px = font_size_px * LINE_HEIGHT_FACTOR
        baseline_shift_px = font_size_px * BASELINE_FACTOR

        n = len(lines)
        block_height_px = n * line_height_px
        block_top_y = cy - (block_height_px / 2.0)

        text_el = ET.SubElement(
            label_group,
            "text",
            {
                "x": str(cx),
                "y": str(cy),
                "text-anchor": "middle",
                "font-family": lbl["font-family"],
                "font-size": lbl["font-size"],
                "fill": lbl["fill"]
            }
        )

        for i, line in enumerate(lines):
            line_y = (
                    block_top_y
                    + (i + 0.5) * line_height_px
                    + baseline_shift_px
            )

            tspan = ET.SubElement(
                text_el,
                "tspan",
                {
                    "x": str(cx),
                    "y": str(line_y)
                }
            )
            tspan.text = line

    # -------------------------------------------------
    # 5. Write output
    # -------------------------------------------------
    tree.write(path, encoding="utf-8", xml_declaration=True)
    print(f"Overwritten: {path}")



def main():
    if len(sys.argv) < 2:
        print("Usage: python SVGLabelTuning.py <svg-file>")
        sys.exit(1)

    svg_path = sys.argv[1]

    if not os.path.exists(svg_path):
        print(f"SVG not found: {svg_path}")
        sys.exit(1)

    process_svg(svg_path)


if __name__ == "__main__":
    main()