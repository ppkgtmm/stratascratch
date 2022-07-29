SELECT DENSE_RANK() OVER(ORDER BY total_messages DESC) rank, sub.*
FROM (
    SELECT id_guest, SUM(n_messages) total_messages
    FROM airbnb_contacts
    GROUP BY 1
) sub