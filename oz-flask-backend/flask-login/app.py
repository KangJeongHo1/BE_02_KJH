from flask import Flask
from flask_login import LoginManager
from models import User


app = Flask(__name__)
app.secret_key = 'Flask-secret-key'

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

@login_manager.user_loader
def load_user(user_id):
    return User.get(user_id)

from routes import configure_route
configure_route(app)

if __name__ == '__main__':
    app.run(debug=True)