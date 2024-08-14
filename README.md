# Airbnb SQL Analysis

This repository contains the files for the analysis of Airbnb data using SQL. The project focuses on data cleaning, transformation, and querying to extract meaningful insights from the dataset.

## Repository Structure

- **data/**: Contains some of the raw and processed datasets used throughout the analysis.

- **docs/**: Documentation and reference materials related to the project. As well as images of the database structure.

- **analysis-queries.sql**: SQL scripts that contain various queries used to analyse the Airbnb dataset, ranging from basic data retrieval to more complex aggregations and joins.

- **analysis-queries.txt**: A text file version of the SQL queries for easy reference along with the data returned.

- **clean_Listings.py**: A Python script used for cleaning the listings data. This script handles missing values, corrects data types, and ensures that the dataset is ready for analysis.

- **filter.py**: A Python script used to filter and process specific data entries from the dataset. Specifically fetching relevant review_id for the minimised dataset.

- **split.py**: A Python script designed to split the singular large .csv file into manageble files that fit the normalised schema.

- **initial_schema.sql**: SQL script defining the initial database schema, setting up tables and relationships based on the raw data structure.

- **updated_schema.sql**: SQL script with the updated database schema after normalisation and optimisation. This includes the final table structures used in the analysis.
