WITH cte AS (
    SELECT unnest(string_to_array(contents, ' ')) word
    FROM google_file_store
)
SELECT word, COUNT(*) nentry
FROM cte
WHERE word IN ('bull', 'bear')
GROUP BY 1
ORDER BY 2 DESC