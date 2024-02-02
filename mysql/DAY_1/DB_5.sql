USE testdatabase;

-- CREATE TABLE users(
-- 	user_id INT PRIMARY KEY AUTO_INCREMENT,
--     username TEXT NOT NULL,
--     email TEXT NOT NULL,
--     age INT
-- );

-- INSERT INTO users(username, email, age) VALUES('jeongho', 'rkdwjdgh04@naver.com', '26')
-- INSERT INTO users(username, email) VALUES('jeongho2', 'rkdwjdgh04@naver.com')
-- INSERT INTO users(username, email, age) VALUES
-- 	('alice', 'alice@naver.com', 30),
--     ('bob', 'bob@naver.com', 20),
--     ('charlie', 'charlie@naver.com', 35);


-- INSERT INTO users(username, email) VALUES
--  	('david', 'david@naver.com'),
--     ('elena', 'elena@naver.com');

-- INSERT INTO users(username, email, age) VALUES ('john', 'john@naver.com', 25);
-- INSERT  IGNORE INTO users(username, email, age) VALUES ('john', 'john@naver.com', 25); << IGNORE로 중복된 변수도 저장 가능
   
-- INSERT INTO users(username, email, age) VALUES ('john', 'john@naver.com', 100)
-- ON DUPLICATE KEY UPDATE age = 25; -- age가 25라는 데이터가 있으면 위에 문장으로 바꿔준다 ex) age > 100.

INSERT INTO users SET username = 'podo', email = 'podo@naver.com', age = 11;

SELECT * FROM users;

