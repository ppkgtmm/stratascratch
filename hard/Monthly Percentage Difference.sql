SELECT ym, ROUND((rev - LAG(rev, 1) OVER(ORDER BY ym)) * 100 / LAG(rev, 1) OVER(ORDER BY ym), 2)
FROM (
    SELECT to_char(created_at, 'YYYY-MM') ym, SUM(value) rev
    FROM sf_transactions
    GROUP BY 1
) sub