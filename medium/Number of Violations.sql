SELECT date_part('year', inspection_date), COUNT(violation_id)
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY 1
ORDER BY 1