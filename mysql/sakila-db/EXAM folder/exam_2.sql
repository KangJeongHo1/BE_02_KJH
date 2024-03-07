-- SELECT f.title, COUNT(r.rental_id) as rental_count FROM film f
-- JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id
-- GROUP BY f.title ORDER BY rental_count DESC LIMIT 1;	<< 가장 많이 대여된 영화의 제목과 대여 횟수를 조회하기

-- SELECT c.name, AVG(f.rental_rate) as average_rental_rate FROM category c
-- JOIN film_category fc ON c.category_id = fc.category_id JOIN film f ON fc.film_id = f.film_id
-- GROUP BY c.name;	<< 각 카테고리별 평균 대여 요금

-- SELECT YEAR(p.payment_date) as year, MONTH(p.payment_date) as month, SUM(p.amount) as total_sales FROM payment p
-- GROUP BY YEAR(p.payment_date), MONTH(p.payment_date);	<< 월 별로 총 매출액 계산

-- SELECT a.first_name, a.last_name, COUNT(fa.film_id) as number_of_films FROM actor a
-- JOIN film_actor fa ON a.actor_id = fa.actor_id
-- GROUP BY a.first_name, a.last_name;	<< 배우별로 출연한 영화의 수

-- SELECT f.title, SUM(p.amount) AS total_revenue FROM film f
-- JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY f.title ORDER BY total_revenue DESC	<< 가장 많은SELECT f.title, f.rental_rate

-- SELECT f.title, f.rental_rate FROM film f
-- WHERE f.rental_rate > (SELECT AVG(rental_rate) FROM film);	<< 평균보다 높은 대여 요금을 가진 영화 찾기

-- SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count FROM rental r
-- JOIN customer c ON r.customer_id = c.customer_id
-- GROUP BY c.customer_id ORDER BY rental_count DESC << 가장 활동적인 고객 조회

-- SELECT f.title, COUNT(r.rental_id) AS rental_count FROM film f
-- JOIN film_actor fa ON f.film_id = fa.film_id JOIN actor a ON fa.actor_id = a.actor_id
-- JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id
-- WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS'
-- GROUP BY f.title ORDER BY rental_count DESC	<< 특정 배우가 출연한 영화 중 가장 인기있는 영화


