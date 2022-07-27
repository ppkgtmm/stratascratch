WITH max_mar AS (
    SELECT MAX(salary)
    FROM db_employee
    WHERE department_id = (
    SELECT id FROM db_dept WHERE department = 'marketing' LIMIT 1
    )
), max_eng AS (
    SELECT MAX(salary)
    FROM db_employee
    WHERE department_id = (
    SELECT id FROM db_dept WHERE department = 'engineering' LIMIT 1
    )
)

SELECT ABS(
    (SELECT * FROM max_mar) - (SELECT * FROM max_eng)
) salary_difference