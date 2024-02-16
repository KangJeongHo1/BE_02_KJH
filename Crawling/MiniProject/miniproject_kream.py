from bs4 import BeautifulSoup
from selenium import webdriver
import pymysql
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

user = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"


options_ = Options()
options_.add_argument(f"user-Agent={user}")
options_.add_experimental_option("detach", True)
options_.add_experimental_option("excludeSwitches", ["enable-logging"])

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options_)

url = "https://kream.co.kr/"
driver.get(url)
time.sleep(0.3)

driver.find_element(By.CSS_SELECTOR, ".search_btn_box").click()
time.sleep(0.3)

driver.find_element(By.CSS_SELECTOR, ".input_search.show_placeholder_on_focus").send_keys("지샥")
time.sleep(0.3)

driver.find_element(By.CSS_SELECTOR, ".input_search.show_placeholder_on_focus").send_keys(Keys.ENTER)
time.sleep(0.3)

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

def execute_query(connection, query, args=None):
    with connection.cursor() as cursor:
        cursor.execute(query, args or ())
        if query.strip().upper().startswith('SELECT'):
            return cursor.fetchall()
        else:
            connection.commit()

for i in product_list:
    execute_query(
        connection, """INSERT INTO kream (category, brand, product_name, price)
        VALUES (%s, %s, %s, %s)""", (i[0], i[1], i[2], i[3])
    )