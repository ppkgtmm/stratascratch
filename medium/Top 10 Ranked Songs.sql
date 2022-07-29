SELECT year_rank, group_name, song_name
FROM billboard_top_100_year_end
WHERE YEAR = 2010 AND year_rank BETWEEN 1 AND 10
GROUP BY 1, 2, 3
ORDER BY 1