WITH cte AS (
  SELECT first_name, target, RANK() OVER(ORDER BY target DESC) "rank"
  FROM salesforce_employees
  WHERE manager_id = 13
)

SELECT first_name, target
FROM cte
WHERE rank = 1