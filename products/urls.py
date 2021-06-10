
from django.urls import path
from .views import FoodDetailView

urlpatterns = [
   path('/<int:food_id>',FoodDetailView.as_view())
]
