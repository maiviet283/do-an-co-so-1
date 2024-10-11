# Generated by Django 5.0.4 on 2024-07-16 05:49

import ckeditor_uploader.fields
import django.core.validators
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sweet', '0004_alter_giohang_do_uong_alter_giohang_so_luong_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='giohang',
            name='do_uong',
        ),
        migrations.RemoveField(
            model_name='giohang',
            name='giam_gia',
        ),
        migrations.RemoveField(
            model_name='giohang',
            name='so_luong',
        ),
        migrations.RemoveField(
            model_name='giohang',
            name='tong_tien',
        ),
        migrations.RemoveField(
            model_name='khachhang',
            name='gio_hang',
        ),
        migrations.AddField(
            model_name='giohang',
            name='khach_hang',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='gio_hang', to='sweet.khachhang'),
        ),
        migrations.AlterField(
            model_name='danhmuc',
            name='thong_tin',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='douong',
            name='thong_tin',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='thanhtoan',
            name='khach_hang',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='thanh_toans', to='sweet.khachhang'),
        ),
        migrations.CreateModel(
            name='GioHangDoUong',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('so_luong', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('giam_gia', models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(0)])),
                ('do_uong', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='sweet.douong')),
                ('gio_hang', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sweet.giohang')),
            ],
        ),
        migrations.AddField(
            model_name='giohang',
            name='do_uongs',
            field=models.ManyToManyField(blank=True, through='sweet.GioHangDoUong', to='sweet.douong'),
        ),
    ]
