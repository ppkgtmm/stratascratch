SELECT id, first_name, last_name, department_id, MAX(salary) "max"
FROM ms_employee_salary
GROUP BY 1, 2, 3, 4
ORDER BY 1