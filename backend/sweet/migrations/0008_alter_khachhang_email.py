# Generated by Django 5.0.4 on 2024-07-17 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sweet', '0007_alter_khachhang_gioi_tinh'),
    ]

    operations = [
        migrations.AlterField(
            model_name='khachhang',
            name='email',
            field=models.EmailField(blank=True, max_length=254, null=True),
        ),
    ]
