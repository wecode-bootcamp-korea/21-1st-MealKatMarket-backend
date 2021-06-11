import json,re,jwt,bcrypt

from django.http import JsonResponse
from django.views      import View

from my_settings import SECRET_KEY, ALGORITHM
from .models     import User




# Create your views here.

class SignUpView(View):
    def post(self, request):
        try: 
            data               = json.loads(request.body)
            email_regax        = re.compile("^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{3,10})+$") 
            password_regax     = re.compile("^\.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$") #특수문자 / 문자 / 숫자 포함 형태의 8~20자리 이내의 암호 정규식
            name_regax         = re.compile("^[ㄱ-힣]{2,4}|[a-zA-Z]{2,10}$")
            phone_number_regax = re.compile("\d{3}-\d{4}-\d{4}")
            hashed_password    = bcrypt.hashpw(data['password'].encode('utf-8'),bcrypt.gensalt())

            if data['email'] == '' or data['password'] == '' or data['name'] == ''or data['phone_number'] == '':
                return JsonResponse({'message': 'KEY_ERROR'}, status=400)

            if not re.match(email_regax, data['email']):
                return JsonResponse({"message":"올바른 이메일 형식이 아닙니다."}, status=400)

            if User.objects.filter(email=data['email']):
                return JsonResponse({"message":"중복된 이메일 입니다."}, status=401)

            if not re.match(password_regax, data['password']):
                return JsonResponse({"message":"올바른 비밀번호 형식이 아닙니다."}, status=400)

            if User.objects.filter(email=data['password']):
                return JsonResponse({"message":"중복된 비밀번호 입니다."}, status=401)

            if len(data['password']) < 8 :
                return JsonResponse({"message":"8자리 이상 입력해 주세요."}, status=400)

            if not re.match(name_regax, data['name']):
                return JsonResponse({"message":"올바른 이름 형식이 아닙니다."}, status=400)

            if not re.match(phone_number_regax, data['phone_number']):
                return JsonResponse({"message":"올바른 휴대전화 형식이 아닙니다."}, status=400)

            User.objects.create(
            email        = data['email'],
            password     = hashed_password.decode('utf-8'), 
            name         = data['name'],
            phone_number = data['phone_number']
            )
            return JsonResponse({'message':'SUCCESS'}, status = 201)

        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status = 400)
        except User.DoesNotExist:
            return JsonResponse({'message':'INVALID_USER'}, status = 400)


class SignInView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            users = User.objects.get(email = data['email'])

            if bcrypt.checkpw(data['password'].encode('utf-8'),users.password.encode('utf-8')):
                acess_token = jwt.encode({'id':users.id}, SECRET_KEY, ALGORITHM)

                return JsonResponse({'token':acess_token}, status = 200)
            else:
                return JsonResponse({'message':'INVALID_PASSWORD'}, status = 401)

        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status = 400)
        except User.DoesNotExist:
            return JsonResponse({'message':'INVALID_USER'}, status = 400)



 