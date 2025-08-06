CREATE TABLE subscribers (
    subscriber_id INT PRIMARY KEY,
    username VARCHAR(100) CHECK (username ~ '^[A-Z]'),
    email VARCHAR(100) UNIQUE CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    password integer NOT NULL
);

INSERT INTO subscribers (subscriber_id, username, email, password) VALUES
    (1, 'AliceUser', 'alice.user@example.com', 123456),
    (2, 'BobUser', 'bob.user@example.com', 987654),
    (3, 'CarolUser', 'carol.user@example.com', 555555);