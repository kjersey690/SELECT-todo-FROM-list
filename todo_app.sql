DROP USER IF EXISTS "michael";
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app
\c
CREATE TABLE tasks (
id SERIAL NOT NULL,
title VarChar(255) NOT NULL,
description text  NULL,
created_at  timestamp without time zone  NOT NULL Now(),
updated_at  timestamp without time zone  NULL,
completed  boolean NOT NULL false

);
DROP COLUMN completed;