SELECT cust_id, SUM(total_order_cost) revenue
FROM orders
WHERE date_trunc('month', order_date) = '2019-03-01'
GROUP BY 1
ORDER BY 2 DESC