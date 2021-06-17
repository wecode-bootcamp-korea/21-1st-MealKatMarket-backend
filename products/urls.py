from django.urls import path

from .views import FoodView, SearchView,FoodlistView

urlpatterns = [
    path('', SearchView.as_view()),
    path('', FoodlistView.as_view()),
    path('/<int:food_id>',FoodView.as_view())
]