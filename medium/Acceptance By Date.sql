WITH sent AS (
  SELECT * 
  FROM fb_friend_requests
  WHERE action = 'sent'
), cte AS (
  SELECT s.date, COUNT(fr.date) acc, COUNT(*) cnt
  FROM sent s LEFT JOIN fb_friend_requests fr
  ON fr.action = 'accepted' AND 
  s.user_id_sender = fr.user_id_sender AND
  s.user_id_receiver = fr.user_id_receiver
  GROUP BY 1
)

SELECT date, acc::float / cnt percentage_acceptance
FROM cte
ORDER BY 1