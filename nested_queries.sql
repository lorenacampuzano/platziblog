USE platziblog;

SELECT new_table_projection.date, COUNT(*) AS posts_counts
FROM(
	SELECT DATE(MIN(publication_date)) AS date, YEAR(publication_date) AS post_year
    FROM posts
    GROUP BY post_year
) AS new_table_projection
GROUP BY new_table_projection.date
ORDER BY new_table_projection.date;

SELECT *
FROM posts
WHERE publication_date = (
	SELECT MAX(publication_date)
    FROM posts
);
