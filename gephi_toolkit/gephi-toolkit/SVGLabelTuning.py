from lxml import etree
import math

SVG_NS = "http://www.w3.org/2000/svg"
NSMAP = {"svg": SVG_NS}


def wrap_words_four_lines(words):
    """
    Returns a list of up to 4 strings (lines),
    preserving word order.
    """
    n = len(words)

    if n <= 1:
        return [" ".join(words)]

    if n <= 4:
        return words  # one word per line

    chunk_size = math.ceil(n / 4)
    return [
        " ".join(words[i:i + chunk_size])
        for i in range(0, n, chunk_size)
    ][:4]


def process_svg(input_svg, output_svg, line_height_em=1.1):
    parser = etree.XMLParser(remove_blank_text=False)
    tree = etree.parse(input_svg, parser)
    root = tree.getroot()

    for text in root.xpath("//svg:text", namespaces=NSMAP):

        if text.text is None:
            continue

        label = text.text.strip()
        if not label or " " not in label:
            continue

        words = label.split()
        lines = wrap_words_four_lines(words)

        # Clear existing text
        text.text = None
        text.attrib.pop("xml:space", None)

        for i, line in enumerate(lines):
            tspan = etree.SubElement(text, f"{{{SVG_NS}}}tspan")
            tspan.text = line
            tspan.set("x", text.get("x"))

            # First line stays on baseline; others shift down
            if i == 0:
                tspan.set("dy", "0")
            else:
                tspan.set("dy", f"{line_height_em}em")

    tree.write(
        output_svg,
        pretty_print=True,
        encoding="UTF-8",
        xml_declaration=True
    )


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 3:
        print("Usage: python wrap_gephi_svg_labels.py input.svg output.svg")
        sys.exit(1)

    process_svg(sys.argv[1], sys.argv[2])
