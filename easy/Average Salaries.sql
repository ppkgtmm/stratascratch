SELECT department, first_name, salary, AVG(salary) OVER(PARTITION BY department) "avg"
FROM employee