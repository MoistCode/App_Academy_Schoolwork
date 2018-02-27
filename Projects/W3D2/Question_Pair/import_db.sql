CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  title VARCHAR(100) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Timmy', 'Turner'),
  ('Lirik', 'Kun'),
  ('Tommy', 'Pham'),
  ('Gayle', 'Laakmann'),
  ('Starbucks', 'Coffee'),
  ('La', 'Croix'),
  ('Gamma', 'Helm'),
  ('Moist', 'Code'),
  ('Johnson', 'Vlissides'),
  ('Donald', 'Knuth');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Lost Cow', 'How do I end up losing my cow on a Wednesday?', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') )
  ('Starbucks', 'When should I drink starbucks?', (SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code') )
  ('Moist Toilet Seat', 'Why am I so bad at aiming?', (SELECT id FROM users WHERE fname = 'Timmy' AND lname = 'Turner') )
  ('Awesomeness', 'Why am I so awesome?', (SELECT id FROM users WHERE fname = 'Gamma' AND lname = 'Helm') )
  ('Sequal', 'Why do people call it sequal instead of just the noise SQL?', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') )
  ('Concrete Mathematics', 'Why did I choose to co-write this book?', (SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Knuth') )
  ('', '', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') )
  ('', '', (SELECT id FROM users WHERE fname = 'Timmy' AND lname = 'Turner') )
  ('', '', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') )
  ('', '', (SELECT id FROM users WHERE fname = 'La' AND lname = 'Croix') )





INSERT INTO

VALUES

INSERT INTO

VALUES

INSERT INTO

VALUES

INSERT INTO

VALUES
