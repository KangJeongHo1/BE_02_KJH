import pymysql

connection = pymysql.connect(
    host = 'localhost',
    user = 'root',
    password = 'tmvlzj12',
    db = 'airbnb',
    charset = 'utf8mb4',
    cursorclass = pymysql.cursors.DictCursor
)

with connection.cursor() as cursor:
    # 문제 1: Python Book 제품 추가

    # sql = "INSERT INTO Products(productName, price, stockQuantity) VALUES (%s, %s, %s)"
    # cursor.execute(sql, ('Python Book', 10000, 10))
    # connection.commit()

    # # 문제 2: 고객 목록 조회
    # cursor.execute("SELECT * FROM Products")
    # for book in cursor.fetchall():
    #     print(book)

    # 문제 3: 제품 재고 업데이트 1번 목록 갯수 1개 줄이기
    # sql = "UPDATE Products SET stockQuantity = stockQuantity - %s WHERE productID = %s"
    # cursor.execute(sql, (1, 1))
    # connection.commit()

    # 문제 4: 고객별 총 주문 금액
    # sql = "SELECT customerID, SUM(totalAmount) AS totalAmount FROM Orders GROUP BY customerID"
    # cursor.execute(sql)
    # dates = cursor.fetchall()
    # print(dates)

    # 문제 5: 고객 이메일 업데이트
    # sql = "UPDATE Customers SET email = %s WHERE customerID = %s"
    # cursor.execute(sql, ('updates@naver.com', 1))
    # connection.commit()

    # 문제 6: 주문 취소 15번 주문 지우기
    # sql = "DELETE FROM Orders WHERE orderID = %s"
    # cursor.execute(sql, (15))
    # connection.commit()

    # 문제 7: 특정 제품 검색 (LIKE를 이용하여 특정 단어와 일치하는 모든 정보 검색)
    # sql = "SELECT * FROM Products WHERE productName LIKE %s"
    # cursor.execute(sql, ('%BOOK%'))
    # datas = cursor.fetchall()

    # for data in datas:
    #     print(data['productName'])

    # 문제 8: 특정 고객의 주문 데이터 조회
    # sql = "SELECT * FROM Orders WHERE customerID = %s"
    # cursor.execute(sql, (1))
    # datas = cursor.fetchall()

    # for data in datas:
    #     print(data)

    # 문제 9: 가장 많은 주문을 한 고객 << 주문 횟수가 많아야함
    sql = """
        SELECT customerID, COUNT(*) AS orderCount 
        FROM Orders GROUP BY customerID 
        ORDER BY orderCount DESC LIMIT 1
        """ # 고객별 주문 횟수 정렬
    
    cursor.execute(sql)
    data = cursor.fetchone()
    print(data)

cursor.close()