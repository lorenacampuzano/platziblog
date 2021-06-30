USE platziblog;

SELECT *
FROM posts
ORDER BY publication_date DESC;

SELECT publication_date, nickname, title, content
FROM posts
INNER JOIN users
ON posts.idUsers = users.id_users
ORDER BY idUsers ASC;

SELECT *
FROM posts
ORDER BY publication_date ASC
LIMIT 5;

SELECT MONTHNAME(publication_date) AS post_month, estatus, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month
HAVING post_quantity > 1
ORDER BY post_month, estatus;