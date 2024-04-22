/*
Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount
*/

WITH customer_with_country AS (
	SELECT
		c.customer_id,
		c.first_name,
		c.last_name,
		i.billing_country AS country,
		SUM(total) AS total_spending,
		ROW_NUMBER() OVER(PARTITION BY i.billing_country ORDER BY SUM(total) DESC) AS row_num
	FROM customer AS c
	INNER JOIN invoice AS i
	ON c.customer_id = i.customer_id
	GROUP BY c.customer_id, c.first_name, c.last_name,i.billing_country
	ORDER BY country ASC, total_spending DESC
)
SELECT *
FROM customer_with_country
WHERE row_num <= 1;