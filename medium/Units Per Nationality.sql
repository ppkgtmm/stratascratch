SELECT h.nationality, COUNT(*)
FROM ( 
    SELECT DISTINCT *
    FROM airbnb_hosts
) h LEFT JOIN (
    SELECT DISTINCT * 
    FROM airbnb_units
) u ON h.host_id = u.host_id
WHERE u.unit_type = 'Apartment' AND h.age < 30
GROUP BY 1
ORDER BY 2 DESC