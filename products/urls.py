from django.urls import path

<<<<<<< HEAD
from .views import FoodView, SearchView

urlpatterns = [
   path('<int:food_id>',FoodView.as_view()),
   path('', SearchView.as_view())
=======
from .views import FoodlistView,FoodView

urlpatterns = [
    path('', FoodlistView.as_view()),
    path('/<int:food_id>',FoodView.as_view())
>>>>>>> main
]