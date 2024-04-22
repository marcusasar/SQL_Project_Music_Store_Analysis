/*
We want to find out the most popular music Genre for each country. We determine the
most popular genre as the genre with the highest amount of purchases. Write a query
that returns each country along with the top Genre. For countries where the maximum
number of purchases is shared return all Genres
*/

WITH popular_music_genre AS (
	SELECT 
		c.country AS country,
		gen.genre_id AS genre_id,
		gen.name AS genre,
		COUNT(inv.quantity) AS purchases,
		ROW_NUMBER() OVER(PARTITION BY c.country ORDER BY COUNT(inv.quantity) DESC) AS row_num
 	FROM customer AS c
	INNER JOIN invoice  AS i ON c.customer_id = i.customer_id
	INNER JOIN invoice_line AS inv ON inv.invoice_id = i.invoice_id
	INNER JOIN track AS tk ON tk.track_id = inv.track_id
	INNER JOIN genre AS gen ON gen.genre_id = tk.genre_id
	GROUP BY country, genre, gen.genre_id
	ORDER BY country ASC, purchases DESC

)
SELECT *
FROM popular_music_genre
WHERE row_num <= 1;
