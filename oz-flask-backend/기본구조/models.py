from werkzeug.security import generate_password_hash, check_password_hash
from database import db


# Product 모델 정의
class Product(db.Model):
    __tablename__ = "product"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text, nullable=True)
    price = db.Column(db.Float, nullable=False)

   



# Cart 모델 정의
class Cart(db.Model):
    __tablename__ = "cart"
    pass




# Order 모델 정의
class Order(db.Model):
    __tablename__ = "order"
    pass




# OrderDetail 모델 정의
class OrderDetail(db.Model):
    __tablename__ = "order_detail"
    pass



# User 모델 정의
class User(db.Model):
    __tablename__ = "user"
    pass