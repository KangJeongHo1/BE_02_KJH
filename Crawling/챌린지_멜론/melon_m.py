from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from bs4 import BeautifulSoup
import time

#옵션 실행
options = Options()
user = "Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36 Edg/121.0.0.0" 
options.add_argument('user-agent=' + user)
options.add_experimental_option("detach", True)
options.add_experimental_option("excludeSwitches", ["enable-automation"])
driver = webdriver.Chrome(options=options)

#크롤링 코드
url = "https://m2.melon.com/index.htm"
driver.get(url)
time.sleep(0.5)

if driver.current_url != url:
    driver.get(url)

time.sleep(0.3)
driver.find_element(By.LINK_TEXT, "닫기").click()
time.sleep(0.3)

driver.find_element(By.LINK_TEXT, "멜론차트").click()
time.sleep(0.3)

buttons = driver.find_elements(By.CSS_SELECTOR, "#moreBtn")
buttons[1].click()

for i in range(4):
    driver.find_element(By.TAG_NAME, "body").send_keys(Keys.PAGE_DOWN)
    time.sleep(0.2)

html = driver.page_source
soup = BeautifulSoup(html, "html.parser")

song = soup.select("#_chartList .list_item")

Num = 1
for i in song:
    song_name = i.select_one(".title.ellipsis")
    song_singer = i.select_one(".name.ellipsis")
    
    print(f"Rank. {Num}")
    print(f"곡 이름 : {song_name.text.strip()}")
    print(f"가수 이름 : {song_singer.text.strip()}")
    print()
    
    Num += 1

time.sleep(1)
driver.quit()
    
#노래 제목
#노래 순위
#가수 이름
