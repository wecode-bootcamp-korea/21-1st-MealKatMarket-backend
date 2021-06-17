import csv
import os
import django
from decimal import Decimal

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mealkatmarket.settings")
django.setup()

from products.models import Food, Category, CategoryFood, FoodImage, RequiredOption, SelectOption


def foodupload():
    CSV_PATH_PRODUCTS = './foods.csv'
    with open(CSV_PATH_PRODUCTS) as in_file:
        data_reader = csv.reader(in_file)
        next(data_reader,None)

        for row in data_reader:
            name1 = row[1]
            price1 = Decimal(row[2].replace(',',''))

            if row[3] == '':
                row[3] = 0

            discount1 = row[3]
            discounted_price1 = Decimal(row[4].replace(',',''))
            star_score1 = Decimal(row[5].replace(',',''))
            review_count1 = row[6].replace(',','')
            detail_image1 = row[7]

            Food.objects.create(
                name = name1,
                price = price1,
                discount = discount1,
                discounted_price = discounted_price1,
                star_score = star_score1,
                review_count = review_count1,
                detail_image = detail_image1
            )
def categoryupload():
    CSV_PATH_PRODUCTS = './categories.csv'
    with open(CSV_PATH_PRODUCTS) as in_file:
        data_reader = csv.reader(in_file)
        next(data_reader,None)

        for row in data_reader:
            id = row[0]
            name = row[1]

            Category.objects.create(id = id, category_name = name)

def categoryfoodupload():
    CSV_PATH_PRODUCTS = './categoriesfoods.csv'
    with open(CSV_PATH_PRODUCTS) as in_file:
        data_reader = csv.reader(in_file)
        next(data_reader,None)

        for row in data_reader:
            food = Food.objects.get(id=int(row[2]))
            category = Category.objects.get(id=int(row[1]))

            CategoryFood.objects.create(food = food, category = category)

def foodimageupload():
    CSV_PATH_PRODUCTS = './food_images.csv'
    with open(CSV_PATH_PRODUCTS) as in_file:
        data_reader = csv.reader(in_file)
        next(data_reader,None)

        for row in data_reader:
            food = Food.objects.get(id=int(row[1]))
            image = row[2]

            FoodImage.objects.create(food = food, image_url=image )

def requiredfoodupload():
    CSV_PATH_PRODUCTS = './required_options.csv'
    with open(CSV_PATH_PRODUCTS) as in_file:
        data_reader = csv.reader(in_file)
        next(data_reader,None)

        for row in data_reader:
            food = Food.objects.get(id=int(row[1]))
            name = row[2]
            price = Decimal(row[3])
            quantity = int(row[4])

            RequiredOption.objects.create(food=food, name=name, price=price, quantity=quantity)

def selectfoodupload():
    CSV_PATH_PRODUCTS = './select_options.csv'
    with open(CSV_PATH_PRODUCTS) as in_file:
        data_reader = csv.reader(in_file)
        next(data_reader,None)

        for row in data_reader:
            food = Food.objects.get(id=int(row[1]))
            name = row[2]
            price = Decimal(row[3])
            quantity = int(row[4])

            SelectOption.objects.create(food=food, name=name, price=price, quantity=quantity)