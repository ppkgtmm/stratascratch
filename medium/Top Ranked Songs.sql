WITH cte AS (
    SELECT trackname
    FROM spotify_worldwide_daily_song_ranking
    WHERE position = 1
)
SELECT *, COUNT(*) times_top1
FROM cte
GROUP BY 1
ORDER BY 2 DESC