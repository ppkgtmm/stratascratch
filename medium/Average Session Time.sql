WITH page_load AS (
  SELECT user_id, DATE_TRUNC('day', timestamp) "day", MAX(timestamp) ts
  FROM facebook_web_log
  WHERE action = 'page_load'
  GROUP BY 1, 2
), page_exit AS (
  SELECT user_id, DATE_TRUNC('day', timestamp) "day" , MIN(timestamp) ts
  FROM facebook_web_log
  WHERE action = 'page_exit'
  GROUP BY 1, 2
)
SELECT pe.user_id, AVG(EXTRACT(epoch FROM pe.ts - pl.ts))
FROM page_exit pe INNER JOIN page_load pl
ON pe.user_id = pl.user_id AND pe.day = pl.day
GROUP BY 1