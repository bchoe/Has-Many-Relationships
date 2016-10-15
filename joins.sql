-- SELECT * FROM users;

-- SELECT * FROM posts
-- WHERE user_id = 100;

-- SELECT first_name, last_name FROM posts WHERE user_id = 200;

-- SELECT posts.id,posts.title,posts.url,posts.content,posts.created_at,posts.updated_at,posts.user_id,users.first_name,users.last_name
-- FROM posts INNER JOIN users ON posts.user_id = users.id
-- WHERE user_id = 200;

-- SELECT posts.id,posts.title,posts.url,posts.content,posts.created_at,posts.updated_at,posts.user_id,users.username
-- FROM posts INNER JOIN users on posts.user_id = users.id
-- WHERE users.first_name = 'Norene' and users.last_name = 'Schmitt';

-- SELECT DISTINCT username
-- FROM users INNER JOIN posts on posts.user_id = users.id
-- WHERE posts.created_at > '2015-01-01 00:00:00-10'
-- ORDER BY username ASC;

-- SELECT posts.title, posts.content, users.username
-- FROM users INNER JOIN posts on posts.user_id = users.id
-- WHERE users.created_at < '2015-01-01 00:00:00-10';

-- SELECT comments.id, posts.title AS "Post Title", comments.body, comments.created_at, comments.updated_at
-- FROM comments INNER JOIN posts on comments.posts_id = posts.id;

-- SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
-- FROM comments INNER JOIN posts ON comments.posts_id = posts.id
-- WHERE posts.created_at < '2015-01-01 00:00:00-10';

-- SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
-- FROM comments INNER JOIN posts ON comments.posts_id = posts.id
-- WHERE posts.created_at > '2015-01-01 00:00:00-10';

-- SELECT posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment.body"
-- FROM comments INNER JOIN posts ON comments.posts_id = posts.id
-- WHERE comments.body LIKE '%USB%';

-- SELECT posts.title AS "post_title", users.first_name, users.last_name, comments.body AS "comment_body"
-- FROM posts
-- INNER JOIN users ON posts.user_id = users.id
-- INNER JOIN comments ON comments.posts_id = posts.id
-- WHERE comments.body LIKE '%matrix%';

-- SELECT users.first_name, users.last_name, comments.body AS "comment_body"
-- From comments
-- INNER JOIN users ON users.id = comments.user_id
-- INNER JOIN posts on posts.id = comments.posts_id
-- WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT u.first_name AS "post_author_first_name", u.last_name AS "post_author_last_name",
p.title AS "post_title", cu.username AS "comment_author_username", c.body AS "comment_body"
FROM comments AS c
INNER JOIN posts As p ON p.id = c.posts_id
INNER JOIN users As u ON u.id = c.posts_id
INNER JOIN users As cu ON cu.id = c.posts_id
WHERE (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%') AND p.content LIKE '%nemo%';