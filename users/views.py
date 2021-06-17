import json,re,jwt,bcrypt

from django.http import JsonResponse
from django.views      import View

from my_settings import SECRET_KEY, ALGORITHM
from .models     import User

class SignUpView(View):
    def post(self, request):
        try: 
            data                = json.loads(request.body)
            EMAIL_REGAX         = "^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{3,10})+$" 
            PASSWORD_REGAX      = "^\.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$" #특수문자 / 문자 / 숫자 포함 형태의 8~20자리 이내의 암호 정규식
            NAME_REGAX          = "^[ㄱ-힣]{2,4}|[a-zA-Z]{2,10}$"
            PHONE_NUMBER_REGAX  = "\d{3}-\d{4}-\d{4}"
            hashed_password     = bcrypt.hashpw(data['password'].encode('utf-8'),bcrypt.gensalt())

            if not re.match(EMAIL_REGAX, data['email']):
                return JsonResponse({"message":"INVALID_EMAIL"}, status=400)
            
            if len(data['password']) < 8 and not re.match(PASSWORD_REGAX, data['password']):
                return JsonResponse({"message":"INVALID_PASSWORD"}, status=400)

            if not re.match(NAME_REGAX, data['name']):
                return JsonResponse({"message":"INVALID_NAME"}, status=400)

            if not re.match(PHONE_NUMBER_REGAX, data['phone_number']):
                return JsonResponse({"message":"INVALID_PHONE_NUMBER"}, status=400)

            if User.objects.filter(email=data['email']):
                return JsonResponse({"message":"DUPLICATED_EMAIL"}, status=401)

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
                access_token = jwt.encode({'id':users.id}, SECRET_KEY, ALGORITHM)

                result = {
                    'message' : 'SUCCESS',
                    'access_token':access_token
                }

                return JsonResponse(result, status = 200)
            else:
                return JsonResponse({'message':'INVALID_PASSWORD'}, status = 401)

        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status = 400)
        except User.DoesNotExist:
            return JsonResponse({'message':'INVALID_USER'}, status = 400) 
