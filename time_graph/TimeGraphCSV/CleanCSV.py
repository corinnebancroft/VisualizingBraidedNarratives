from pathlib import Path
import pandas as pd
import calendar
import re

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

# Required headers
REQUIRED_HEADERS = [
    "Relative Order","Event Name","Start Date","End Date","Is Approximate?","Narrator",
    "Start Page","End Page","Start Date TT","End Date TT",
    "Start Page TT","End Page TT","Is Approximate TT?","Evidence",
]

# Read CSV
df = pd.read_csv(in_path, dtype=str, keep_default_na=False)

# --- Remove completely empty rows and columns (Excel artifacts) ---

before_shape = df.shape

# Remove rows where ALL values are empty strings or whitespace
df = df[~df.apply(lambda row: all(str(v).strip() == "" for v in row), axis=1)]

# Remove columns that are completely empty,
# EXCEPT for required columns, which must be preserved.

df = df.loc[:, ~df.apply(
    lambda col: (
        col.name not in REQUIRED_HEADERS and
        all(str(v).strip() == "" for v in col)
    ),
    axis=0
)]

after_shape = df.shape

print(f"\nRemoved empty rows/columns:")
print(f"  Before: {before_shape}")
print(f"  After : {after_shape}")



def excel_col_letter(n: int) -> str:
    s = ""
    while n > 0:
        n, r = divmod(n - 1, 26)
        s = chr(65 + r) + s
    return s

current_headers = list(df.columns)
fixed_headers = current_headers[:]
limit = min(len(REQUIRED_HEADERS), len(fixed_headers))

for i in range(limit):
    expected = REQUIRED_HEADERS[i]
    found = fixed_headers[i]

    if found != expected:
        pos = i + 1
        letter = excel_col_letter(pos)
        print(f"\nHeader mismatch at column {pos} (Excel {letter}):")
        print(f"  Found   : '{found}'")
        print(f"  Expected: '{expected}'")

        user = input(
            f"Type the correct title (Enter = '{expected}'): "
        ).strip()

        fixed_headers[i] = user if user else expected

df.columns = fixed_headers

# --- Participating Characters ---

if "Evidence" not in df.columns:
    raise KeyError("Expected column 'Evidence' not found.")

evidence_idx = df.columns.get_loc("Evidence")
character_cols = list(df.columns[evidence_idx + 1:])

def _is_true(val) -> bool:
    return str(val).strip().upper() in {"T","TRUE","Y","YES","1"}

def _list_participating(row):
    return [c for c in character_cols if _is_true(row.get(c,""))]

def _format_name_list(names):
    if not names:
        return ""
    names = sorted([n.strip() for n in names if n.strip()], key=lambda s: s.casefold())
    if len(names) == 1:
        return names[0]
    if len(names) == 2:
        return f"{names[0]} and {names[1]}"
    return f"{', '.join(names[:-1])}, and {names[-1]}"

participating = df.apply(_list_participating, axis=1).apply(_format_name_list)
df.insert(evidence_idx+1,"Participating Characters",participating)

# --- Fix dates ---

DATE_COLS = ["Start Date","End Date","Start Date TT","End Date TT"]

DASH_CLASS = r"[\u2010\u2011\u2012\u2013\u2014\u2015\u2212\-]"
SEP_CLASS  = rf"(?:{DASH_CLASS}|/|\.)"

def normalize_to_iso(s: str) -> str:
    """Robust parser using pandas."""
    if s is None:
        return ""
    s = str(s).strip()
    if s == "":
        return ""
    s = re.sub(SEP_CLASS,"-",s)
    try:
        dt = pd.to_datetime(s, errors="coerce", dayfirst=True)
        if pd.isna(dt):
            return ""
        return dt.strftime("%Y-%m-%d")
    except:
        return ""

def clamp_to_valid_date(iso_date: str) -> str:
    if not iso_date:
        return ""
    try:
        y,mo,d = map(int, iso_date.split("-"))
        max_day = calendar.monthrange(y,mo)[1]
        if d > max_day:
            print(f"Adjusted invalid date {iso_date} -> {y:04d}-{mo:02d}-{max_day:02d}")
            d = max_day
        return f"{y:04d}-{mo:02d}-{d:02d}"
    except:
        return ""

for col in DATE_COLS:
    if col in df.columns:
        raw = df[col].astype(str)
        fixed = raw.map(normalize_to_iso).map(clamp_to_valid_date)
        df[col] = fixed

        # ORIGINAL DIAGNOSTIC (restored)
        bad_mask = (raw.str.strip() != "") & (fixed == "")
        if bad_mask.any():
            print(f"\nUnparseable values in column '{col}':")
            for v in raw[bad_mask].head(10).unique():
                cps = " ".join(f"U+{ord(ch):04X}" for ch in v)
                print(f"  -> {repr(v)} [{cps}]")

# --- VALIDATION (restored exactly) ---

start_parsed = pd.to_datetime(df["Start Date"], errors="coerce")
end_parsed   = pd.to_datetime(df["End Date"],   errors="coerce")

start_nat = start_parsed.isna()
end_nat   = end_parsed.isna()

if start_nat.any():
    print("\nERROR: 'Start Date' has bad values:")
    for i in df.index[start_nat]:
        print(f"  Row {i+1}: {repr(df.at[i,'Start Date'])}")

if end_nat.any():
    print("\nERROR: 'End Date' has bad values:")
    for i in df.index[end_nat]:
        print(f"  Row {i+1}: {repr(df.at[i,'End Date'])}")

# TT validation
for col in ["Start Date TT","End Date TT"]:
    raw = df[col].astype(str).str.strip()
    parsed = pd.to_datetime(raw, errors="coerce")
    bad = (raw != "") & parsed.isna()
    if bad.any():
        print(f"\nERROR in {col}:")
        for i in df.index[bad]:
            print(f"  Row {i+1}: {repr(df.at[i,col])}")

# ✅ NEW IMPROVEMENT: Row-level summary
print("\nDetailed row-level issues:")
bad_rows = df[(df["Start Date"]=="") | (df["End Date"]=="")]

for i in bad_rows.index:
    print(
        f"Row {i+1} | RO: {df.at[i,'Relative Order']} | "
        f"Event: {df.at[i,'Event Name']} | "
        f"Narrator: {df.at[i,'Narrator']} | "
        f"Missing: "
        f"{'Start ' if df.at[i,'Start Date']=='' else ''}"
        f"{'End' if df.at[i,'End Date']=='' else ''}"
    )

# Write
df.to_csv(out_path, index=False, lineterminator="\n")

print(f"Clean file written to: {out_path.resolve()}")