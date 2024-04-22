/*
Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.
*/

SELECT
	ar.artist_id,
	ar.name,
	COUNT(tk.track_id) AS cnt
FROM artist ar
INNER JOIN album ab
ON ar.artist_id = ab.artist_id
INNER JOIN track tk
ON ab.album_id = tk.album_id
INNER JOIN genre gen
ON tk.genre_id = gen.genre_id
WHERE gen.name LIKE 'Rock'
GROUP BY ar.artist_id, ar.name
ORDER BY cnt DESC
LIMIT 10;
