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

SELECT label.name_label AS post_label, COUNT(*) label_quantity
FROM(
	SELECT idPosts, idLabels, name_label
    FROM posts_labels
    INNER JOIN labels
    ON posts_labels.idLabels = labels.id_labels
) AS label
GROUP BY label.name_label
ORDER BY label_quantity DESC;

SELECT title AS post_title, label.name_label AS post_label
FROM(
	SELECT idPosts, idLabels, name_label
    FROM posts_labels
    INNER JOIN labels
    ON posts_labels.idLabels = labels.id_labels
) AS label
INNER JOIN posts
ON label.idPosts = posts.id_posts
GROUP BY post_label;

