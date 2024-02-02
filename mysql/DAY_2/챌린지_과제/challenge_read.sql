USE challenge;

## ------------------------------------------------ BEGINNER ------------------------------------------------
-- SELECT * FROM customers; << 모든 고객 정보 조회
-- SELECT productName FROM products; << 모든 제품 목록 조회
-- SELECT lastName, jobTitle FROM employees; << 이름과 직급 조회
-- SELECT city, addressLine1, addressLine2, phone FROM offices; << 모든 사무실 위치 조회
-- SELECT * FROM orders ORDER BY orderDate DESC LIMIT 10; << 최근 10개 주문 조회
-- SELECT * FROM orderdetails WHERE orderLinenumber = 1; << 특정 주문 모든 상세 정보조회
-- SELECT * FROM payments WHERE customerNumber = 121; << 특정 고객의 모든 지불 정보조회
-- SELECT productLine, textDescription FROM productLines; << 각 제품 라인의 설명을 조회
-- SELECT * FROM customers WHERE city = 'San Francisco'; << 테이블에서 특정 지역 고객 조회
-- SELECT * FROM products WHERE buyPrice BETWEEN 20 AND 50; << 테이블에서 특정 가격 범위의 제품 조회
## ----------------------------------------------------------------------------------------------------------
## ------------------------------------------------ INTERMEDIATE --------------------------------------------
-- SELECT * FROM orders WHERE customerNumber = 363; << 특정 고객 주문 조회
-- SELECT * FROM orderdetails WHERE productCode = 'S18_2248'; << 특정 제품에 대한 모든 주문 상세 조회
-- SELECT * FROM payments WHERE paymentDate = "2003-04-09"; << 특정 기간 동안의 모든 지불 정보
-- SELECT * FROM employees WHERE jobTitle = 'Sales Rep'; << 특정 직급 모든 직원 조회
-- SELECT * FROM offices WHERE country = 'USA'; << 특정 국가에 모든 사무실 조회
-- SELECT * FROM products WHERE productLine = 'Classic Cars'; << 특정 제품 라인에 속하는 모든 제품 조회
-- SELECT * FROM customers ORDER BY customerNumber DESC LIMIT 5; << 최근 가입한 5명의 고객 조회
-- SELECT * FROM products WHERE quantityInStock < 20; << 재고가 부족한 제품 조회
-- SELECT * FROM orders WHERE orderDate BETWEEN '2004-12-01' AND '2004-12-31'; 12-01부터 12-31까지의 주문 내역 조회

-- SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalAmount 
-- 	   FROM orderdetails WHERE orderNumber = 10100 GROUP BY orderNumber << 특정 주문에 대한 총 금액 계산
## ----------------------------------------------------------------------------------------------------------
## ------------------------------------------------ EXPERT ------------------------------------------------
-- SELECT city, COUNT(*) AS customerCount FROM customers GROUP BY city; << 각 지역의 고객 수 계산
-- SELECT productLine, AVG(buyPrice) AS averagePrice FROM products GROUP BY productLine; << 각 제품의 카테고리별 평균 가격
-- SELECT officeCode, COUNT(*) AS employeeCount FROM employees GROUP BY officeCode; 각 부서별 직원 수 계산

-- SELECT productCode, SUM(quantityOrdered) AS totalOrdered FROM orderdetails
-- GROUP BY productCode ORDER BY totalOrdered DESC LIMIT 5; << 가장 많이 팔린 제품 5개를 조회