-- 	Who is the senior most employee based on job title?

SELECT
	employee_id,
	first_name,
	last_name,
	title,
    levels
FROM employee
ORDER BY levels DESC
LIMIT 1;