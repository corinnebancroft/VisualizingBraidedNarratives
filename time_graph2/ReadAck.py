import csv
import sys

if len(sys.argv) != 4:
    sys.exit("Usage: ack_csv_to_properties.py ack.csv ACRONYM out.properties")

csv_file = sys.argv[1]
acronym = sys.argv[2]
out_file = sys.argv[3]

with open(csv_file, newline="", encoding="utf-8-sig") as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row["Acronym"].strip() == acronym:
            with open(out_file, "w", encoding="utf-8") as out:
                for key, value in row.items():
                    prop_key = f"ack.{key.strip().lower()}"
                    prop_key = prop_key.replace(" ", ".")
                    out.write(f"{prop_key}={value.strip()}\n")
            sys.exit(0)

sys.exit(f"Acronym not found: {acronym}")