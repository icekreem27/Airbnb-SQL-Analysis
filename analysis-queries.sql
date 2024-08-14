-- Airbnb Data Analysis Queries

-- 1. Most Active Hosts
SELECT h.host_id, COUNT(l.listing_id) AS total_listings
FROM Host h
JOIN Listing l ON h.host_id = l.host_id
GROUP BY h.host_id
ORDER BY total_listings DESC;


-- 2. Superhost Percentage
SELECT 
    SUM(CASE WHEN h.host_is_superhost = TRUE THEN 1 ELSE 0 END) / COUNT(*) * 100 AS superhost_percentage
FROM Host h;


-- 3. Popular Neighborhoods (top 5)
SELECT loc.neighbourhood, COUNT(l.listing_id) AS total_listings
FROM Location loc
JOIN Listing l ON loc.location_id = l.location_id
GROUP BY loc.neighbourhood
ORDER BY total_listings DESC
LIMIT 5;


-- 4. Average Price by Neighborhood
-- LEFT JOIN was needed to handle missing data
SELECT loc.neighbourhood, AVG(p.price) AS avg_price
FROM Location loc
LEFT JOIN Listing l ON loc.location_id = l.location_id
LEFT JOIN Property p ON l.property_id = p.property_id
GROUP BY loc.neighbourhood
ORDER BY avg_price DESC
LIMIT 5;


-- 5. Room Type Distribution
SELECT p.room_type, COUNT(*) AS count
FROM Property p
GROUP BY p.room_type;


-- 6. Price by Property Type
SELECT p.property_type, AVG(p.price) AS avg_price
FROM Property p
GROUP BY p.property_type
ORDER BY avg_price DESC;


-- 7. Average Review Scores (cleanliness, communication, value).
SELECT 
    AVG(rs.review_scores_cleanliness) AS avg_cleanliness,
    AVG(rs.review_scores_communication) AS avg_communication,
    AVG(rs.review_scores_value) AS avg_value
FROM ReviewScores rs;


-- 8. Top-Rated Listings
SELECT l.listing_id, rs.review_scores_rating
FROM ReviewScores rs
JOIN Listing l ON rs.listing_id = l.listing_id
ORDER BY rs.review_scores_rating DESC
LIMIT 10;


-- 9. Seasonal Price Variation
SELECT 
    EXTRACT(MONTH FROM r.date) AS month, 
    AVG(p.price) AS avg_price
FROM Review r
JOIN Listing l ON r.listing_id = l.listing_id
JOIN Property p ON l.property_id = p.property_id
GROUP BY EXTRACT(MONTH FROM r.date)
ORDER BY month;

-- 10. Review Activity Over Time
SELECT 
    EXTRACT(YEAR FROM r.date) AS year, 
    COUNT(*) AS total_reviews
FROM Review r
GROUP BY EXTRACT(YEAR FROM r.date)
ORDER BY year;


-- End
