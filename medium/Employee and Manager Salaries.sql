SELECT e.first_name, e.salary
FROM employee e INNER JOIN employee m 
ON e.manager_id = m.id
WHERE e.salary > m.salary