SELECT b.bike_number, (
    SELECT MAX(end_time)
    FROM dc_bikeshare_q1_2012
    WHERE bike_number = b.bike_number
) last_used
FROM dc_bikeshare_q1_2012 b
GROUP BY 1, 2
ORDER BY 2 DESC