SELECT business_name,
CASE
    WHEN LOWER(business_name) LIKE '%restaurant%' THEN 'restaurant'
    WHEN LOWER(business_name) ~ 'cafe|café|coffee' THEN 'cafe'
    WHEN LOWER(business_name) LIKE '%school%' THEN 'school'
    ELSE 'other'
END business_type
FROM sf_restaurant_health_violations
GROUP BY 1, 2