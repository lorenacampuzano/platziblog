-- ¿Cuántas etiquetas tiene cada uno de los posts?
SELECT posts.title AS post_name, COUNT(*) AS num_labels
FROM posts
	INNER JOIN posts_labels ON posts.id_posts = posts_labels.idPosts
    INNER JOIN labels ON posts_labels.idLabels = labels.id_labels
GROUP BY id_posts;

-- ¿Cuáles son los 5 posts con más etiquetas?
SELECT posts.title AS post_name, COUNT(*) AS num_labels
FROM posts
	INNER JOIN posts_labels ON posts.id_posts = posts_labels.idPosts
    INNER JOIN labels ON posts_labels.idLabels = labels.id_labels
GROUP BY id_posts
ORDER BY num_labels DESC
LIMIT 5;

-- ¿Cuáles son las etiquetas que tiene cada post?
SELECT posts.title AS post_name, GROUP_CONCAT(labels.name_label) AS post_labels
FROM posts
	INNER JOIN posts_labels ON posts.id_posts = posts_labels.idPosts
    INNER JOIN labels ON posts_labels.idLabels = labels.id_labels
GROUP BY id_posts;

-- ¿Cuáles son las etiquetas que no tiene ningún post asociado?
SELECT * 
FROM posts_labels
	RIGHT JOIN labels ON posts_labels.idLabels = labels.id_labels
WHERE posts_labels.idLabels IS NULL;

-- Categorías ordenadas por los números de posts
SELECT c.name_category, COUNT(*) AS num_posts
categoriesFROM posts
	INNER JOIN categories AS c ON posts.idCategories = c.id_categories
GROUP BY c.id_categories
ORDER BY num_posts DESC;

-- ¿Cuántos post escribio cada usuario?
SELECT u.nickname, COUNT(*) AS cant_posts
FROM users AS u
	INNER JOIN posts ON u.id_users = posts.idUsers
GROUP BY u.id_users
ORDER BY cant_posts DESC;

-- ¿Cuáles son las ctegorías en las que escribe cada usuario?
SELECT u.nickname, COUNT(*) AS cant_posts, GROUP_CONCAT(DISTINCT(c.name_category)) AS categories_names
FROM users AS u
	INNER JOIN posts AS p ON u.id_users = p.idUsers
    INNER JOIN categories AS c ON p.idCategories = c.id_categories
GROUP BY u.id_users;

-- ¿Qué usuarios no han escrito ningún post?
SELECT *
FROM users AS u
	LEFT JOIN posts AS p ON u.id_users = p.idUsers
WHERE p.idUsers IS NULL;