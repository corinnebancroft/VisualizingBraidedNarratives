from pathlib import Path
import pandas as pd
import re

# ============================================================
# DATE AUDIT TOOL
# ============================================================

DATE_COLS_CLEANED = [
    "Start Date",
    "End Date",
    "Start Date TT",
    "End Date TT"
]

DASH_CLASS = r"[\u2010\u2011\u2012\u2013\u2014\u2015\u2212\-]"
SEP_CLASS = rf"(?:{DASH_CLASS}|/|\.)"

CANDIDATE_FORMATS = [
    "%Y-%m-%d",
    "%d-%m-%Y",
    "%m-%d-%Y",
]

# ============================================================
# HEADER DETECTION
# ============================================================

def normalize_header(name):
    return re.sub(
        r"[^a-z0-9]",
        "",
        str(name).lower()
    )


def find_date_columns(df):

    start_matches = []
    end_matches = []

    for col in df.columns:

        normalized = normalize_header(col)

        if "startdate" in normalized:
            start_matches.append(col)

        if "enddate" in normalized:
            end_matches.append(col)

    result = {
        "Start Date": None,
        "End Date": None,
        "Start Date TT": None,
        "End Date TT": None,
    }

    if len(start_matches) >= 1:
        result["Start Date"] = start_matches[0]

    if len(start_matches) >= 2:
        result["Start Date TT"] = start_matches[1]

    if len(end_matches) >= 1:
        result["End Date"] = end_matches[0]

    if len(end_matches) >= 2:
        result["End Date TT"] = end_matches[1]

    return result


def find_start_page_column(df):

    matches = []

    for col in df.columns:

        normalized = normalize_header(col)

        if "startpage" in normalized:
            matches.append(col)

    if matches:
        return matches[0]

    return None


def find_event_column(df):

    # Prefer Event Name

    for col in df.columns:

        normalized = normalize_header(col)

        if "eventname" in normalized:
            return col

    # Otherwise first column containing Event

    for col in df.columns:

        normalized = normalize_header(col)

        if "event" in normalized:
            return col

    return None

# ============================================================
# DATE FORMAT DETECTION
# ============================================================

def detect_dominant_format(series):

    values = []

    for v in series.astype(str):

        v = v.strip()

        if v:
            v = re.sub(SEP_CLASS, "-", v)
            values.append(v)

    if not values:
        return None

    best_fmt = None
    best_score = -1

    for fmt in CANDIDATE_FORMATS:

        score = 0

        for value in values:

            try:

                pd.to_datetime(
                    value,
                    format=fmt,
                    errors="raise"
                )

                score += 1

            except Exception:
                pass

        if score > best_score:
            best_score = score
            best_fmt = fmt

    return best_fmt


def parse_original_date(value, fmt):

    value = str(value).strip()

    if not value:
        return None

    value = re.sub(
        SEP_CLASS,
        "-",
        value
    )

    try:

        return pd.to_datetime(
            value,
            format=fmt,
            errors="raise"
        )

    except Exception:

        return None

# ============================================================
# FILE INPUT
# ============================================================

print("=== DATE AUDIT TOOL ===\n")

orig_name = input(
    "Enter ORIGINAL csv filename (same folder as this script): "
).strip()

clean_name = input(
    "Enter CLEANED csv filename (in ../time_graph): "
).strip()

orig_path = Path(orig_name)
clean_path = Path("..") / clean_name

if not orig_path.exists():

    print("\nERROR: Original file not found:")
    print(orig_path.resolve())
    quit()

if not clean_path.exists():

    print("\nERROR: Cleaned file not found:")
    print(clean_path.resolve())
    quit()

# ============================================================
# LOAD FILES
# ============================================================

print("\nLoading files...")

orig = pd.read_csv(
    orig_path,
    dtype=str,
    keep_default_na=False
)

clean = pd.read_csv(
    clean_path,
    dtype=str,
    keep_default_na=False
)

print("Files loaded.")

# ============================================================
# COLUMN DETECTION
# ============================================================

orig_cols = find_date_columns(orig)

event_col = find_event_column(orig)

start_page_col = find_start_page_column(orig)

print("\nDetected ORIGINAL columns:")

for logical_name, actual_name in orig_cols.items():

    print(
        f"  {logical_name:<15} -> {actual_name}"
    )

print(
    f"  Event Column   -> {event_col}"
)

print(
    f"  Start Page     -> {start_page_col}"
)

# ============================================================
# SORT FILES
# ============================================================

orig_start_date_col = orig_cols["Start Date"]

if orig_start_date_col is None:

    print(
        "\nERROR: Could not locate Start Date "
        "in original file."
    )

    quit()

if start_page_col is None:

    print(
        "\nERROR: Could not locate Start Page "
        "in original file."
    )

    quit()

