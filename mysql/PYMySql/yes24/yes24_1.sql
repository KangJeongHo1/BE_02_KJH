USE yes24;

-- CREATE TABLE Books (
--     bookID INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(255) NOT NULL,
--     author VARCHAR(255),
--     publisher VARCHAR(255),
--     publishing DATE,
--     rating DECIMAL(3, 1),
--     review INT,
--     sales INT,
--     price DECIMAL(10, 2),
--     ranking INT,
--     ranking_weeks INT
-- );

# 기본조회 및 필터링
-- SELECT title, author FROM Books; << 모든 책의 제목과 저자 조회
-- SELECT * FROM Books WHERE rating >= 8.0 << 평점이 8.0이상의 책들을 조회
-- SELECT title, review FROM Books WHERE review >= 100 << 리뷰 갯수가 100개 이상인 것들을 조회
-- SELECT title, price FROM Books WHERE price < 20000 << 20000원 미만인 것들을 조회
-- SELECT * FROM Books WHERE ranking_weeks >= 4 ORDER BY ranking_weeks DESC; << 국내 TOP100에 4주이상 머문 책들 오름차순으로 정렬
-- SELECT * FROM Books WHERE author = "자청 저" << 자청 저의 책들 가져오기
-- SELECT * FROM Books WHERE publisher = '웅진지식하우스' << 웅진지식하우스에서 출판한 책

## 조인 및 관계
-- SELECT author, COUNT(*) AS book_count FROM Books GROUP BY author ORDER BY book_count DESC; << 저자별로 출판한 책의 수를 조회
-- SELECT publisher, COUNT(*) AS publisher_count FROM Books GROUP BY publisher ORDER BY publisher_count DESC; << 가장 많은 책을 출판한 출판사
-- SELECT author, AVG(rating) AS rating_avg FROM Books GROUP BY author ORDER BY rating_avg DESC LIMIT 1; << 가장 높은 평점을 가진 작성자
-- SELECT * FROM Books WHERE ranking = 1 << 국내 도서랭킹이 1위인 책
-- SELECT title, sales, review FROM Books ORDER BY sales DESC, review DESC LIMIT 10 << 판매지수도 높고 리뷰수가 높은 책 10가지 추출
-- SELECT * FROM Books ORDER BY publishing DESC LIMIT 5; << 최근의 출판된 5권의 책














