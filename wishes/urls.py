from django.urls import path

from .views import WishView

urlpatterns = [
   path('',WishView.as_view())
]
