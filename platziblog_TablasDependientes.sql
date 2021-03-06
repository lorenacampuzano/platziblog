USE platziblog;

CREATE TABLE posts(
id_posts INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idUsers INT NOT NULL,
idCategories INT NOT NULL,
title VARCHAR(130) NOT NULL,
publication_date TIMESTAMP,
content TEXT NOT NULL,
estatus CHAR(8) DEFAULT 'activo',
FOREIGN KEY (idUsers) REFERENCES users(id_users) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (idCategories) REFERENCES categories(id_categories)
);

CREATE TABLE comments(
id_comments INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
comments TEXT NOT NULL,
idUsers INT NOT NULL,
idPosts INT NOT NULL,
FOREIGN KEY (idUsers) REFERENCES users(id_users) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (idPosts) REFERENCES posts(id_posts) ON UPDATE CASCADE ON DELETE CASCADE
);

