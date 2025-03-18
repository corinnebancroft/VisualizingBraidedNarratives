import pandas as pd


def split_csv_by_range(input_file, output_file, column_name, min_value, max_value):
    # Read the input CSV file
    df = pd.read_csv(input_file)

    # Filter the dataframe based on the range of values in the specified column
    filtered_df = df[(df[column_name] >= min_value) & (df[column_name] <= max_value)]

    # Write the filtered dataframe to a new CSV file
    filtered_df.to_csv(output_file, index=False)


# Example usage
input_file = 'input.csv'  # Replace with your input file name
output_file = 'output_44_55.csv'  # Replace with your desired output file name
column_name = 'startPage'
min_value = 44
max_value = 55

split_csv_by_range(input_file, output_file, column_name, min_value, max_value)