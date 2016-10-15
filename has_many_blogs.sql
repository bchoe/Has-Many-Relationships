/*\c bryanchoe;

CREATE USER has_many_users;

DROP DATABASE IF EXISTS has_many_users;

CREATE DATABASE has_many_blogs OWNER has_many_users;

\c has_many_blogs;*/

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE users(
  id serial PRIMARY KEY,
  username character varying(90),
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE DEFAULT now(),
  updated_at timestamp WITH TIME ZONE DEFAULT now()
);


CREATE TABLE posts(
  id serial PRIMARY KEY,
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at timestamp  WITH TIME ZONE DEFAULT now(),
  updated_at timestamp  WITH TIME ZONE DEFAULT now(),
  user_id INTEGER REFERENCES users (id)
);


CREATE TABLE comments(
  id serial PRIMARY KEY,
  body character varying(510) DEFAULT NULL,
  created_at timestamp  WITH TIME ZONE DEFAULT now(),
  updated_at timestamp  WITH TIME ZONE DEFAULT now(),
  user_id INTEGER REFERENCES users (id),
  posts_id INTEGER REFERENCES posts (id)
);

\i scripts/blog_data.sql;