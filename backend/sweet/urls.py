from django.urls import path, include
from .views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('douong', DoUongViewSet, basename='douong')
router.register('get/username', GETIDUKhachHang, basename='get-username')
router.register('register', CreateKhachHang, basename='register') 
router.register('login', LoginKhachHang, basename='login')
router.register('details', ThongTinKhachHang, basename='details')
router.register('update/password', CapNhatMKKhachHang, basename='update-password')
router.register('giohang', GioHangViewSet, basename='giohang')
router.register('giohangdouong', GioHangDoUongViewSet, basename='giohangdouong')
router.register('addgiohangdouong', ADDGioHangDoUongViewSet, basename='addgiohangdouong')
router.register('update/soluongdoduong', UpdateSoLuongDoUongViewSet, basename='updatesoluongdoduong')

urlpatterns = [
    path('', include(router.urls)),
]
