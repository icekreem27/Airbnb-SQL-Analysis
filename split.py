import pandas as pd

def load_data(listings_file, reviews_file):
    df_listings = pd.read_csv(listings_file)
    df_reviews = pd.read_csv(reviews_file)
    return df_listings, df_reviews

def create_host_table(df_listings):
    df_host = df_listings[['host_id', 'host_since', 'host_location', 'host_is_superhost', 
                           'host_total_listings_count', 'host_has_profile_pic', 'host_identity_verified']].drop_duplicates()
    return df_host

def create_location_table(df_listings):
    df_location = df_listings[['neighbourhood', 'city', 'latitude', 'longitude']].drop_duplicates()
    df_location['location_id'] = range(1, len(df_location) + 1)
    return df_location

def create_property_table(df_listings):
    df_property = df_listings[['listing_id', 'property_type', 'room_type', 'accommodates', 
                               'bedrooms', 'amenities', 'price', 'minimum_nights', 
                               'maximum_nights', 'instant_bookable']].drop_duplicates()
    df_property['property_id'] = range(1, len(df_property) + 1)
    return df_property

def create_review_scores_table(df_listings):
    df_review_scores = df_listings[['listing_id', 'review_scores_rating', 'review_scores_accuracy', 
                                    'review_scores_cleanliness', 'review_scores_checkin', 
                                    'review_scores_communication', 'review_scores_location', 
                                    'review_scores_value']].drop_duplicates()
    return df_review_scores

def create_listing_table(df_listings, df_location, df_property):
    # Include the necessary columns from df_listings
    df_listing = df_listings[['listing_id', 'host_id', 'neighbourhood', 'city', 'latitude', 'longitude']].drop_duplicates()

    # Merge with df_location
    df_listing = pd.merge(df_listing, df_location[['location_id', 'neighbourhood', 'city', 'latitude', 'longitude']],
                          on=['neighbourhood', 'city', 'latitude', 'longitude'], how='left')

    # Merge with df_property
    df_listing = pd.merge(df_listing, df_property[['property_id', 'listing_id']], on='listing_id')

    return df_listing


def create_review_table(df_reviews):
    df_review = df_reviews[['review_id', 'listing_id', 'date', 'reviewer_id']].drop_duplicates()
    return df_review

def save_to_csv(df, filename):
    df.to_csv(filename, index=False)

def main():
    listings_file = 'data/cleaned_Listings.csv'
    reviews_file = 'data/filtered_reviews.csv'
    
    df_listings, df_reviews = load_data(listings_file, reviews_file)
    
    df_host = create_host_table(df_listings)
    df_location = create_location_table(df_listings)
    df_property = create_property_table(df_listings)
    df_review_scores = create_review_scores_table(df_listings)
    df_listing = create_listing_table(df_listings, df_location, df_property)
    df_review = create_review_table(df_reviews)
    
    save_to_csv(df_host, 'data/split data/host.csv')
    save_to_csv(df_location, 'data/split data/location.csv')
    save_to_csv(df_property, 'data/split data/property.csv')
    save_to_csv(df_review_scores, 'data/split data/review_scores.csv')
    save_to_csv(df_listing, 'data/split data/listing.csv')
    save_to_csv(df_review, 'data/split data/review.csv')

if __name__ == "__main__":
    main()
