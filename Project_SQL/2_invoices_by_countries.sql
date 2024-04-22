-- 	Which countries have the most invoices?

SELECT
	billing_country,
	COUNT(*) AS cnt_invoices
FROM invoice
GROUP BY billing_country
ORDER BY cnt_invoices DESC;
