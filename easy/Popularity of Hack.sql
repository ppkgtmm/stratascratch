SELECT e.location, AVG(h.popularity)
FROM facebook_hack_survey h INNER JOIN facebook_employees e
ON h.employee_id = e.id
GROUP BY 1