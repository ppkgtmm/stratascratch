WITH cte AS (
    SELECT worker_title, RANK() OVER(ORDER BY salary DESC) "rank"
    FROM worker w INNER JOIN title t ON w.worker_id = t.worker_ref_id
)
SELECT worker_title
FROM cte
WHERE rank = 1
ORDER BY 1