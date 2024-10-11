from django.contrib import admin
from django.utils.html import mark_safe
from .models import *

class AdminDoUong(admin.ModelAdmin):
    search_fields = ['id', 'ten', 'danh_muc__ten','don_gia','so_luong']
    list_filter = ['danh_muc__ten']
    readonly_fields = ["image"]
    list_display = ['id', 'ten', 'get_danh_muc', 'so_luong','don_gia','image']
    list_per_page = 5

    def image(self, do_uong):
        if do_uong.anh:
            return mark_safe(f"<img src='{do_uong.anh.url}' width='120px' height='80px' style='border-radius: 5px;' />")
        return "No Image"

    def get_danh_muc(self, obj):
        return ", ".join([danh_muc.ten for danh_muc in obj.danh_muc.all()])
    get_danh_muc.short_description = 'Danh Mục'

class AdminDanhMuc(admin.ModelAdmin):
    list_display = ['id', 'ten']
    search_fields = ['id', 'ten']

class AdminKhachHang(admin.ModelAdmin):
    search_fields = ['id', 'ten', 'tuoi', 'gioi_tinh', 'email', 'sdt', 'dia_chi', 'username']
    readonly_fields = ["image_kh"]
    def image_kh(self, khach_hang):
        if khach_hang.anh:
            return mark_safe(f"<img src='{khach_hang.anh.url}' width='120px' style='border-radius: 5px;' />")
        return "No Image"


admin.site.register(DanhMuc, AdminDanhMuc)
admin.site.register(DoUong, AdminDoUong)
admin.site.register(KhachHang, AdminKhachHang)
admin.site.register(GioHang)
admin.site.register(GioHangDoUong)
admin.site.register(ThanhToan)