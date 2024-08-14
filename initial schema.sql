-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE `Listing` (
    `listing_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `host_id` INT NOT NULL,
    `host_since` DATE NOT NULL,
    `host_location` VARCHAR(255) NOT NULL,
    `host_is_superhost` BOOLEAN NOT NULL,
    `host_total_listings_count` INT NOT NULL,
    `host_has_profile_pic` BOOLEAN NOT NULL,
    `host_identity_verified` BOOLEAN NOT NULL,
    `neighbourhood` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `latitude` DECIMAL(10, 8) NOT NULL,
    `longitude` DECIMAL(11, 8) NOT NULL,
    `property_type` VARCHAR(255) NOT NULL,
    `room_type` VARCHAR(255) NOT NULL,
    `accommodates` INT NOT NULL,
    `bedrooms` INT NOT NULL,
    `amenities` TEXT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `minimum_nights` INT NOT NULL,
    `maximum_nights` INT NOT NULL,
    `review_scores_rating` INT NOT NULL,
    `review_scores_accuracy` INT NOT NULL,
    `review_scores_cleanliness` INT NOT NULL,
    `review_scores_checkin` INT NOT NULL,
    `review_scores_communication` INT NOT NULL,
    `review_scores_location` INT NOT NULL,
    `review_scores_value` INT NOT NULL,
    `instant_bookable` BOOLEAN NOT NULL,
    PRIMARY KEY (`listing_id`)
);

CREATE TABLE `Review` (
    `review_id` INT NOT NULL,
    `listing_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `reviewer_id` INT NOT NULL,
    PRIMARY KEY (`review_id`)
);
