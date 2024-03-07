USE testdatabase;

-- SET SQL_SAFE_UPDATES = 0;

DELETE FROM users WHERE username = 'YOUNG_PEOPLE' LIMIT 3;
SELECT * FROM users;
