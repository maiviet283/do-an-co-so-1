# Generated by Django 5.0.4 on 2024-07-17 08:13

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sweet', '0005_remove_giohang_do_uong_remove_giohang_giam_gia_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='khachhang',
            name='ten',
            field=models.CharField(blank=True, max_length=128, null=True),
        ),
        migrations.AlterField(
            model_name='khachhang',
            name='tuoi',
            field=models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(0)]),
        ),
    ]
