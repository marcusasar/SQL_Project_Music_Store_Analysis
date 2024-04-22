/*
Query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A
*/

SELECT
	DISTINCT
	c.first_name,
	c.last_name,
	c.email
FROM customer c
INNER JOIN invoice i
ON c.customer_id = i.customer_id
INNER JOIN invoice_line invl
ON i.invoice_id = invl.invoice_id
WHERE track_id IN(
	SELECT track_id
	FROM track tk
	INNER JOIN genre gen
	ON tk.genre_id = gen.genre_id
	WHERE gen.name LIKE 'Rock'
)
ORDER BY c.email ASC;