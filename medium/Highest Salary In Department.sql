WITH cte AS (
    SELECT department, MAX(salary) max_salary
    FROM employee
    GROUP BY 1
)

SELECT e.department, e.first_name employee_name, e.salary
FROM employee e INNER JOIN cte c 
ON e.salary = c.max_salary AND e.department = c.department