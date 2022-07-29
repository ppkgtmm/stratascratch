SELECT user_id
FROM (
    SELECT user_id, created_at, 
    LAG(created_at, 1) OVER(PARTITION BY user_id ORDER BY created_at) lag_date
    FROM amazon_transactions
) sub
WHERE created_at - lag_date <= 7
GROUP BY user_id
HAVING COUNT(*) > 0