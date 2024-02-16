from flask import Flask, request
from flask import render_template
import pymysql

app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    if request.method =='GET':
        db = pymysql.connect(
            host = '127.0.0.1',
            user = 'root',
            password = 'tmvlzj12',
            db = 'kream',
            charset = 'utf8mb4'
        )

        cur = db.cursor()
        category = request.args.get('category')
        product_name = request.args.get('product_name', '')
        sql = "SELECT * FROM kream WHERE 1=1"

        if category and category != '카테고리':
            sql += f" AND category = '{category}'"
        if product_name:
            sql += f" AND product_name LIKE '%{product_name}%'"
        cur.execute(sql)
        kream_data = cur.fetchall()

        
        page = request.args.get('page', type=int, default=1)
        per_page = 10
        total_count = len(kream_data)
        total_page = (total_count + per_page - 1) // per_page

        start = (page - 1) * per_page
        end = min(start + per_page, total_count)
        data_list = kream_data[start:end]

        return render_template(
            'index.html', data_list=data_list, total_page=total_page, page=page, product_name=product_name
            )

if __name__ == '__main__':
    app.debug=True
    app.run