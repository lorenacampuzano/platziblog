SELECT title, name_category, estatus
FROM posts
	LEFT JOIN categories ON posts.idCategories = categories.id_categories
WHERE name_category = 'Deportes';
    
SELECT nickname, title
FROM users
	INNER JOIN posts ON users.id_users = posts.idUsers
WHERE nickname = 'Ed';
    
SELECT *
FROM users
	LEFT JOIN posts ON posts.idUsers = users.id_users
WHERE posts.idUsers IS NULL;

SELECT *
FROM users
	RIGHT JOIN posts ON users.id_users = posts.idUsers;

SELECT	*
FROM	usuarios 
	JOIN posts on usuarios.id = posts.usuario_id;


-- OUTER JOIN

SELECT	*
FROM users 
	LEFT JOIN posts ON users.id_users = posts.idUsers
UNION 
SELECT	*
FROM users 
	LEFT JOIN posts ON users.id_users = posts.idUsers;

SELECT	*
FROM users 
	LEFT JOIN posts ON users.id_users = posts.idUsers
WHERE posts.idUsers IS NULL
UNION 
SELECT	*
FROM users 
	LEFT JOIN posts ON users.id_users = posts.idUsers
WHERE posts.idUsers IS NULL;