orig["_sort_start_page"] = pd.to_numeric(
    orig[start_page_col],
    errors="coerce"
)

clean["_sort_start_page"] = pd.to_numeric(
    clean["Start Page"],
    errors="coerce"
)

orig = orig.sort_values(
    by=[
        orig_start_date_col,
        "_sort_start_page"
    ],
    kind="stable"
)

clean = clean.sort_values(
    by=[
        "Start Date",
        "_sort_start_page"
    ],
    kind="stable"
)

orig = orig.reset_index(drop=True)
clean = clean.reset_index(drop=True)

print(
    "\nFiles sorted by Start Date and Start Page."
)

# ============================================================
# FORMAT DETECTION
# ============================================================

column_formats = {}

print("\nDetected original date formats:")

for logical_col in DATE_COLS_CLEANED:

    orig_col = orig_cols.get(logical_col)

    if orig_col is None:
        continue

    fmt = detect_dominant_format(
        orig[orig_col]
    )

    column_formats[logical_col] = fmt

    print(
        f"  {logical_col:<15} -> {fmt}"
    )

# ============================================================
# EVENT ORDER CHECK
# ============================================================

if (
    event_col is not None
    and "Event Name" in clean.columns
):

    mismatch_count = 0

    for i in range(min(len(orig), len(clean))):

        orig_event = str(
            orig.at[i, event_col]
        ).strip()

        clean_event = str(
            clean.at[i, "Event Name"]
        ).strip()

        if orig_event != clean_event:

            mismatch_count += 1

            if mismatch_count <= 20:

                print("\nEVENT ORDER MISMATCH")
                print(f"Row:      {i+2}")
                print(f"Original: {orig_event}")
                print(f"Cleaned:  {clean_event}")

    print(
        f"\nTotal event order mismatches: "
        f"{mismatch_count}"
    )

# ============================================================
# COMPARISON
# ============================================================

total_changes = 0
total_swaps = 0

for logical_col in DATE_COLS_CLEANED:

    orig_col = orig_cols.get(logical_col)

    if orig_col is None:
        continue

    if logical_col not in clean.columns:
        continue

    fmt = column_formats.get(logical_col)

    print(f"\n{'=' * 60}")
    print(f"Checking: {logical_col}")
    print(f"{'=' * 60}")

    for i in range(min(len(orig), len(clean))):

        raw_orig = str(
            orig.at[i, orig_col]
        ).strip()

        raw_clean = str(
            clean.at[i, logical_col]
        ).strip()

        if not raw_orig or not raw_clean:
            continue

        event_name = ""

        if (
            event_col is not None
            and event_col in orig.columns
        ):
            event_name = str(
                orig.at[i, event_col]
            )

        try:

            orig_dt = parse_original_date(
                raw_orig,
                fmt
            )

            if orig_dt is None:
                continue

            clean_dt = pd.to_datetime(
                raw_clean,
                format="%Y-%m-%d",
                errors="raise"
            )

            orig_iso = orig_dt.strftime(
                "%Y-%m-%d"
            )

            clean_iso = clean_dt.strftime(
                "%Y-%m-%d"
            )

            y1, m1, d1 = map(
                int,
                orig_iso.split("-")
            )

            y2, m2, d2 = map(
                int,
                clean_iso.split("-")
            )

            if (
                y1 == y2
                and m1 == d2
                and d1 == m2
                and orig_iso != clean_iso
            ):

                total_swaps += 1

                print(
                    "\n*** POSSIBLE MONTH/DAY SWAP ***"
                )

                print(f"Row:      {i + 2}")
                print(f"Event:    {event_name}")
                print(f"Column:   {logical_col}")
                print(f"Original: {raw_orig}")
                print(f"Cleaned:  {raw_clean}")
                print(
                    f"ISO:      "
                    f"{orig_iso} -> {clean_iso}"
                )

                continue

            if orig_dt.date() != clean_dt.date():

                total_changes += 1

                print(
                    "\n*** DATE CHANGED ***"
                )

                print(f"Row:      {i + 2}")
                print(f"Event:    {event_name}")
                print(f"Column:   {logical_col}")
                print(f"Original: {raw_orig}")
                print(f"Cleaned:  {raw_clean}")

                print(
                    f"Meaning:  "
                    f"{orig_dt.date()} -> "
                    f"{clean_dt.date()}"
                )

        except Exception:
            pass

# ============================================================
# SUMMARY
# ============================================================

print("\n")
print("=" * 60)
print("AUDIT COMPLETE")
print("=" * 60)

print(
    f"Date changes detected:      {total_changes}"
)

print(
    f"Possible month/day swaps:   {total_swaps}"
)

if total_changes == 0 and total_swaps == 0:

    print(
        "\nNo date discrepancies detected."
    )