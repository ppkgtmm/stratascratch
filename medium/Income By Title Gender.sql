WITH cte AS (
    SELECT worker_ref_id, SUM(bonus) total_bonus
    FROM sf_bonus
    GROUP BY 1
)

SELECT e.employee_title, e.sex,
AVG(e.salary + c.total_bonus) avg_compensation
FROM cte c INNER JOIN sf_employee e ON c.worker_ref_id = e.id
GROUP BY 1, 2