USE platziblog;

SELECT estatus, COUNT(*) post_quantity
FROM posts
GROUP BY estatus;

SELECT idUsers, nickname, COUNT(*) writing_posts
FROM posts
RIGHT JOIN users
ON posts.idUsers = users.id_users
WHERE posts.idUsers IS NOT NULL
GROUP BY idUsers;

SELECT nickname, COUNT(*) writing_posts
FROM posts
INNER JOIN users
ON posts.idUsers = users.id_users
GROUP BY idUsers; 

SELECT YEAR(publication_date) AS post_year, COUNT(*) post_quatity
FROM posts
GROUP BY post_year;

SELECT estatus, MONTHNAME(publication_date) AS post_month, COUNT(*) post_quatity
FROM posts
GROUP BY post_month, estatus;

SELECT nickname, MONTHNAME(publication_date) AS post_month, COUNT(*) post_quatity
FROM posts
INNER JOIN users
ON posts.idUsers = id_users
GROUP BY post_month, nickname;