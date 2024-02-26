from flask import Flask, request, Response


app = Flask(__name__)

@app.route('/')
def home():
    return "hello, This is Main page!"

@app.route('/about')
def about():
    return "This is the about page!"

@app.route('/compony')
def compony():
    return "This is the compony page!"

# 동적으로 URL파라미터 값을 받아서 처리해준다.
@app.route('/number/<int:number>')
def user_profile(number):

    return f'Number : {number}'

# POST요청 넣는 방법
# (1) postman
# (2) requests
import requests
@app.route('/test')
def test():
    url = 'http://127.0.0.1:5000/submit'
    data = ('test data')
    response = requests.post(url=url, data=data)
        
    return response

@app.route('/submit', methods=['GET', 'POST', 'PUT', 'DELETE'])
def submit():
    print(request.method)

    if request.method == 'GET':
        print("GET method")

    if request.method == 'POST':
        print("***POST method***", request.data)

    return Response("Sucessfully sumbitted", status=200)

if __name__ == "__main__":
    app.run()
