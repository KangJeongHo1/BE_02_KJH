-- SELECT f.title FROM film f JOIN film_actor fa ON f.film_id = fa.film_id JOIN actor a ON fa.actor_id = a.actor_id
-- WHERE a.first_name = "PENELOPE" AND a.last_name = "GUINESS" << 특정 배우가 나온 영화

-- SELECT c.name, COUNT(fc.film_id) AS number_of_films FROM category c
-- JOIN film_category fc ON c.category_id = fc.category_id GROUP BY c.name; << 카테고리에 따른 영화 갯수

-- SELECT r.rental_date, f.title FROM rental r
-- JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film f ON i.film_id = f.film_id
-- WHERE r.customer_id = 5	<< 고객 ID 가 5인 고객의 모든 대여 정보를 조회하기

-- SELECT title FROM film ORDER BY release_year DESC, title LIMIT 10	<< 가장 최근에 데이터베이스에 추가된 데이터

-- SELECT a.first_name, a.last_name FROM actor a
-- JOIN film_actor fa ON a.actor_id = fa.actor_id JOIN film f ON fa.film_id = f.film_id
-- WHERE f.title = 'ACADEMY DINOSAUR';	<< 특정 영화에 출현한 모든 배우의 이름

-- SELECT DISTINCT c.first_name, c.last_name FROM customer c
-- JOIN rental r ON c.customer_id = r.customer_id JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film f ON i.film_id = f.film_id
-- WHERE f.title = 'ACADEMY DINOSAUR';	<< 특정 영화를 대여한 모든 고객 목록
	
-- SELECT c.customer_id, c.first_name, c.last_name, MAX(r.rental_date) as last_rental_date, f.title FROM customer c
-- JOIN rental r ON c.customer_id = r.customer_id JOIN inventory i ON r.inventory_id = i.inventory_id JOIN film f ON i.film_id = f.film_id
-- GROUP BY c.customer_id, c.first_name, c.last_name, f.title;	<< 모든 고객과 그들이 가장 최근에 대여한 정보 조회


-- SELECT f.title, AVG(DATEDIFF(r.return_date, r.rental_date)) as avg_rental_period FROM film f	<< datediff 두 날짜의 차이
-- JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id
-- GROUP BY f.title; <<각 영화별 평균 대여 기간 조회