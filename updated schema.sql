-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE `Host` (
    `host_id` INT NOT NULL,
    `host_since` DATE NULL,
    `host_location` VARCHAR(255) NULL,
    `host_is_superhost` BOOLEAN NULL,
    `host_total_listings_count` INT NULL,
    `host_has_profile_pic` BOOLEAN NULL,
    `host_identity_verified` BOOLEAN NULL,
    PRIMARY KEY (`host_id`)
);

CREATE TABLE `Location` (
    `location_id` INT NOT NULL,
    `neighbourhood` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `latitude` DECIMAL(10, 8) NULL,
    `longitude` DECIMAL(11, 8) NULL,
    PRIMARY KEY (`location_id`)
);

CREATE TABLE `Property` (
    `property_id` INT NOT NULL,
    `listing_id` INT NOT NULL,
    `property_type` VARCHAR(255) NULL,
    `room_type` VARCHAR(255) NULL,
    `accommodates` INT NULL,
    `bedrooms` INT NULL,
    `amenities` TEXT NULL,
    `price` DECIMAL(10, 2) NULL,
    `minimum_nights` INT NULL,
    `maximum_nights` INT NULL,
    `instant_bookable` BOOLEAN NULL,
    PRIMARY KEY (`property_id`)
);

CREATE TABLE `ReviewScores` (
    `listing_id` INT NOT NULL,
    `review_scores_rating` INT NULL,
    `review_scores_accuracy` INT NULL,
    `review_scores_cleanliness` INT NULL,
    `review_scores_checkin` INT NULL,
    `review_scores_communication` INT NULL,
    `review_scores_location` INT NULL,
    `review_scores_value` INT NULL,
    PRIMARY KEY (`listing_id`)
);

CREATE TABLE `Listing` (
    `listing_id` INT NOT NULL,
    `host_id` INT NULL,
    `location_id` INT NULL,
    `property_id` INT NULL,
    PRIMARY KEY (`listing_id`)
);

CREATE TABLE `Review` (
    `review_id` INT NOT NULL,
    `listing_id` INT NOT NULL,
    `date` DATE NULL,
    `reviewer_id` INT NULL,
    PRIMARY KEY (`review_id`)
);

ALTER TABLE `Property`
    ADD CONSTRAINT `fk_Property_listing_id`
    FOREIGN KEY(`listing_id`) REFERENCES `Listing` (`listing_id`);

ALTER TABLE `ReviewScores`
    ADD CONSTRAINT `fk_ReviewScores_listing_id`
    FOREIGN KEY(`listing_id`) REFERENCES `Listing` (`listing_id`);

ALTER TABLE `Listing`
    ADD CONSTRAINT `fk_Listing_host_id`
    FOREIGN KEY(`host_id`) REFERENCES `Host` (`host_id`);

ALTER TABLE `Listing`
    ADD CONSTRAINT `fk_Listing_location_id`
    FOREIGN KEY(`location_id`) REFERENCES `Location` (`location_id`);

ALTER TABLE `Review`
    ADD CONSTRAINT `fk_Review_listing_id`
    FOREIGN KEY(`listing_id`) REFERENCES `Listing` (`listing_id`);
