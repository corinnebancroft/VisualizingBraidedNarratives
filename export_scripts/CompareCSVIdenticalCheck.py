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
file1 = 'data/gs/Mar12/GSGephiReadyMar12/GSExchangesOnlyMar12.csv'
file2 = 'data/gs/Mar27/GSExchangesOnlyMar12.csv'
compare_csv(file1, file2)

