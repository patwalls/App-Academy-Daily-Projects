-- USERS
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  f_name VARCHAR(255) NOT NULL,
  l_name VARCHAR(255) NOT NULL
);

INSERT INTO
  users(f_name, l_name)
VALUES
  ('John','Doe'),
  ('Jane', 'Doe'),
  ('Adam', 'Smith'),
  ('Sarah', 'Smith'),
  ('George', 'Costanza'),
  ('Jerry', 'Seinfeld'),
  ('Cosmo', 'Kramer');



-- QUESTIONS
DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  id INTEGER PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL
);

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('title', 'body', 1),
  ('title2', 'body2', 2),
  ('title3', 'body3', 2);



-- QUESTION-FOLLOWS
DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
  id  INTEGER PRIMARY KEY NOT NULL,
  question_id INTEGER NOT NULL,
  follower_id INTEGER NOT NULL
);

INSERT INTO
  question_follows(question_id, follower_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (1, 3),
  (3, 5),
  (3, 6);


-- REPLIES
DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id  INTEGER PRIMARY KEY NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL
);

INSERT INTO
  replies(question_id, parent_id, user_id, body)
VALUES
  (2, null, 2, 'this is a body'),
  (2, 1, 1, 'this a reply to body');

--QUESTION LIKES
DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL
);

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1, 2),
  (3, 2),
  (5, 2),
  (6, 1),
  (4, 1),
  (2, 1),
  (4, 3),
  (2, 3),
  (7, 2);
