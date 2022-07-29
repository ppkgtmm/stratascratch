WITH cte AS (
    SELECT d.date,
    SUM(CASE WHEN paying_customer = 'no' THEN downloads END) non_paying,
    SUM(CASE WHEN paying_customer = 'yes' THEN downloads END) paying
    FROM ms_download_facts d
    INNER JOIN ms_user_dimension u ON d.user_id = u.user_id
    INNER JOIN ms_acc_dimension a ON a.acc_id = u.acc_id
    GROUP BY 1
    ORDER BY 1
)
SELECT * 
FROM cte
WHERE non_paying > paying