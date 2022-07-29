SELECT games, COUNT(DISTINCT name) athletes_count
FROM olympics_athletes_events
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1