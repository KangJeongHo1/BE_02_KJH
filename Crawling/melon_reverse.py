import requests
from bs4 import BeautifulSoup

header_user = {"User-Agent" :  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}

base_url = "https://www.melon.com/chart/month/index.htm"

req = requests.get(base_url, headers=header_user)

html = req.text
soup = BeautifulSoup(html, "html.parser")

# num = 1 << 곡 순위 할 수 있는 다른 방법
lst_all = soup.find_all(class_=["lst50","lst100"])

for i in lst_all:
    rank_up = i.select_one(".up")   
    
    if rank_up:
        song_title = i.select_one(".ellipsis.rank01 a") #.strip()으로도 공백 제거가능
        song_name = i.select_one(".ellipsis.rank02 a")
        song_rank = i.select_one(".wrap.t_center .rank")
        song_album = i.select_one(".ellipsis.rank03 a")

        print(f"곡 순위 : {song_rank.text}위 ⬆ {rank_up.text}")  # << print(f"[순위] {num}")
        print(f"곡 이름 : {song_title.text}")
        print(f"가수 이름 : {song_name.text}")
        print(f"앨범 이름 : {song_album.text}")
        print()