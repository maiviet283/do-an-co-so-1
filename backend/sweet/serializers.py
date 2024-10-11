from .models import *
from rest_framework import serializers

# lấy thông tin đồ uống
class DoUongSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoUong
        fields = ['id', 'ten', 'anh', 'thong_tin', 'danh_muc', 'so_luong', 'don_gia']

# lấy số lượng đồ uống hiện tại
class DoUongUpdateSoLuongSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoUong
        fields = ['id','so_luong']

# lấy Username của toàn bộ khách hàng
class GetIDUKhachHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = KhachHang
        fields = ['username']

# tạo khách hàng : Register
class CreateKhachHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = KhachHang
        fields = ['id','email','sdt','username','password']

# đăng nhập vào hệ thống
class LoginKhachHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = KhachHang
        fields = ['id','username','password']

# lấy Toàn Bộ Thông Tin Khách Hàng
class KhachHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = KhachHang
        fields = '__all__'

# thay đổi mật khẩu Khách Hàng
class UpdatePassKhachHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = KhachHang
        fields = ['id','password']


class GioHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = GioHang
        fields = '__all__'

class DoUongTrongGioHangSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoUong
        fields = ['id','ten','anh','so_luong','don_gia']

class GioHangDoUongSerializer(serializers.ModelSerializer):
    do_uong = DoUongTrongGioHangSerializer()
    gio_hang = GioHangSerializer()

    class Meta:
        model = GioHangDoUong
        fields = ['id','gio_hang','so_luong', 'do_uong']

class AddGioHangDoUongSerializer(serializers.ModelSerializer):
    class Meta:
        model = GioHangDoUong
        fields = '__all__'