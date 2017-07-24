\c keith

DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app WITH OWNER michael;
\c todo_app
CREATE TABLE tasks (
id SERIAL NOT NULL,
title VarChar(255) NOT NULL,
description text  NULL,
created_at  timestamp without time zone  NOT NULL DEFAULT Now(),
updated_at  timestamp without time zone  NULL,
completed  boolean NOT NULL DEFAULT false

);


ALTER TABLE tasks ADD COLUMN completed_at timestamp;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks (id, title, description,created_at, updated_at, completed_at) VALUES
(DEFAULT ,'STUDY SQL', 'Completed This exercise', now(), now(), DEFAULT);

--does not work-- INSERT INTO tasks SET title = 'Study SQL', description = 'Completed This exercise', created_at = now(),
-- updated_at = now(), completed_at = NULL,
INSERT INTO tasks(title, description) VALUES
('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title  = 'Study SQL';

SELECT title, description FROM tasks
WHERE completed_at IS NULL;

SELECT * FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks(title, description) VALUES('mistake 1', 'a test entry');

INSERT INTO tasks(title, description) VALUES('mistake 2', 'a test entry');

INSERT INTO tasks(title, description) VALUES('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%Mistake%';

DELETE FROM tasks
WHERE title = 'mistake 1';
SELECT title, description FROM tasks
WHERE title LIKE '%Mistake%';

DELETE FROM tasks
WHERE title LIKE '%Mistake%';

SELECT * FROM tasks
ORDER BY title ASC;

