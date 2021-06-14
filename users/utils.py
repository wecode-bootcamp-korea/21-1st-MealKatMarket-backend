import json,jwt,requests

from django.http  import JsonResponse 

from my_settings  import ALGORITHM, SECRET_KEY
from .models import User

def login_decorator(func):
    def wrapper(self, request):
        try:
            acess_token    = request.headers.get('Authorization', None)
            amount         = jwt.decode(acess_token,SECRET_KEY,ALGORITHM)
            users          = User.objects.get(email=amount['id'])
            request.users  = users

        except jwt.DecodeError:
            return JsonResponse({'message' :'INVALID_TOKEN'}, status=400)

        except User.DoesNotExist:                                           
            return JsonResponse({'message' : 'INVALID_USER'}, status=400)

        return func(self, request)

    return wrapper

