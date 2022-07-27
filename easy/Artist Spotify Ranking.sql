SELECT artist, COUNT(*) n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY 1
ORDER BY 2 DESC