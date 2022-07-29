WITH ulater AS (
    SELECT user_id, MIN(created_at) AS first_date
    FROM marketing_campaign
    GROUP BY 1
    HAVING MIN(created_at) <  MAX(created_at)
), ufpro AS (
    SELECT m.user_id, m.product_id, u.first_date
    FROM marketing_campaign m INNER JOIN ulater u 
    ON m.user_id = u.user_id AND m.created_at = u.first_date
    GROUP BY 1, 2, 3
)
SELECT COUNT(DISTINCT m.user_id)
FROM marketing_campaign m INNER JOIN ulater ul ON m.user_id = ul.user_id
LEFT JOIN ufpro u ON m.user_id = u.user_id AND m.product_id = u.product_id 
WHERE u.product_id IS NULL