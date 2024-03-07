USE yes24;

# 집계 및 그룹화
-- SELECT author, AVG(rating) FROM Books GROUP BY author; << 저자별 평균 평점 게산
-- SELECT publishing, COUNT(*) AS publishing_count FROM Books GROUP BY publishing ORDER BY publishing_count DESC; << 출판일별 출간된 책의 수를 계산
-- SELECT title, price FROM Books << 책 제목별 평균 가격 조회
-- SELECT title, review FROM Books ORDER BY review DESC LIMIT 5; << 리뷰가 많은 5개의 책들을 조회
-- SELECT ranking, AVG(review) FROM Books GROUP BY ranking; << 국내도서랭킹 별 평균 리뷰 수를 계산

# 서브쿼리 및 고급 기능
-- SELECT title, rating FROM Books WHERE rating > (SELECT AVG(rating) FROM Books) ORDER BY rating DESC; << 평균 평점보다 높은 평점을 받은 책 조회
-- SELECT title, price, publisher FROM Books WHERE price > (SELECT AVG(price) FROM Books) ORDER BY price DESC; << 평균 가격보다 비싼 책들의 제목과 가격을 조회
-- SELECT title, review FROM Books WHERE review > (SELECT MAX(review) FROM Books) << 이상한 문제
-- SELECT title, sales FROM Books WHERE sales < (SELECT AVG(sales) FROM Books); << 평균 판매지수보다 낮은 책들

-- SELECT author, title FROM Books << 가장 많이 출간한 저자의 책 제목들
-- WHERE author = (SELECT author FROM Books GROUP BY author ORDER BY COUNT(*) DESC LIMIT 1); 