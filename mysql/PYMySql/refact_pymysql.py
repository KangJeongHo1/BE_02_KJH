import pymysql

def execute_query(connection, query, args=None):

    with connection.cursor() as cursor:     # << cursor = connection.cursor()
        cursor.execute(query, args or ())

        if query.strip().upper().startswith('SELECT'): # << 문자를 빈칸제거 대문자로 만든 다음 셀렉트라면 fetall하고 결과 리턴
            return cursor.fetchall()
        else:
            connection.commit()

def main():
    connection = pymysql.connect(host='localhost',
                                 user='username',
                                 password='password',
                                 db='database_name',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)

    try:
        # SELECT 연산
        result = execute_query(connection, "SELECT * FROM table_name")
        print("SELECT 연산 결과:")
        for row in result:
            print(row)

        # INSERT 연산
        execute_query(connection, "INSERT INTO table_name (column1, column2) VALUES (%s, %s)", ('data1', 'data2'))
        print("INSERT 연산 수행됨.")

        # UPDATE 연산
        execute_query(connection, "UPDATE table_name SET column1=%s WHERE column2=%s", ('new_data', 'criteria'))
        print("UPDATE 연산 수행됨.")

        # DELETE 연산
        execute_query(connection, "DELETE FROM table_name WHERE column_name=%s", ('criteria',))
        print("DELETE 연산 수행됨.")

    finally:
        connection.close()

if __name__ == "__main__":
    main()