import os
import xml.etree.ElementTree as ET

SVG_NS = "http://www.w3.org/2000/svg"
ET.register_namespace("", SVG_NS)
NS = {"svg": SVG_NS}

LINE_HEIGHT_EM = 0.9
NODE_CENTER_SHIFT = 0.6   # start here; typical range 0.2–0.3

def smart_wrap(words, max_chars=16):
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
    tree = ET.parse(path)
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
            lines = smart_wrap(words, max_chars=16)

        n = len(lines)

        cx, cy, r = nodes[cls]
        n = len(words)

        # perceptual correction: shift text relative to node size
        cy = cy + r * NODE_CENTER_SHIFT

        total_offset = (n - 1) * LINE_HEIGHT_EM / 2.0

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
            dy = -total_offset if i == 0 else LINE_HEIGHT_EM
            tspan = ET.SubElement(
                text_el,
                "tspan",
                {
                    "x": str(cx),
                    "dy": f"{dy}em"
                }
            )
            tspan.text = line

    # -------------------------------------------------
    # 5. Write output
    # -------------------------------------------------
    tree.write(path, encoding="utf-8", xml_declaration=True)
    print(f"Overwritten: {path}")


def main():
    svgs = [f for f in os.listdir(".") if f.lower().endswith(".svg")]
    if not svgs:
        print("No SVG files found.")
        return

    for svg in svgs:
        process_svg(svg)


if __name__ == "__main__":
    main()