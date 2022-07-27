SELECT event_name, COUNT(*) event_count
FROM playbook_events
WHERE event_type = 'engagement' AND device = 'macbook pro'
GROUP BY 1
ORDER BY 2 DESC