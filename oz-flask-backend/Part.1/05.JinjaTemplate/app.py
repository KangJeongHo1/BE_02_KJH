from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")

def index():
    users = [
        {"username": "traveler", "name": "Alex"},
        {"username": "potograther", "name": "Sam"},
        {"username": "gourmet", "name": "Chris"}
    ]
        
    title = 'flask Jinja Template'
    
    # (1) rendering할 html 파일명 검색
    # (2) html로 넘겨줄 데이터 입력
    return render_template('index.html', users=users, title=title, is_admin=True)

if __name__ == "__main__":
    app.run(debug=True)
