-- 	Which city has the best customers? 

SELECT
	billing_city,
	SUM(total) AS total_invoices
FROM invoice
GROUP BY billing_city
ORDER BY total_invoices DESC
LIMIT 1;