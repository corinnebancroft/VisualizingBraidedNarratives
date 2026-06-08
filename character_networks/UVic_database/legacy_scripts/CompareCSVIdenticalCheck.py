import pandas as pd


def compare_csv(file1, file2):
    # Read the CSV files into DataFrames
    df1 = pd.read_csv(file1)
    df2 = pd.read_csv(file2)

    # Compare the DataFrames
    if df1.equals(df2):
        print("The two CSV files have the same data.")
    else:
        print("The two CSV files have different data.")

        # Find differences
        diff = pd.concat([df1, df2]).drop_duplicates(keep=False)

        # Print differences
        print("Differences between the two CSV files:")
        print(diff)


# Example usage
file1 = 'data/s/April14GephiReadyExports/sStorySpaceEdgesApril14.csv'
file2 = 'data/s/April15GephiReadyExports/sStorySpaceEdgesApril15.csv'
compare_csv(file1, file2)

# --- Compare PRE-DEDUPE diagnostic file to expected row count ---

pre_dedup_path = input(
    "Enter path to PRE_DEDUP diagnostic CSV: "
).strip()

pre_dedup_df = pd.read_csv(pre_dedup_path)

expected_pre_dedup_rows = (
    len(rels)
    + num_reciprocal_base
    + expected_narrator_rows
)

actual_pre_dedup_rows = len(pre_dedup_df)

print("\n--- Pre-Dedup Row Reconciliation ---")
print("Expected pre-dedup rows:", expected_pre_dedup_rows)
print("Actual pre-dedup rows  :", actual_pre_dedup_rows)

if actual_pre_dedup_rows != expected_pre_dedup_rows:
    print("❌ ERROR: Pre-dedup row count does not match expectation.")
else:
    print("✅ Pre-dedup row count matches expected value exactly.")
