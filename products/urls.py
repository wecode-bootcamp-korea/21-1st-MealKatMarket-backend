from django.urls import path

from .views import FoodView, SearchView

urlpatterns = [
   path('<int:food_id>',FoodView.as_view()),
   path('/search',SearchView.as_view())
]