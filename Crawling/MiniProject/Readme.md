# Kream 크롤링 미니프로젝트

------------------
# **miniproject.py**

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

------------------
# **app.py**

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

        params= []

        if category and category != '카테고리':
            print("카테고리:", category)  
            sql += f" AND category = %s "
            params.append(category)
        if product_name:
            print("제품명:", product_name)  
            sql += f" AND product_name LIKE %s "
            params.append(f"%{product_name}%")

        cur.execute(sql, params)
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
    app.run()
```
* ##### 1 ] ~if cagerory and category문을 통하여 검색기능 추가. ( 개선필요 -> 세부적인 검색 (현태 전체 카테고리에서만 검색 가능))~
* #####    >> 카테고리 별 검색기능 추가 완료.
* ##### 2 ] page = request.arg문을 사용하여 한 페이지에 10개의 데이터가 추가될 수 있도록 코드 구성
------------------

# **index.html**

### 3. 부트스트랩과 연동하여 프론트 제작 및 기능 구현
 * ##### 1) 기본셋팅
```
<link rel="stylesheet" href="{{ url_for('static', filename='bootstrap.min.css') }}">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
```
* ##### 1 ] 부트스트랩 연동을 위한 기본셋팅
------------------
* #### 2) 검색기능 구현
```
<select class="form-select" id="category" name="category">
       <option selected>카테고리</option>
       <option value="상의">상의</option>
       <option value="하의">하의</option>
       <option value="신발">신발</option>
       <option value="시계">시계</option>
</select>
---------------------------------------------------------------------------
<div class="col-auto">
       <label class="visually-hidden" for="product_name">Name</label>
       <input type="text" class="form-control" id="product_name" name="product_name" placeholder="제품명을 입력해주새요.">
</div>
```
* ##### 1 ] value 값을 ``` app.py ``` 파일로 보냄
* ##### 2 ] product_name 값을 input으로 설정
------------------
* #### 3) 테이블에 크롤링 한 데이터를 넣어주기
```
<tbody id="data-table">
       {% for i in data_list %}
       <tr>
          <td {% if i[4] == "품절" %} class="bg-beige" {% endif %}>{{ i[0] }}</td>
          <td {% if i[4] == "품절" %} class="bg-beige" {% endif %}>{{ i[1] }}</td>
          <td {% if i[4] == "품절" %} class="bg-beige" {% endif %}><a href="{{ i[2] }}">
              {{ i[3] }}
          </a></td>
          <td {% if i[4] == "품절" %} class="bg-beige" {% endif %}>{{ i[4] }}</td>
       </tr>
       {% endfor %}
</tbody>
```
* ##### 1 ] i[0] ~ i[4] 까지 각각 category, brand, product_name, price라는 값
* ##### 2 ] 가격이 "품절"이라는 문구라면 열에 색을 입혀서 품점을 표현
------------------
* #### 4) 페이지네이션 기능 구현
```
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="{{ url_for('index', category=category, product_name=product_name, page=1)}}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>

        {% set group_number = ((page - 1) // 10) + 1 %}
        {% set start_page = (group_number - 1) * 10 + 1 %}
        {% set end_page = start_page + 9 %}
        {% if end_page > total_page %}
            {% set end_page = total_page %}
        {% endif %}
        
        {% for num in range(start_page, end_page + 1)%}
        <li class="page-item"><a class="page-link" href="{{ url_for('index', category=category , product_name=product_name, page=num)}}">{{num}}</a></li>
        {% endfor %}
        <li class="page-item">
          {% if product_name %}
            <a class="page-link" href="{{ url_for('index', page=end_page + 1, category=category, product_name=product_name )}}&page={{ page }}" aria-label="Next">
          {% else %}
            <a class="page-link" href="{{ url_for('index', page=end_page + 1, category=category)}}&page={{ page }}" aria-label="Next">
          {% endif %} 
          <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
```
* ##### 1 ] 버튼을 누를때마다 그 페이지에 해당하는 링크로 이동
* ##### 2 ] 페이지가 1부터 10까지 10개가 나타나게하고 화살표를 누르면 11부터 20까지 나타날 수 있게 구성
  
------------------
# **추후 기능 개발 예정**
* #### 1) 가격순 표현 개발
* #### 2) 자동으로 데이터 갱신 개발
* #### 3) 제품 이미지 업로드
* ~#### 4) 검색기능~
