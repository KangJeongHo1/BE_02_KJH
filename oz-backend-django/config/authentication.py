from rest_framework.authentication import BaseAuthentication
from django.conf import settings
from users.models import User
import jwt

class JWTAuthentication(BaseAuthentication):
    def authenticate(self, requset):
        token = requset.headers.get("jwt-auth") #jwt token

        if not token:
            return None
        
        decoded = jwt.decode(token, 
                   settings.SECRET_KEY,
                   algorithms=["HS256"]
                   )    # 우리가 필요로 하는 데이터가 디코드 됌
        
        user_id = decoded.get('id')
        user = User.objects.get(id=user_id)

        return (user, None)
