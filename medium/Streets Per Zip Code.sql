WITH cte AS (
    SELECT business_postal_code, (
        SELECT LOWER(x)
        FROM unnest(string_to_array(business_address, ' ')) as x
        where not x ~ '^[0-9]+$'
        LIMIT 1
    ) st
    FROM sf_restaurant_health_violations
    WHERE business_postal_code IS NOT NULL
    GROUP BY 1, 2
)
SELECT business_postal_code, COUNT(*)  n_streets
FROM cte
GROUP BY 1
ORDER BY 2 DESC, 1