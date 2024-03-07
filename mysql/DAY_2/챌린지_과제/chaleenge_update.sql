USE challenge;
## ------------------------------------------------ BEGINNER ------------------------------------------------
-- UPDATE customers SET addressLine1 = 'HoByeongGol' WHERE customerNumber = '496'; << 특정 고객 주소 갱신
-- UPDATE products SET buyPrice = 29.99 WHERE productCode = 'S10_1678'; << 특정 제품 가격 갱신
-- UPDATE employees SET jobTitle = 'Sales Manager (NA)' WHERE employeeNumber = '1165'; << 특정직원 직업 갱신
-- UPDATE offices SET phone = '123-434-3232' WHERE officeCode = '9'; << 특정 사무실 전화번호 갱신
-- UPDATE orders SET status = 'Shipped' WHERE orderNumber = '10423'; << 특정 주문의 상태를 갱신
-- UPDATE orderdetails SET quantityOrdered = 3 WHERE orderNumber = '10205'; << 특정 주문 상세 수량 갱신
-- UPDATE payments SET amount = 240.00 WHERE customerNumber = '103' AND paymentDate = '2023-01-01'; 특정 고객 지불 금액 갠싱
-- UPDATE productlines SET textDescription = 'Updated description' WHERE productLine = 'Classic Cars'; << 특정 제품 라인 설명 갱신
-- UPDATE customers SET email = 'exam@naver.com' WHERE customerNumber = '103'; << 특정 고객 이메일 갱신 X	
-- UPDATE products SET buyPrice = buyPrice * 1.1; << 여러 제품 가격 갱신 (Safe Mode)
## ----------------------------------------------------------------------------------------------------------
## ------------------------------------------------ INTERMEDIATE --------------------------------------------
-- UPDATE employees SET officeCode = 2 WHERE jobTitle = 'Sales Rep'; << 여러 직원의 부서를 한 번에 갱신
-- UPDATE offices SET city = 'Updated City' WHERE country = 'USA' << 여러 사무실의 위치를 한 번에 갱신
-- UPDATE orders SET status = 'Cancelled' WHERE orderDate BETWEEN '2022-10-01' AND '2022-12-31' << 지난 달의 모든 주문의 배송상태 갱신

-- UPDATE orderdetails SET priceEach = priceEach * 0.9 WHERE orderNumber << 여러 주문 상세의 가격을 한 번에 갱신
-- IN (SELECT orderNumber FROM orders WHERE orderDate BETWEEN '2023-01-01' AND '2023-01-31'

-- UPDATE payments SET amount = amount * 1.05 WHERE customerNumber = '103'; 특정 고객의 모든 지불 내역 갱신
-- UPDATE productlines SET textDescription = 'New description' WHERE productLine IN ('Classic Cars', 'Trains')
-- << 여러 제품 라인의 섦영을 한 번에 갱신

-- UPDATE customers SET phone = '999-999-999' WHERE city = 'San Francisco' << 특정 지역 모든 고객의 연락처 갱신
-- UPDATE products SET buyPrice = buyPrice * 0.95 WHERE productLine = 'Classic Cars' << 특정 카테고리의 모든 제품 가격 갱신
-- UPDATE employees SET salary = salary + 5000 WHERE employeeID =2 << salary Date X
-- UPDATE offices SET addressLine1 = '1234 NEW Address St', phone = '123-123-123' WHERE officeCode = 2; << 특정 사무실의 모든 정보 갱신
## ----------------------------------------------------------------------------------------------------------
## ------------------------------------------------ EXPERT ------------------------------------------------
-- UPDATE orders SET status = 'On Hold' WHERE orderDate BETWEEN '2022-01-01' AND '2022-12-31' << 지난 해의 모든 주문 상태 갱신
-- UPDATE orderdetails SET priceEach = priceEach * 1.1 WHERE orderNumber = 10204; << 특정 주문의 모든 상세 정보 갱신
-- UPDATE payments SET paymentDate = '2004-10-09' WHERE paymentDate BETWEEN '2023-01-01' AND '2023-01-31'; << 지난 달의 모든 지불 내역 생신

-- UPDATE productlines SET textDescription = 'New updated description' WHERE productLine
-- IN (SELECT productLine FROM products WHERE quantityInStock < 10); << 모든 자품 라인의 정보 갱신

-- UPDATE customers SET addressLine1 = 'New Address' WHERE customerNumber BETWEEN 1 AND 10; << 1 부터10의 주소 갱신

