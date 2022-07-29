SELECT type, SUM(processed::INTEGER)::FLOAT / COUNT(*) processed_rate
FROM facebook_complaints
GROUP BY 1