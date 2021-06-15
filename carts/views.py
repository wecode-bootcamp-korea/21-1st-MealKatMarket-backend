import json
import jwt

from django.http      import JsonResponse
from django.views     import View
from django.db.models import Q

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

        for food_data in data:
            
            food_count = 0

            if Cart.objects.filter(
                Q(user        = users[2])&
                Q(option_type = food_data['option_type'])&
                Q(option_id   = food_data['option_id'])).exists():

                food = Cart.objects.get(
                    Q(user        = users[2])&
                    Q(option_type = food_data['option_type'])&
                    Q(option_id   = food_data['option_id']))
                food_count = food.count

            Cart.objects.update_or_create(
            # user        = decode_password(request.headers['token']),
                user        = users[2],
                option_type = food_data['option_type'],
                option_id   = food_data['option_id'],
                defaults    = {"count" : food_data['count'] + food_count})
            
        return JsonResponse({'message':'SUCCESS'}, status=201)
