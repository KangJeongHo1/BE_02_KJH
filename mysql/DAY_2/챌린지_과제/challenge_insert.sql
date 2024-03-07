USE challenge;

## ------------------------------------------------ BEGINNER ------------------------------------------------
-- ALTER TABLE customers
-- DROP FOREIGN KEY customers_ibfk_1; << 외래키 초기화

## PODO고객 추가
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
-- VALUES ('497', 'GRC', 'Podo', 'Kang', '010-9950-5262', 'HoByeongGol-16', 'NULL', 'PoCheon', 'Sineup', '11101', 'korea', '2001', '30000.00')

## Genesis 데이터 추가
--  INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
--  VALUES ('S10_1681', 'Genesis', 'Classic Cars', '1:10', 'Second Gear Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '7999', '70.01', '150.00');

## Park Haebin 직원 추가
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUES ('1900', 'Haebin', 'Park', 'x1500', 'hapneee@naver.com', '3', '1102', 'Sales Rep')

## Boston에 회사 추가
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
-- VALUES ('8', 'Boston', '+82 032 3231 232' , '1240 Court Place', 'Suite 90', 'NULL', 'USA', '20238', 'NA')

## 새 주문내역 추가
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
-- VALUES ('10426', '2005-06-01', '2005-07-01', NULL, 'In Process', NULL, '497')

## 상세 주문 정보 추기
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('10107', 'S12_1099', '27', '121.64', '7')

## 지불 정보 추가
-- INSERT INTO payments(customerNumber, checkNumber, paymentDate, amount)
-- VALUES ('119', 'HI366478', '2004-12-25', '10203.52')

## 테이블에 제품라인 추가
-- INSERT INTO productlines(productLine, textDescription, htmlDescription, image)
-- VALUES ('Computer', 'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.', NULL, NULL)

## 테이블에 새 고객 추가
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
-- VALUES ('498', 'GRC', 'Mong', 'Park', '010-6406-7538', 'HoByeongGol', NULL, 'PoCheon', 'Sineup', '11101', 'korea', '2002', '40000.00')

## 테이블에 다른 카테고리의 제품 추가
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
-- VALUES ('S18_1368', '1975 Mercedes-Benz 500K Special Roadster', 'Vintage Cars', '1:18', 'Studio M Art Models', 'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', '8635', '24.26', '53.91')

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## ------------------------------------------------ INTERMEDIATE ------------------------------------------------
## 여러 고객들 한 번에 추가
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
-- VALUES ('499', 'GRC', 'Bori', 'Park', '010-1234-5678', 'HoByeongGol', NULL, 'PoCheon', 'Sineup', '11101', 'korea', '2003', '20000.00'),
-- 	  	  ('500', 'GRC', 'Ddung', 'Kim', '010-2345-6789', 'HoByeongGol', NULL, 'PoCheon', 'Sineup', '11101', 'korea', '2004', '50000.00')

## 여러 product 한 번에 추가
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
-- VALUES ('S18_1369', '1975 GUCCI Special Roadster', 'Planes', '1:10', 'Classic Metal Creations', 'This 1:10 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', '8635', '24.26', '53.91'),
-- 	      ('S18_1370', '1970 CHANEL', 'Planes', '1:10', 'Classic Metal Creations', 'This 1:10 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', '8635', '24.26', '53.91')
   
## 여러 직원들 추가   
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUES ('1901', 'Heewon', 'Jung', 'x1510', 'exam12312@naver.com', '3', '1102', 'Sales Rep'),
-- 	      ('1902', 'SeongJun', 'Kwon', 'x1520', 'dfdf23@naver.com', '5', '1102', 'Sales Rep')

## 한 번에 order와 orderdetail추가하기
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
-- VALUES ('10427', '2005-07-01', '2005-07-11', NULL, 'In Process', NULL, '497');
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('10108', 'S18_4600', '27', '121.64', '7');

## 한 번에 여러 지불정보 입력
-- INSERT INTO payments(customerNumber, checkNumber, paymentDate, amount)
-- VALUES ('119', 'HI366480', '2004-12-25', '10203.52'), ('119', 'HI366488', '2004-12-25', '10203.52')

## 한 번에 고객과 주문 추가
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
-- VALUES ('498', 'GRC', 'Ho', 'Kim', '010-1111-2222', 'HoByeongGol-16', 'NULL', 'PoCheon', 'Sineup', '11101', 'korea', '2002', '30000.00');
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
-- VALUES ('10429', '2005-06-01', '2005-07-01', NULL, 'In Process', NULL, '497');

## 테이블에 직원 추가하고 바로 직급 할당하기
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUES ('1900', 'Haebin', 'Park', 'x1500', 'hapneee@naver.com', '3', '1102', 'Sales Rep');
-- UPDATE employees SET jobTitle = 'Sales Rep' WHERE employeeNumber = LAST_INSERT_ID()

## 테이블에 제품 추가하고 바로 재고 업데이트 하기
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
-- VALUES ('S10_1689', 'Genesis', 'Classic Cars', '1:10', 'Second Gear Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '7989', '70.01', '150.00');
-- UPDATE products SET quantityInStock = 30 WHERE productCode = LAST_INSERT_ID(); 

## 테이블에 새 사무실 추가하고 바로 추가 직원 할당하기
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
-- VALUES ('9', 'Boston', '+82 032 1231 232' , '1260 Court Place', 'Suite 96', 'NULL', 'USA', '20239', 'NA');
-- UPDATE employees SET officeCode = LAST_INSERT_ID() WHERE lastName = 'Blue'

## 테이블에 제품 라인 추가하고 여러 제품들 추가하기
-- INSERT INTO productlines(productLine, textDescription, htmlDescription, image)
-- VALUES ('Robot', 'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.', NULL, NULL);
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
-- VALUES ('S10_1781', 'Genesis', 'Classic Cars', '1:10', 'Second Gear Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '8000', '70.01', '150.00'),
-- 	   ('S10_1791', 'Genesis', 'Classic Cars', '1:10', 'Second Gear Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '8001', '70.01', '150.00');


## ------------------------------------------------ EXPERT ------------------------------------------------
## 테이블에 고객 추가하고 새 주문 추가하기
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
-- VALUES ('505', 'GRC', 'June', 'Kang', '010-9950-5262', 'HoByeongGol-16', 'NULL', 'PoCheon', 'Sineup', '11101', 'korea', '2006', '30000.00');
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('10113', 'S12_1099', '27', '121.64', '7')

## 테이블에 새 직원 추가하고 바로 그들의 매니저 업데이트하기
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUES ('2001', 'bin', 'Park', 'x1500', 'hapneee@naver.com', '3', '1102', 'Sales Rep');
-- UPDATE employees SET reportsTo = (SELECT employeeNumber FROM employees WHERE lastName = 'Johnson') WHERE lastName = 'bin';

## 테이블에 새 제품 추가하고 그 제품 주문하기
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
-- VALUES ('S10_1683', 'Genesis', 'Classic Cars', '1:10', 'Second Gear Diecast', 'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', '8010', '70.01', '150.00');
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('10111', 'S12_1099', '27', '121.64', '7')

## 테이블에 주문 내역 추가하고 지불 내역 추가
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
-- VALUES ('10450', '2005-06-01', '2005-07-01', NULL, 'In Process', NULL, '497');
-- INSERT INTO payments(customerNumber, checkNumber, paymentDate, amount)
-- VALUES ('119', 'HI366478', '2005-07-01', '10203.52')

## 테이블에 상세 정보 추가하고 관련 제품 감소
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('10100', 'S12_1099', '27', '121.64', '7');
-- UPDATE products SET quantityINStock = quantityInStock - 3 WHERE productCode = 6;



