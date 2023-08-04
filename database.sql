-- Active: 1690999502566@@127.0.0.1@3306
CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  role TEXT NOT NULL,
  created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

CREATE TABLE posts (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  creator_id TEXT NOT NULL,
  content TEXT NOT NULL,
  likes INTEGER DEFAULT (0) NOT NULL,
  dislikes INTEGER DEFAULT (0) NOT NULL,
  comments INTEGER DEFAULT (0) NOT NULL,
  created_at TEXT DEFAULT (DATETIME()) NOT NULL,
  FOREIGN KEY(creator_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE comments (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  creator_comments_id TEXT NOT NULL, 
  post_id TEXT NOT NULL,
  content TEXT NOT NULL,
  likes INTEGER DEFAULT (0) NOT NULL,
  dislikes INTEGER DEFAULT (0) NOT NULL,
  created_at TEXT DEFAULT (DATETIME()) NOT NULL,
  FOREIGN KEY(creator_comments_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY(post_id) REFERENCES posts(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

SELECT FROM * users;
CREATE TABLE likes_dislikes (
  user_id TEXT NOT NULL,
  post_id TEXT NOT NULL,
  like INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE likes_dislikes_comments (
  user_id TEXT NOT NULL,
  comments_id TEXT NOT NULL,
  like INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (comments_id) REFERENCES comments (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO users (id, name, email, password, role)
VALUES
  -- tipo NORMAL e senha = labaluno123
	('user1', 'labaluno11', 'labaluno11@email.com', '$2a$12$4ZKiLial/D7laUPGZJnqq.RhyVSmWi9VDOTRNLjiMIqT2noEgPGqa', 'NORMAL'),
  -- tipo NORMAL e senha = labaluna321
	('user2', 'labaluna12', 'labaluna12@email.com', '$2a$12$RhcIbKek2korxvZdOVpDvuZhrTCkX00f2BdKp/F4j1Hab/56g6LSm', 'ADMIN');

INSERT INTO posts(id, creator_id, content)
VALUES
('post1', 'user1', 'qual framework vocês mais gostam?'),
('post2', 'user2', 'javascript x typescript');

INSERT INTO comments(id, creator_comments_id, post_id, content)
VALUES
('com1', 'user2', 'post1', 'React');

DROP TABLE posts;
DROP TABLE users;
DROP TABLE comments;
DROP TABLE likes_dislikes;
DROP TABLE likes_dislikes_comments;

