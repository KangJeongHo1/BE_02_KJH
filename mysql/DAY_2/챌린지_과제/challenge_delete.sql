USE challenge;

## ------------------------------------------------ BEGINNER ------------------------------------------------
-- DELETE FROM customers WHERE customerNumber = 500; << 특정 고객 삭제
-- DELETE FROM products WHERE productCode = 'S72_3212' << 특정 제품 삭제
-- DELETE FROM employees WHERE employeeNumber = 1000; << 특정 직원 삭제
-- DELETE FROM offices WHERE officeCode = 1; << 특정 사무실 삭제
-- DELETE FROM orders WHERE orderNumber = 1; << 특정 주문 삭제
-- DELETE FROM orderdetails WHERE orderNumber = 1 << 특정 주문 상세를 삭제
-- DELETE FROM payments WHERE customerNumber = 103; << 특정 지불 내역 삭제
-- DELETE FROM productlines WHERE productLine = 'Classic Cars' << 특정 제품 라인 삭제
-- DELETE FROM customers WHERE city = 'San Francisco' << 특정 지역 모든 고객 삭제
-- DELETE FROM products WHERE productLine = 'Classic Cars' << 특정 카테고리 모든 제품 삭제
## ----------------------------------------------------------------------------------------------------------
## ------------------------------------------------ INTERMEDIATE --------------------------------------------
-- DELETE FROM employees WHERE jobTitle = 'Sales'; << 특정 부서 모든 직원 삭제
-- DELETE FROM offices WHERE country = 'USA'; << 특정 국가의 모든 사무실 삭제
-- DELETE FROM orders WHERE orderDate BETWEEN '2002-12-01' AND '2002-12-31'; << 지난달의 모든 주문을 삭제
-- DELETE FROM orderdetails WHERE orderNumber = 10100; << 특정 주문의 모든 상세 정보 삭제
-- DELETE FROM payments WHERE customerNumber = 103; << 특정 고객의 모든 지불내역 삭제
-- DELETE FROM productlines WHERE productLine IN ('Motorcycles', 'Planes'); << 여러 제품라인 삭제

-- DELETE FROM customers WHERE customerNumber IN (SELECT customerNumber 
-- FROM customers ORDER BY customerNumber DESC LIMIT 5); << 가장 오래된 4명

-- DELETE FROM products WHERE quantityInStock = 0; << 재고가 없는 모든 제품 삭제
-- DELETE FROM employees WHERE jobTitle = 'Sales Rep'; << 해당 직급의 모든 직원 삭제
-- DELETE FROM offices WHERE officeSize < 10; << officeSize X
## ----------------------------------------------------------------------------------------------------------
## ------------------------------------------------ EXPERT ------------------------------------------------
-- DELETE FROM orders WHERE orderDate BETWEEN '2022-01-01' AND '2022-12-31'; << 지난해의 모든 주문 내역 삭제

--  DELETE FROM orderdetails WHERE productCode IN (SELECT productCode 
--  FROM products ORDER BY quantityInStock ASC LIMIT 5); << 가장 적게 팔린 모든 주문 내역 삭제

-- DELETE FROM payments WHERE amount < 50; << 특정 금액 이하의 모든 지불내역 삭제
-- DELETE FROM productlines WHERE productLine NOT IN (SELECT DISTINCT productLine FROM products); 제품이 없는 모든 제품 라인 삭제
-- DELETE FROM customers WHERE lastOrderDate < '2022-01-01'; << 1년동안 활동하지 않은 모든 고객 삭제