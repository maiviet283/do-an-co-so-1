from .models import DoUong
from .serializers import *
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from .pagination import SixItemPagination
from django.contrib.auth import authenticate
from rest_framework.views import APIView

class DoUongViewSet(viewsets.ModelViewSet): # ok
    queryset = DoUong.objects.all()
    serializer_class = DoUongSerializer
    pagination_class = SixItemPagination

    @action(detail=True, methods=['patch'])
    def update_so_luong(self, request, pk=None):
        do_uong = self.get_object()
        serializer = DoUongUpdateSoLuongSerializer(do_uong, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class GETIDUKhachHang(viewsets.ReadOnlyModelViewSet): #ok
    queryset = KhachHang.objects.all()
    serializer_class = GetIDUKhachHangSerializer
    
class CreateKhachHang(viewsets.ModelViewSet): #ok
    queryset = KhachHang.objects.only('id', 'username')
    serializer_class = CreateKhachHangSerializer

    def create(self, request, *args, **kwargs):
        username = request.data.get('username')
        if KhachHang.objects.filter(username=username).exists():
            return Response({'error': 'Username đã tồn tại. Vui lòng chọn username khác.'}, status=status.HTTP_400_BAD_REQUEST)

        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            khach_hang = serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class LoginKhachHang(viewsets.ReadOnlyModelViewSet): #ok
    queryset = KhachHang.objects.all()
    serializer_class = LoginKhachHangSerializer

class ThongTinKhachHang(viewsets.ModelViewSet): #ok
    queryset = KhachHang.objects.all()
    serializer_class = KhachHangSerializer

class CapNhatMKKhachHang(viewsets.ModelViewSet): #ok
    queryset = KhachHang.objects.all()
    serializer_class = UpdatePassKhachHangSerializer

class GioHangViewSet(viewsets.ModelViewSet): #ok
    queryset = GioHang.objects.all()
    serializer_class = GioHangSerializer

class GioHangDoUongViewSet(viewsets.ModelViewSet): #ok
    queryset = GioHangDoUong.objects.all()
    serializer_class = GioHangDoUongSerializer

class ADDGioHangDoUongViewSet(viewsets.ModelViewSet): #ok
    queryset = GioHangDoUong.objects.all()
    serializer_class = AddGioHangDoUongSerializer

class UpdateSoLuongDoUongViewSet(viewsets.ModelViewSet):
    queryset = DoUong.objects.all()
    serializer_class = DoUongUpdateSoLuongSerializer