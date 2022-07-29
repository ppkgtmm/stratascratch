SELECT
CASE
WHEN reviews = 0 THEN 'New'
WHEN reviews BETWEEN 1 AND 5 THEN 'Rising'
WHEN reviews BETWEEN 6 AND 15 THEN 'Trending Up'
WHEN reviews BETWEEN 16 AND 40 THEN 'Popular'
ELSE 'Hot' 
END pop_rating, MIN(price), AVG(price), MAX(price)
FROM (
    SELECT price, room_type, host_since, zipcode, number_of_reviews, SUM(number_of_reviews) reviews
    FROM airbnb_host_searches
    GROUP BY 1,2,3,4,5
) sub
GROUP BY 1