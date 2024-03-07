USE yes24;

# 데이터 수정 및 관리
-- UPDATE Books SET pirce = 99999 WHERE title = "한국사" << 특정 책의 가격 변경
-- UPDATE Books SET title = "제목업데이트" WHERE author = "최태성" << 특정 저자의 책 이름 변경
-- DELETE FROM Books WHERE sales = (SELECT Min(sales) FROM Books); << 판매지수가 가장 낮은 책의 데이터를 삭제
-- UPDATE Books SET rating = rating + 1 WHERE publisher = "웅진하우스"; << 특정 출판사가 출판한 모든 책의 평점을 1점 증가

#데이터 분석 에제
-- SELECT author, AVG(rating), AVG(sales) FROM Books
-- GROUP BY author ORDER BY AVG(rating) DESC, AVG(sales) DESC; << 저자별 평균 평점 및 판매지수를 분석하여 인기있는 저자를 추출
-- SELECT publishing, AVG(price) FROM Books GROUP BY publishing ORDER BY publishing ASC << 출판일에 따른 책 가격의 변동추세

-- SELECT publisher, COUNT(*) AS book_count, SUM(review) AS review_sum 
-- FROM Books GROUP BY publisher ORDER BY book_count DESC; << 국내 출반사별 출간된 책의 수와 평균 리뷰 수를 비교 분석

-- SELECT ranking, AVG(sales) FROM Books GROUP BY ranking; << 랭킹과 판매지수의 상관관계를 분석하기
-- SELECT price, AVG(review), AVG(rating) FROM books GROUP BY price; << 가격 대비 리뷰 수와 평점의 관계를 분석하여 가성비 좋은 책 찾기

# 난이도 있는 문제
-- SELECT publisher, author, AVG(sales) as avg_sales FROM Books
-- GROUP BY publisher, author ORDER BY publisher, avg_sales DESC << 춟판사별 평균 판매지수가 가장 높은 저자 찾기

-- SELECT title, review, price FROM Books	<< 리뷰수가 평균보다 높으면서 가격은 평균 가격보다 낮은 책 찾기
-- WHERE review > (SELECT AVG(review) FROM Books) AND price < (SELECT AVG(price) FROM Books);

-- SELECT author, COUNT(DISTINCT title) AS num_books FROM Books
-- GROUP BY author ORDER BY num_books DESC	<< 서로 다른 제목의 책을 가장 많이 출간한 저자를 찾아줘

-- SELECT author, MAX(sales) AS max_sales FROM Books GROUP BY author << 저자의 책 중 가장 많은 판매지수

-- SELECT YEAR(publishing) as year, COUNT(*) AS num_books, AVG(price) AS avg_price FROM Books
-- GROUP BY year;	<< 연도별 출판된 책의 갯수와 평균 가격

-- SELECT publisher, MAX(rating) - MIN(rating) AS rating_difference FROM Books
-- GROUP BY publisher HAVING COUNT(*) >= 2 ORDER BY rating_difference DESC; << 출판사가 같은 책들 중 평점 편차가 가장 큰 출판사 찾기

-- SELECT title, rating / sales AS ratio FROM Books
-- ORDER BY ratio DESC	<< 판매지수 대비 평점이 가장 높은 책








