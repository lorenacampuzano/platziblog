SELECT title, name_category, estatus
FROM posts
	LEFT JOIN categories ON posts.idCategories = categories.id_categories
    WHERE name_category = 'Deportes';
    
SELECT nickname, title
FROM users
	INNER JOIN posts ON users.id_users = posts.idUsers
    WHERE nickname = 'Ed';

