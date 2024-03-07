import pymysql

# 1. DB connection
connection = pymysql.connect(
    host = '127.0.0.1',
    user = 'root',
    password = 'tmvlzj12',
    db = 'classicmodels',
    charset = 'utf8mb4',
    cursorclass = pymysql.cursors.DictCursor # << Dict형대로 가져와서 키 값을 불러올 수 있음 (원래는 tuple값)
)
# 2. SELECT FROM
def get_customers():
    cursor = connection.cursor()

    sql = 'SELECT * FROM customers'
    cursor.execute(sql)

    customers = cursor.fetchone()
    print('customer : ', customers)
    print('customer : ', customers['customerNumber'])
    print('customer : ', customers['customerName'])
    print('customer : ', customers['country'])
    cursor.close()   # << 연결 끊기
# 2. INSERT INTO
def add_customer():
    cursor = connection.cursor()

    name = 'jeongho'
    family_name = 'kang'
    sql = f"INSERT INTO customers(customerNumber, customerName, contactLastName) VALUES({10000}, '{name}', '{family_name}')"
    cursor.execute(sql)
    connection.commit()     # << 실제 데이터 베이스에 반영을 해줘

# add_customer()

# 3. UPDATE INTO
def upadate_customer():
    cursor = connection.cursor()
    update_name = 'update_Bin'
    contactLastName = 'update_Park'

    sql = f"UPDATE customers SET customerName = '{update_name}', contactLastName = '{contactLastName}' WHERE customerNumber = 10000"
    
    cursor.execute(sql)
    connection.commit()
    cursor.close()

# upadate_customer()

# 4. DELETE FROM
def delete_customer():
    cursor = connection.cursor()

    sql = "DELETE FROM customers WHERE customerNumber = 10000"
    cursor.execute(sql)
    connection.commit()
    cursor.close()

delete_customer()