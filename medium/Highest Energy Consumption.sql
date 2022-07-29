WITH cte AS (
    SELECT t.date, SUM(t.consumption) AS total_energy, RANK() OVER (
        ORDER BY SUM(t.consumption) DESC
    ) AS "rank"
    FROM (
        SELECT * FROM fb_eu_energy
        UNION
        SELECT * FROM fb_asia_energy
        UNION
        SELECT * FROM fb_na_energy
    ) t
    GROUP BY t.date
)

SELECT date, total_energy FROM cte WHERE rank = 1