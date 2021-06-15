from django.db import models

from users.models    import User

class Cart(models.Model):
    user    = models.ForeignKey(User, on_delete=models.CASCADE)
    options = models.ManyToManyField('products.Option', through='products.OptionItem')
   
    class Meta:
         db_table = 'carts'