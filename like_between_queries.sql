USE platziblog;

SELECT *
FROM posts
WHERE id_posts < 50;

SELECT *
FROM posts
WHERE estatus = 'inactivo';

SELECT *
FROM posts
WHERE title LIKE '%_sc_ndalo%';

SELECT id_posts, title
FROM posts
WHERE publication_date > '2025-01-01';

SELECT idUsers, title
FROM posts
WHERE publication_date BETWEEN '2023' and '2025-12-31';

SELECT title, estatus
FROM posts
WHERE YEAR(publication_date) BETWEEN '	2023' AND '2024';

SELECT *
FROM posts
WHERE MONTH(publication_date) = '04';

SELECT title
FROM posts
WHERE idCategories IS NULL;

SELECT title
FROM posts
WHERE idUsers IS NOT NULL
	AND estatus = 'activo'
    AND id_posts < 50
    AND idCategories = 2;

SELECT *
FROM users
WHERE id_users IN (1,3,5);