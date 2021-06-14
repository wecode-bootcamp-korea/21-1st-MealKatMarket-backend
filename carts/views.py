import json
import jwt

from django.http  import JsonResponse
from django.views import View

from .models         import Cart
from users.models    import User
from products.models import Food, RequiredOption, SelectOption
from my_settings     import SECRET_KEY

def decorator_decode():
    def decode_password(token):
        decoded_token = jwt.decode(token,SECRET_KEY, algorithms='HS256')

        return decoded_token['id']

class CartView(View):
    def post(self, request):
        data = json.loads(request.body)
        
        #임시 id 객체 가져오기
        users = User.objects.all()

        for food in data:
            cart = Cart(
                # user        = decode_password(request.headers['token']),
                user        = users[2],
                option_type = food['option_type'],
                option_id   = food['option_id'],
                count       = food['count']
            )
            cart.save()

        return JsonResponse({'message':'SUCCESS'}, status=201)
