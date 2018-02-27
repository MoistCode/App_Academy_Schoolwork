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
  ('Lost Cow', 'How do I end up losing my cow on a Wednesday?', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') ),
  ('Starbucks', 'When should I drink starbucks?', (SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code') ),
  ('Moist Toilet Seat', 'Why am I so bad at aiming?', (SELECT id FROM users WHERE fname = 'Timmy' AND lname = 'Turner') ),
  ('Awesomeness', 'Why am I so awesome?', (SELECT id FROM users WHERE fname = 'Gamma' AND lname = 'Helm') ),
  ('Sequal', 'Why do people call it sequal instead of just the noise SQL?', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') ),
  ('Concrete Mathematics', 'Why did I choose to co-write this book?', (SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Knuth') ),
  ('Emojis', 'Will the future see our emojis as an advanced language?', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') ),
  ('Vegan', 'How can I become a vegan when I love meat so much?', (SELECT id FROM users WHERE fname = 'Timmy' AND lname = 'Turner') ),
  ('Clean Code', 'How can I write clean code when I''m so dirty?', (SELECT id FROM users WHERE fname = 'Gayle' AND lname = 'Laakmann') ),
  ('Tide Pods', 'Why is the upcoming generation swallowing tide pods?', (SELECT id FROM users WHERE fname = 'La' AND lname = 'Croix') );

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Lost Cow'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code')),
  ((SELECT id FROM questions WHERE title = 'Lost Cow'), SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Knuth')),
  ((SELECT id FROM questions WHERE title = 'Tide Pods'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code')),
  ((SELECT id FROM questions WHERE title = 'Tide Pods'), SELECT id FROM users WHERE fname = 'La' AND lname = 'Croix')),
  ((SELECT id FROM questions WHERE title = 'Concrete Mathematics'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code')),
  ((SELECT id FROM questions WHERE title = 'Awesomeness'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code')),
  ((SELECT id FROM questions WHERE title = 'Concrete Mathematics'), SELECT id FROM users WHERE fname = 'Timmy' AND lname = 'Turner')),
  ((SELECT id FROM questions WHERE title = 'Sequal'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code')),
  ((SELECT id FROM questions WHERE title = 'Moist Toilet Seat'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code')),
  ((SELECT id FROM questions WHERE title = 'Moist Toilet Seat'), SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Knuth')),
  ((SELECT id FROM questions WHERE title = 'Starbucks'), SELECT id FROM users WHERE fname = 'Moist' AND lname = 'Code'));

INSERT INTO
  replies (body, user_id, question_id)
VALUES
  ('I''m a firm believer in moist and warm seats. Keep doing what you''re doing', SELECT id FROM users WHERE fname = 'Moist' && lname = 'Code', SELECT id FROM questions WHERE title = 'Moist Toilet Seat'),
  ('This is digusting, stop doing what you''re doing', SELECT id FROM users WHERE fname = 'Timmy' && lname = 'Turner', SELECT id FROM questions WHERE title = 'Moist Toilet Seat'),
  ('Please get toilet trained again.', SELECT id FROM users WHERE fname = 'Gayle' && lname = 'Laakmann', SELECT id FROM questions WHERE title = 'Moist Toilet Seat'),
  ('Just boast about how vegan you are.', SELECT id FROM users WHERE fname = 'Moist' && lname = 'Code', SELECT id FROM questions WHERE title = 'Vegan'),
  ('This is how humanity will end.', SELECT id FROM users WHERE fname = 'Donald' && lname = 'Knuth', SELECT id FROM questions WHERE title = 'Tide Pods'),
  ('The better question is when can I not.', SELECT id FROM users WHERE fname = 'Donald' && lname = 'Knuth', SELECT id FROM questions WHERE title = 'Starbucks'),
  ('Our emojis are comparable to drawings on the wall in primitive times. The future will see this as communication.', SELECT id FROM users WHERE fname = 'Donald' && lname = 'Knuth', SELECT id FROM questions WHERE title = 'Emojis'),
  ('I wrote this because I''m awesome. Please...someone reply to my question.', SELECT id FROM users WHERE fname = 'Donald' && lname = 'Knuth', SELECT id FROM questions WHERE title = 'Concrete Mathematics'),
  ('You''re not', SELECT id FROM users WHERE fname = 'Moist' && lname = 'Code', SELECT id FROM questions WHERE title = 'Awesomeness'),
  ('A tide pod will fix that.', SELECT id FROM users WHERE fname = 'Moist' && lname = 'Code', SELECT id FROM questions WHERE title = 'Clean Code');

INSERT INTO

VALUES

INSERT INTO

VALUES
