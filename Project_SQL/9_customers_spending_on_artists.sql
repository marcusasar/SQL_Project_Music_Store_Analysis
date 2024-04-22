/*
Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent
*/

WITH best_selling_artist AS (
	SELECT
		art.artist_id AS artist_id,
		art.name AS artist_name,
		SUM(inv.unit_price * inv.quantity) AS total_sales
	FROM invoice_line AS inv
	INNER JOIN track AS tk ON tk.track_id = inv.track_id
	INNER JOIN album AS ab ON ab.album_id = tk.album_id
	INNER JOIN artist AS art ON art.artist_id = ab.artist_id
	GROUP BY art.artist_id,artist_name
	ORDER BY total_sales DESC
	LIMIT 1
	
)
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	bsa.artist_name,
	SUM(inv.unit_price * inv.quantity) AS total_sales
FROM customer AS c
INNER JOIN invoice AS i ON c.customer_id = i.customer_id
INNER JOIN invoice_line inv ON inv.invoice_id = i.invoice_id
INNER JOIN track AS tk ON tk.track_id = inv.track_id
INNER JOIN album AS ab ON ab.album_id = tk.album_id
INNER JOIN best_selling_artist AS bsa ON bsa.artist_id = ab.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, bsa.artist_name
ORDER BY total_sales DESC
LIMIT 1;