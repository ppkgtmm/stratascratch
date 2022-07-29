WITH cte AS (
    SELECT winery, (
        SELECT SUM(
            CASE
            WHEN LOWER(x) ~ '^(plum|cherry|rose|hazelnut)[^A-Za-z]*$' THEN 1
            WHEN LOWER(x) ~ '^(plum|cherry|rose|hazelnut)[^A-Za-z]+.*$' THEN 1
            WHEN LOWER(x) ~ '^.*[^A-Za-z]+(plum|cherry|rose|hazelnut)$' THEN 1
            ELSE 0
            END
        )
        FROM unnest(string_to_array(description, ' ')) x
    ) flag
    FROM winemag_p1
)

SELECT winery
FROM cte
WHERE flag > 0
GROUP BY 1
ORDER BY 1