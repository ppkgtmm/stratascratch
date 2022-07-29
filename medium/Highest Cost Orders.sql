SELECT c.first_name, SUM(o.total_order_cost), o.order_date
FROM customers c LEFT JOIN orders o ON c.id = o.cust_id
WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY 1, 3
ORDER BY 2 DESC
LIMIT 1