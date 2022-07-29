WITH cte AS (
    SELECT business_name, review_text, 
    RANK() OVER(ORDER BY cool DESC) "rank"
    FROM yelp_reviews
)
SELECT business_name, review_text
FROM cte
WHERE rank = 1