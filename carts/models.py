from django.db import models

class Cart(models.Model):
    user_id     = models.IntegerField()
    option_type = models.CharField(max_length=45)
    option_id   = models.IntegerField()
    count       = models.IntegerField()

    class Meta:
        db_table = 'carts'