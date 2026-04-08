# This script checks the time graph csv files to ensure they are formatted correctly to build the time graph pages.

from pathlib import Path
import pandas as pd

# Ask user for the CSV file name (including .csv)
in_filename = input("Enter the CSV file name (including .csv): ").strip()

if not in_filename:
    print("No file name provided. Exiting.")
    quit()

# Input is exactly what the user typed
in_path = Path(in_filename)

# Ask user for Acronym
graphAcronym = input("Enter the acronym for this novel: ").strip()
if not graphAcronym:
    print("No acronym provided. Exiting.")
    quit()

# Create output name: acronym + "input.csv"
out_filename = f"{graphAcronym}input.csv"
out_path = Path(out_filename)

# Check that the input exists
if not in_path.exists():
    print(f"Input file not found: {in_path.resolve()}")
    quit()

print(f"Reading:  {in_path.name}")
print(f"Will save: {out_path.name}")

# Read the CSV as text (safe for messy spreadsheets)
df = pd.read_csv(in_path, dtype=str, keep_default_na=False)

# Make sure the columns have the correct titles
REQUIRED_HEADERS = [
    "Relative Order",
    "Event Name",
    "Start Date",
    "End Date",
    "Is Approximate?",
    "Narrator",
    "Start Page",
    "End Page",
    "Start Date TT",
    "End Date TT",
    "Start Page TT",
    "End Page TT",
    "Is Approximate TT?",
    "Evidence",
]

# Convert 1-based index -> Excel column letter (A, B, C, ..., AA, AB ...)
def excel_col_letter(n: int) -> str:
    s = ""
    while n > 0:
        n, r = divmod(n - 1, 26)
        s = chr(65 + r) + s
    return s

# Get existing headers from the DataFrame
current_headers = list(df.columns)

# Make a modifiable copy
fixed_headers = current_headers[:]

# Only check the required positions
limit = min(len(REQUIRED_HEADERS), len(fixed_headers))

# Loop through expected headers
for i in range(limit):
    expected = REQUIRED_HEADERS[i]
    found = fixed_headers[i]

    if found != expected:
        pos = i + 1
        letter = excel_col_letter(pos)

        print(
            f"\nHeader mismatch at column {pos} (Excel {letter}):"
            f"\n  Found   : '{found}'"
            f"\n  Expected: '{expected}'"
        )

        user = input(
            "Type the correct title for this column "
            f"(press Enter to accept '{expected}'): "
        ).strip()

        fixed_headers[i] = user if user else expected

# Apply corrected headers back to the DataFrame
df.columns = fixed_headers

# --- Build "Participating Characters" column right after "Evidence" (as a formatted string) ---

if "Evidence" not in df.columns:
    raise KeyError("Expected column 'Evidence' not found.")
evidence_idx = df.columns.get_loc("Evidence")

# All columns to the right of Evidence are character columns
character_cols = list(df.columns[evidence_idx + 1:])

def _is_true(val) -> bool:
    return str(val).strip().upper() in {"T", "TRUE", "Y", "YES", "1"}

def _list_participating(row):
    return [col for col in character_cols if _is_true(row.get(col, ""))]

def _format_name_list(names):
    """
    Convert a list of names into a natural-language string:
    - [] -> ""
    - ["A"] -> "A"
    - ["A", "B"] -> "A and B"
    - ["A", "B", "C"] -> "A, B, and C"
    Names are sorted alphabetically, case-insensitively, preserving original casing.
    """
    if not names:
        return ""
    # Strip whitespace just in case
    names = [n.strip() for n in names if str(n).strip() != ""]
    if not names:
        return ""
    # Sort case-insensitively, but keep original forms
    names = sorted(names, key=lambda s: s.casefold())
    if len(names) == 1:
        return names[0]
    if len(names) == 2:
        return f"{names[0]} and {names[1]}"
    # Oxford/serial comma for 3+
    return f"{', '.join(names[:-1])}, and {names[-1]}"

# Compute and insert the column immediately after "Evidence"
participating_series = df.apply(_list_participating, axis=1).apply(_format_name_list)
df.insert(evidence_idx + 1, "Participating Characters", participating_series)


# --- Fix dates to YYYY-MM-DD ---

import re

DATE_COLS = ["Start Date", "End Date", "Start Date TT", "End Date TT"]

# Regexes for the only two patterns we will accept
RE_YMD = re.compile(r"^\s*(\d{4})-(\d{1,2})-(\d{1,2})\s*$")
RE_MDY = re.compile(r"^\s*(\d{1,2})-(\d{1,2})-(\d{4})\s*$")

