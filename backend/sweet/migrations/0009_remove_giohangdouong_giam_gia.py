# Generated by Django 5.0.4 on 2024-07-20 13:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('sweet', '0008_alter_khachhang_email'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='giohangdouong',
            name='giam_gia',
        ),
    ]
