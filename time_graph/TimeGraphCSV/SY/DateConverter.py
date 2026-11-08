import pandas as pd

# Files
input_file = "sygsdata.xlsx"
output_file = "sygsdata_with_dates.xlsx"

# Read spreadsheet
df = pd.read_excel(input_file)

# Create Start Date column
df["Start Date"] = pd.to_datetime(
    {
        "year": df["year_s"],
        "month": df["mon_s"],
        "day": df["day_s"]
    },
    errors="coerce"
).dt.strftime("%Y-%m-%d")

# Create End Date column
df["End Date"] = pd.to_datetime(
    {
        "year": df["year_e"],
        "month": df["mon_e"],
        "day": df["day_e"]
    },
    errors="coerce"
).dt.strftime("%Y-%m-%d")

# Move Start Date to immediately after start_totaled
start_pos = df.columns.get_loc("start_totaled") + 1
start_col = df.pop("Start Date")
df.insert(start_pos, "Start Date", start_col)

# Move End Date to immediately after end_totaled
end_pos = df.columns.get_loc("end_totaled") + 1
end_col = df.pop("End Date")
df.insert(end_pos, "End Date", end_col)

# Save result
df.to_excel(output_file, index=False)

print(f"Done. Saved: {output_file}")