# Recognize lots of “dash-like” chars, slashes, or dots as separators, replace with hyphen
DASH_CLASS = r"[\u2010\u2011\u2012\u2013\u2014\u2015\u2212\-]"  # various unicode dashes + ASCII -
SEP_CLASS  = rf"(?:{DASH_CLASS}|/|\.)"

def normalize_to_iso(s: str) -> str:
    """Return YYYY-MM-DD for acceptable inputs; else ''."""
    if s is None:
        return ""
    # 1) Trim and map separators to ASCII hyphen
    s = str(s).strip()
    s = re.sub(SEP_CLASS, "-", s)
    # 2) Remove stray non-digits & non-hyphens (e.g., NBSP, zero-width chars)
    s = re.sub(r"[^\d\-]", "", s)
    # 3) Collapse multiple hyphens
    s = re.sub(r"-{2,}", "-", s).strip("-")

    # 4) Try YYYY-M-D
    m = RE_YMD.match(s)
    if m:
        y, mo, d = int(m.group(1)), int(m.group(2)), int(m.group(3))
        try:
            # Simple bounds check; avoids importing datetime if you want to stay minimal
            if 1 <= mo <= 12 and 1 <= d <= 31:
                return f"{y:04d}-{mo:02d}-{d:02d}"
        except Exception:
            pass
        return ""

    # 5) Try M-D-YYYY
    m = RE_MDY.match(s)
    if m:
        mo, d, y = int(m.group(1)), int(m.group(2)), int(m.group(3))
        try:
            if 1 <= mo <= 12 and 1 <= d <= 31:
                return f"{y:04d}-{mo:02d}-{d:02d}"
        except Exception:
            pass
        return ""

    # 6) Not recognized → blank
    return ""

for col in DATE_COLS:
    if col in df.columns:
        raw = df[col].astype(str)
        fixed = raw.map(normalize_to_iso)

        # Assign normalized dates
        df[col] = fixed

        # Diagnostics:
        # - For Start Date / End Date: any blanks mean “bad” (these should never be blank)
        # - For TT columns: only non-empty raw values that became blank are “bad”
        if col in ("Start Date", "End Date"):
            bad_mask = (raw.str.strip() != "") & (fixed == "")
        else:
            bad_mask = (raw.str.strip() != "") & (fixed == "")

        if bad_mask.any():
            print(f"\nUnparseable values in column '{col}' (showing up to 10):")
            for v in raw[bad_mask].head(10).unique():
                # Show code points to reveal hidden chars
                cps = " ".join(f"U+{ord(ch):04X}" for ch in v)
                print(f"  -> {repr(v)}   [{cps}]")

# --- Validate date columns with clear messages ---

# Re-parse dates so we can inspect NaT precisely (keeps code readable)
# (If you still have the Series 's' from normalization, you can reuse it — this is explicit.)
start_parsed = pd.to_datetime(df["Start Date"].astype(str).str.strip(), errors="coerce", dayfirst=False)
end_parsed   = pd.to_datetime(df["End Date"].astype(str).str.strip(),   errors="coerce", dayfirst=False)

# 1) Start/End must have NO NaT (no blanks or unparseable values allowed)
start_nat_idx = start_parsed.isna()
end_nat_idx   = end_parsed.isna()

if start_nat_idx.any():
    print("\nERROR: 'Start Date' has blank or unparseable values in the following rows:")
    for i in df.index[start_nat_idx]:
        # 1-based row number for user friendliness
        print(f"  Row {i+1}: Start Date = {repr(df.at[i, 'Start Date'])}")

if end_nat_idx.any():
    print("\nERROR: 'End Date' has blank or unparseable values in the following rows:")
    for i in df.index[end_nat_idx]:
        print(f"  Row {i+1}: End Date = {repr(df.at[i, 'End Date'])}")

# 2) TT dates can be blank, but non-empty values must be parseable
for tt_col in ["Start Date TT", "End Date TT"]:
    if tt_col in df.columns:
        raw = df[tt_col].astype(str).str.strip()
        parsed = pd.to_datetime(raw, errors="coerce", dayfirst=False)

        # "Bad" means: value is non-empty AND parsed is NaT
        bad_mask = (raw != "") & parsed.isna()
        if bad_mask.any():
            print(f"\nERROR: '{tt_col}' has unparseable non-empty values in the following rows:")
            for i in df.index[bad_mask]:
                print(f"  Row {i+1}: {tt_col} = {repr(df.at[i, tt_col])}")
            # Optionally abort:
            # raise SystemExit(1)

# Write the output
df.to_csv(out_path, index=False, lineterminator="\n")

print(f"Clean file written to: {out_path.resolve()}")