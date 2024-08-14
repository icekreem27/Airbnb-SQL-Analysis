import pandas as pd

# Load the dataset with the correct encoding
df = pd.read_csv('data/Listings.csv', encoding='ISO-8859-1', low_memory=False, nrows=500)

# Define the boolean columns
boolean_columns = [
    'host_has_profile_pic', 
    'host_is_superhost', 
    'host_identity_verified', 
    'instant_bookable'
]

# Clean up boolean columns
# Convert 'f' to False and 't' to True in the boolean columns
for col in boolean_columns:
    df[col] = df[col].map({'f': False, 't': True})

# Replace NaN values in boolean columns with False before converting to integers
df[boolean_columns] = df[boolean_columns].fillna(False).astype(int)

# drop columns with more than 50% missing values
df = df.dropna(thresh=0.5*len(df), axis=1)

# change names that are emtpy to unknown name
df['name'] = df['name'].fillna('unknown')

# Save the cleaned DataFrame to a new CSV file
df.to_csv('data/cleaned_Listings.csv', index=False)

# Print the first few rows and the count of null values
print(df.head())
print(df.isnull().sum())
