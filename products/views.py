from django.http      import JsonResponse
from django.views     import View
from django.db.models import Q

from .models import Food

class FoodlistView(View):
    def get(self, request):
        category_id = request.GET.get('categoryId')
        sort        = request.GET.get('sort','?')
        page        = int(request.GET.get("page",1))

        page_size = 10
        limit     = int(page_size * page)
        offset    = int(limit - page_size)

        q = Q()

        if category_id:
            q = Q(categories__id=category_id)

        foods = Food.objects.filter(q).order_by(sort)[offset:limit]
        
        result = [{
            'id'               : food.id,
            'img_url'          : food.foodimage_set.first().image_url,
            'name'             : food.name,
            'price'            : food.price,
            'discount'         : food.discount,
            'discounted_price' : food.discounted_price,
            'star_score'       : food.star_score,
            'review_count'     : food.review_count,
            'create_at'        : food.create_at,
            'sale_status'      : (True if food.discount > 0 else False)
        }for food in foods]

        return JsonResponse({'result' : result}, status=200)