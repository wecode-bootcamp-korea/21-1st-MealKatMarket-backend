from django.urls import path
from .views import FoodAllView, FoodlistView,FoodView,WishFoodView,SearchView

urlpatterns = [
    path('', FoodlistView.as_view()),
    path('/<int:food_id>',FoodView.as_view()),
    path('/search', SearchView.as_view()),
    path('/all', FoodAllView.as_view()),
    path('/wish/<int:food_id>',WishFoodView.as_view())
]