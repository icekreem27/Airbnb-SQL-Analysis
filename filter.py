import pandas as pd

# Read the first CSV file into a DataFrame
file1 = 'data/cleaned_Listings.csv'
df1 = pd.read_csv(file1)

# Extract the listing_id column from the first DataFrame
listing_ids = df1['listing_id'].unique()

# Read the second CSV file into another DataFrame
file2 = 'data/Reviews.csv'
df2 = pd.read_csv(file2)

# Filter the second DataFrame to include only rows with listing_ids from the first DataFrame
filtered_df = df2[df2['listing_id'].isin(listing_ids)]

# Save the filtered DataFrame to a new CSV file
output_file = 'filtered_reviews.csv'
filtered_df.to_csv(output_file, index=False)

print(f"Filtered data has been saved, {output_file}")
