USE testdatabase;

-- SELECT * FROM users
-- WHERE age BETWEEN 20 AND 25 LIMIT 1;

-- SELECT * FROM users LIMIT 3, 3;

-- SELECT age, COUNT(*) AS age_count FROM users GROUP BY age;

-- SELECT
-- 	username,
--     age,
--     CASE WHEN age >= 20 THEN '성인' ELSE '미성년자' END AS age_group
-- FROM users;

SELECT
	username,
    age,
    ROW_NUMBER() OVER (ORDER BY age ASC) AS 'rank'
FROM users;