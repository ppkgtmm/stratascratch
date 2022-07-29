WITH cte AS (
    SELECT state, COUNT(*) n_businesses, RANK() OVER(ORDER BY COUNT(*) DESC) "rank"
    FROM yelp_business
    WHERE stars = 5
    GROUP BY 1
)
SELECT state, n_businesses
FROM cte
WHERE rank <= 5
ORDER BY 2 DESC, 1