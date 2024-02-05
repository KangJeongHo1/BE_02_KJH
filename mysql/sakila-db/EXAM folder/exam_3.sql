-- INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)
-- VALUES ('New Adventure Movie', 'A thrilling adventure of the unknown', 2023, 1, 3, 4.99, 120, 19.99, 'PG', 'Trailers,Commentaries');
-- << film 테이블에 새로운 영화 추가

-- UPDATE customer
-- SET address_id = (SELECT address_id FROM address WHERE address = '123 New Address, New City')
-- WHERE customer_id = 5; << 고객 정보 업데이트

-- UPDATE rental SET return_date = NOW() WHERE rental_id = 200; << 영화 대여 상태 변경

-- DELETE FROM actor WHERE actor_id = 10; 배우 ID가 10인 배우의 정보를 삭제