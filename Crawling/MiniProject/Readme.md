# Kream 크롤링 미니프로젝트

## miniproject.py

### 1. 크롤링 후 MySql연결하기
  *  #### 1) 기본 셋팅
```
from bs4 import BeautifulSoup
from selenium import webdriver
import pymysql
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
```


  * #### 2) 크롤링 및 MySql연결
```
for i in range(8):
    driver.find_element(By.TAG_NAME, "body").send_keys(Keys.PAGE_DOWN)
    time.sleep(0.3)

html = driver.page_source
soup = BeautifulSoup(html, "html.parser")

items = soup.select(".item_inner")

product_list = []
for i in items:
    product_name = i.select_one(".translated_name")
    if "지샥" in product_name.text:
        category = "시계"
        product_brand = i.select_one(".product_info_brand.brand").text
        product_name_hood = i.select_one(".translated_name").text
        product_price = i.select_one(".amount").text

        print(product_name_hood, product_price)
        item = [category, product_brand, product_name_hood, product_price]
        product_list.append(item)

print(item)
driver.quit()

connection = pymysql.connect(
    host = '127.0.0.1',
    user = 'root',
    password = 'tmvlzj12',
    db = 'kream',
    charset = 'utf8mb4'
)

connection.cursor()
```
* #####  1 ] for i in range문을 이용하여 페이지에 8번 정도의 드래그를 하여 데이터를 크롤링하고 html.parser를 사용하여 문서 구분 및 추출을 진행
* #####  2 ] 빈 리스트인 product_list를 만들어 크롤링 된 데이터가 추출되어질 공간을 만듦
* #####  3 ] for문 안에 있는 "지샥"과 category = "시계"를 바꿔가며 여러 항목들을 크롤링함. ex) "후드"  category = "상의"
* #####  4 ] 이후 connetion이라는 변수를 이용하여서 MySql과 커넥팅


## app.py

### 2. flask를 사용하여서 웹 페이지와 python연결

  * #### 1) 기본셋팅
```
from flask import Flask, request
from flask import render_template
import pymysql

app = Flask(__name__)
```

  * #### 2) MySql에 저장된 데이터 가져오기
```
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
```

  * #### 3) 저장된 데이터를 10개씩 나타내고 전체 검색기능 추가
```
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
```
* ##### 1 ] if cagerory and category문을 통하여 검색기능 추가. ( 개선필요 -> 세부적인 검색 (현태 전체 카테고리에서만 검색 가능))
* --ing 
