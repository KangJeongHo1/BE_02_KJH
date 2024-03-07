USE classicmodels;

-- SELECT customerName FROM customers;		<< 고객 목록 조회
-- SELECT * FROM products WHERE productLine = "Classic Cars";		<< Classic Cars 제품 조회
-- SELECT * FROM orders ORDER BY orderDate DESC LIMIT 10;	<< 최근 10개의 주문 날짜 조회
-- SELECT * FROM payments WHERE amount >= 100;		<< 100달러 이상 결제 조회

-- ## 주문과 고객 정보 조합
-- SELECT o.orderNumber, c.customerName		
-- FROM orders o
-- JOIN customers c ON o.customerNumber = c.customerNumber; << orderNumber = costomerName인 데이터를 가져와라

-- ## 제품과 제품 라인 결합
-- SELECT p.*, pl.*
-- SELECT p.productName, p.productLine, pl.textDescription
-- FROM products p
-- JOIN productlines pl ON p.productLine = pl.productLine

-- ## 직원과 직속 상사 이름 조회
-- SELECT e1.employeeNumber, e1.firstName, e1.lastName, e2.firstName AS 'ManagerLastName'
-- FROM employees e1
-- LEFT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber;

-- ## 특정 사무실에 직원 목록
-- SELECT e.employeeNumber, e.lastName, e.firstName, e.extension, e.email, e.officeCode, e.reportsTo, e.jobTitle
-- FROM employees e
-- JOIN offices o ON e.officeCode = o.officeCode
-- WHERE o.city = 'San Francisco'

-- ## 제품 라인별 제품 수
-- SELECT productLine, COUNT(*) AS productCount
-- FROM products
-- GROUP BY productLine

-- ## 고객별 총 주문 금액 오름차순 나열
-- SELECT customers.customerNumber,
-- 	      customers.customerName,
--        SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalAmount
-- FROM customers
-- JOIN orders ON customers.customerNumber = orders.customerNumber
-- JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
-- GROUP BY customers.customerNumber, customers.customerName
-- ORDER BY totalAmount DESC;

-- ## 가장 많이 팔린 제품 10위 나열
-- SELECT productName, SUM(quantityOrdered) AS totalQuantity
-- FROM orderdetails od
-- JOIN products p ON od.productCode = p.productCode
-- GROUP BY productName
-- ORDER BY totalQuantity DESC
-- LIMIT 10; 					<< 가장 많이 팔린 TOP 10 상품

-- ## 매출이 가장 높은 사무실
-- SELECT o.city, SUM(od.quantityOrdered * od.priceEach) AS totalSales
-- FROM orders ord
-- JOIN orderdetails od ON ord.orderNumber = od.orderNumber
-- JOIN customers c ON ord.customerNumber = c.customerNumber
-- JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
-- JOIN offices o ON e.officeCode = o.officeCode
-- GROUP BY o.city
-- ORDER BY totalSales DESC
-- LIMIT 1;				< 가장 매출이 높은 지역을 가져오기

-- ## 특정 금액 이상의 주문
-- SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalAmount
-- FROM orderdetails
-- GROUP BY orderNumber
-- HAVING totalAmount > 500; << 특정 금액 이상 주문

-- ## 평균 이상 결제 고객
-- SELECT customerNumber, SUM(amount) AS totalPayment
-- FROM payments
-- GROUP BY customerNumber
-- HAVING totalPayment > (SELECT AVG(amount) FROM payments); << 평규이상 결제 고객 목록 조회

-- ## 주문 없는 고객
-- SELECT customerName
-- FROM customers
-- WHERE customerNumber NOT IN (SELECT customerNumber FROM orders) << 주문 없는 고객

-- ## 최대 매출 고객
-- SELECT c.customerName, SUM(od.quantityOrdered * od.priceEach) AS totalSpent
-- FROM customers c
-- JOIN orders o ON c.customerNumber = o.customerNumber
-- JOIN orderdetails od ON o.orderNumber = od.orderNumber
-- GROUP BY c.customerName
-- ORDER BY totalSpent DESC
-- LIMIT 1; 			<< 가장 많은 소비를 한 고객

-- ## 신규 고객 추가
-- INSERT INTO customers (customerName, cuntacLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
-- VALUES ('NEW Customer', 'Lastname', 'Firstname', '123-456-7890', '123 Street', 'Suite 1', 'City', 'State', 'postalCode', 'Country', 1002, 50000.00);

-- ## 제품 가격 변경 (10% 인상)
-- UPDATE products
-- SET buyPrice = buyPrice * 1.10
-- WHERE productLine = 'Classic Cars';

-- ## 특정 고객 데이터 업데이트
-- UPDATE customers
-- SET email = 'update@gmail.com'
-- WHERE customerNumber = 123 		<< customerNumber가 123인 사람의 email 바꾸기

-- ## 특정 직원 사무실 이동
-- UPDATE employess
-- SET offices = 'New York'
-- WHERE employeeNumber = 123		<< offices 바꾸기



