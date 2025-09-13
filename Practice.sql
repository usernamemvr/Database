-- =====================
-- DROP old tables if exist
-- =====================
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

-- =====================
-- CREATE TABLES
-- =====================
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
                       post_id SERIAL PRIMARY KEY,
                       user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
                       title VARCHAR(200) NOT NULL,
                       content TEXT,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments (
                          comment_id SERIAL PRIMARY KEY,
                          post_id INT NOT NULL REFERENCES posts(post_id) ON DELETE CASCADE,
                          user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
                          comment TEXT NOT NULL,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================
-- INSERT DATA
-- =====================
INSERT INTO users (username, email) VALUES
                                        ('ram', 'ram@gmail.com'),
                                        ('bheema', 'bheema@gmail.com'),
                                        ('greeshma', 'greeshma@gmail.com'),
                                        ('hina', 'hina@onepiece.com'),
                                        ('rohan', 'rohan@webknot.in');

INSERT INTO posts (user_id, title, content) VALUES
                                                (1, 'First Post', 'This is Ram''s first post!'),
                                                (2, 'Bheema''s Thoughts', 'Hello from Bheema!'),
                                                (3, 'Greeshma''s Diary', 'Today was a good day.');

INSERT INTO comments (post_id, user_id, comment) VALUES
                                                     (1, 2, 'Nice post, Ram!'),
                                                     (1, 3, 'I agree with Bheema.'),
                                                     (2, 1, 'Cool thoughts, bro.');

-- =====================
-- BASIC SELECT QUERIES
-- =====================
-- Fetch all users
SELECT * FROM users;

-- Fetch recent 3 users
SELECT * FROM users ORDER BY created_at DESC LIMIT 3;

-- Fetch posts by a specific user
SELECT * FROM posts WHERE user_id = 1;

-- Fetch comments for a post
SELECT * FROM comments WHERE post_id = 1;

-- =====================
-- UPDATE DATA
-- =====================
UPDATE users SET email = 'ram@newmail.com' WHERE username = 'ram';

-- =====================
-- DELETE DATA
-- =====================
-- Delete a single user
DELETE FROM users WHERE username = 'hina';

-- Delete all comments (safe version)
DELETE FROM comments WHERE 1=1;

-- TRUNCATE a table
TRUNCATE TABLE posts RESTART IDENTITY;

-- =====================
-- DROP TABLE
-- =====================
DROP TABLE comments;
DROP TABLE posts;
DROP TABLE users;

-- =====================
-- CONSTRAINT EXAMPLES
-- =====================
CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100) NOT NULL UNIQUE,
                          price NUMERIC CHECK (price > 0),
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, price) VALUES ('Laptop', 50000); -- ✅ Works
-- INSERT INTO products (name, price) VALUES ('Phone', -1000); -- ❌ Will fail
