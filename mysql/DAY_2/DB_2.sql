USE testdatabase;

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE users
-- SET username = 'ADULTS'
-- WHERE age >= 25;

-- SELECT ROW_COUNT();	<< 몇 개의 데이터가 변경되었는지 확인
-- SELECT * FROM users;

-- UPDATE users
-- SET username = CASE
-- 	WHEN age >= 60 THEN 'SENIOR_DATA'
--     ELSE 'YOUNG_PEOPLE'
-- END;

UPDATE users
SET username = 'TOP5_PEOPLE'
WHERE age >= 24
LIMIT 1;

SELECT * FROM users;


 