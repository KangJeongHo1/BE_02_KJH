-- CREATE DATABASE testdatabase;
-- USE testdatabase;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT << id의 값이 1씩 증가하면서 고유한 값을 생성
    username VARCHAR(30) NOT NULL , -- username에는 공백의 값이 들어갈 수 없도록 설정
    email VARCHAR(100) UNIQUE,
    is_business VARCHAR(10) DEFAULT False,
    age INT CHECK (age >= 10) -- 만든 테이블을 확인하고 싶으면 Schemas > testdatabase > table > 스페너 모양 클릭
    
);