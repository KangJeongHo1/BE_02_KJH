USE albums;

-- CREATE TABLE albums(
-- 	id INT AUTO_INCREMENT PRIMARY KEY,
--     album_name VARCHAR(255) NOT NULL,
--     album_year INT NOT NULL,
--     top_rank INT
-- );

-- INSERT INTO albums (album_name, album_year, top_rank) VALUES
-- ('The White Stripes', 1999, NULL),
-- ('DE Still', 2000, NULL),
-- ('White Blood Cells', 2001, 61),
-- ('Elephant', 2003, 6),
-- ('Get Behind Me Satan', 2005, 3),
-- ('Icky Thump', 2007, 2),
-- ('Under Great White Northem Lights', 2010, 11),
-- ('Live in Mississippi', 2011, NULL),
-- ('Live at the Gold Dollar', 2012, NULL),
-- ('Nine Miles from the White City', 2013, NULL)

#앨범 목록 조회
-- SELECT album_name, album_year FROM albums

#2000년 발매 앨범 조회
-- SELECT * FROM albums WHERE album_year = 2000

#차트 최고 순위 10위 이내 앨범 조회
-- SELECT * FROM albums WHERE top_rank <= 10

#차트 순위가 없는 앨범 조회
-- SELECT * FROM albums WHERE top_rank IS NULL

#연도별 앨범 수 조회
-- SELECT album_year, COUNT(*) AS count FROM albums GROUP BY album_year

#가장 최신 앨범 조회
-- SELECT * FROM albums ORDER BY album_year DESC LIMIT 1

#가장 오래된 앨범 조회
-- SELECT * FROM albums ORDER BY album_year ASC LIMIT 1

#차트 10위 이상 앨범 조회
-- SELECT * FROM albums WHERE top_rank >= 10

#'WHite'가 포함된 앨범 조회
-- SELECT * FROM albums WHERE album_name LIKE "%White%"

#2000년부터 2005년 사이 앨범 조회
-- SELECT * FROM albums WHERE album_year BETWEEN '2000' AND '2005'