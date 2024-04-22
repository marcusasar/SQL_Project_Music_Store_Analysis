-- 	Who is the best customer?

SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	SUM(total) AS total_invoices
FROM customer c
INNER JOIN invoice i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_invoices DESC
LIMIT 1;