from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import NotFound, ParseError
from .serializers import MyInfoUserSerializer
from django.contrib.auth.password_validation import validate_password
from rest_framework.authentication import TokenAuthentication # 사용자 인증
from rest_framework.permissions import IsAuthenticated  # 권한 부여

# Create your views here.

# api/v1/users [POST] > 유저 생성 API
class Users(APIView):
    def post(self, request):
        # password > 검증을 해야하고, 해쉬화해서 저장
        # the other > 비밀번호 외 다른 데이터

        password = request.data.get('password')
        serializer = MyInfoUserSerializer(data=request.data)

        try:
            validate_password(password)
        except:
            raise ParseError("Invalid password")
        
        if serializer.is_valid():
            user = serializer.save()    # 새로운 유저를 생성
            user.set_password(password) # 비밀번호 해쉬화
            user.save()                 # 데이터 저장

            serializer = MyInfoUserSerializer(user)
            return Response(serializer.data)
        else:
            raise ParseError(serializer.errors)
        
# api/v1/users/myinfo [GET, PUT]
class MyInfo(APIView):
        authentication_classes = [TokenAuthentication]
        permission_classes = [IsAuthenticated]
        
        def get(self, request):
             user = request.user
             serializer = MyInfoUserSerializer(user)

             return Response(serializer.data)
        
        def put(self, request):
             user = request.user
             serializer = MyInfoUserSerializer(user,
                                               data=request.data,
                                               partial=True)
             if serializer.is_valid():  # < 데이터가 들어왔나 체크
                  user = serializer.save()
                  serializer = MyInfoUserSerializer(user)
                  
                  return Response(serializer.data)
             else:
                  return Response(serializer.errors)
                  
