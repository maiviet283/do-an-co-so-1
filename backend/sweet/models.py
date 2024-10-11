from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.core.validators import MinValueValidator

class DanhMuc(models.Model):
    ten = models.CharField(max_length=64, unique=True)
    thong_tin = RichTextUploadingField(blank=True, null=True)

    def __str__(self):
        return self.ten


class DoUong(models.Model):
    ten = models.CharField(max_length=64, unique=True)
    anh = models.ImageField(upload_to='do_uong/%Y/%m', blank=True, null=True)
    thong_tin = RichTextUploadingField(blank=True, null=True)
    danh_muc = models.ManyToManyField(DanhMuc, blank=True)
    so_luong = models.IntegerField(validators=[MinValueValidator(0)])
    don_gia = models.IntegerField(validators=[MinValueValidator(0)])

    def __str__(self):
        return self.ten


class GioHang(models.Model):
    khach_hang = models.OneToOneField('KhachHang', on_delete=models.CASCADE, related_name='gio_hang',blank=True, null=True)
    do_uongs = models.ManyToManyField(DoUong, through='GioHangDoUong', blank=True)

    def __str__(self):
        return f"ID : {self.id} Giỏ hàng của {self.khach_hang.ten} - ID : {self.khach_hang.id}"


class GioHangDoUong(models.Model):
    gio_hang = models.ForeignKey(GioHang, on_delete=models.CASCADE)
    do_uong = models.ForeignKey(DoUong, on_delete=models.PROTECT)
    so_luong = models.IntegerField(validators=[MinValueValidator(1)])

    @property
    def tong_tien(self):
        return self.so_luong * self.do_uong.don_gia

    def __str__(self):
        return f"ID : {self.id} - {self.do_uong.ten} ({self.so_luong}) - (ID:{self.gio_hang.khach_hang.id}) - Tong Tien : {self.tong_tien} VNĐ"


class KhachHang(models.Model):
    choices_sex = (
        ('M', 'Nam'),
        ('F', 'Nữ'),
        ('O', 'Khác')
    )

    anh = models.ImageField(upload_to='khach_hang/%Y/%m', blank=True, null=True)
    ten = models.CharField(max_length=128,blank=True, null=True)
    tuoi = models.IntegerField(validators=[MinValueValidator(0)],blank=True, null=True)
    gioi_tinh = models.CharField(max_length=1, choices=choices_sex,blank=True, null=True)
    email = models.EmailField(blank=True, null=True)
    sdt = models.CharField(max_length=12, blank=True, null=True)
    dia_chi = models.CharField(max_length=128, blank=True, null=True)
    username = models.CharField(max_length=64, unique=True)
    password = models.CharField(max_length=64)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if not hasattr(self, 'gio_hang'):
            GioHang.objects.create(khach_hang=self)

    def __str__(self):
        return f"{self.ten} ({self.tuoi} tuổi) - USERNAME : {self.username}"


class ThanhToan(models.Model):
    khach_hang = models.ForeignKey(KhachHang, on_delete=models.PROTECT, related_name='thanh_toans')
    do_uong = models.ForeignKey(DoUong, on_delete=models.PROTECT)
    ngay_mua = models.DateField(auto_now_add=True)
    trang_thai = models.BooleanField(default=True)
    tong_tien = models.IntegerField(validators=[MinValueValidator(0)])

    def __str__(self):
        return f"{self.khach_hang.ten} (Tổng Tiền {self.tong_tien}) - (Trạng Thái {'Đã Thanh Toán' if self.trang_thai else 'Chưa Thanh Toán'})"
