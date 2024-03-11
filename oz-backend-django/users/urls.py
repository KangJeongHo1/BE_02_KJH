from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token
from rest_framework_simplejwt.views import(
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)

urlpatterns = [
    path("", views.Users.as_view()), # api/v1/users
    path("myinfo", views.MyInfo.as_view()), # api/v1/users/myinfo

    # Authentication
    path("getToken", obtain_auth_token), # DRF token
    path("login", views.Login.as_view()),   # Django Session login
    path("logout", views.Logout.as_view()), # Django Session logout

    #JWT Authentication
    path("login/jwt", views.JWTLogin.as_view()),
    path("login/jwt/info", views.UserDetailView.as_view()),

    # Simple JWT Authentication
    path("login/simpleJWT", TokenObtainPairView.as_view()),
    path("login/simpleJWT/refresh", TokenRefreshView.as_view()),
    path("login/simpleJWT/verify", TokenVerifyView.as_view()),
    ]



# {
#     "refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMTM0NjUxNiwiaWF0IjoxNzEwMTM2OTE2LCJqdGkiOiJmN2Y3ZmYzM2VmM2I0ZmFiYTAzMjA5MGUxODhjYTA5NiIsInVzZXJfaWQiOjR9.nTYr6xtPHEpjsw1cYzvHHSJjrpvfoglEgLoIMwlOJAo",
#     "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwMTQwNTE2LCJpYXQiOjE3MTAxMzY5MTYsImp0aSI6Ijk0MjI3NTdiNmYzNTRjNWNiZjkxYmUxYjAwNDk4MDM2IiwidXNlcl9pZCI6NH0.fdTvk6KMhYWuYhdEI6K19E3JfujntHzHG5XRh0NpoBQ"
# }