-- What are the top 3 total invoices?

SELECT
   total
FROM invoice
ORDER BY total DESC
LIMIT 3;