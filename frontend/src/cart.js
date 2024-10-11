import React, { useEffect, useState, useCallback } from 'react';
import './css/cart.css';
import { handleDeleteProduct, handleAddProduct } from './logicCart';

function Cart() {
  document.title = 'Giỏ Hàng';
  const [cartData, setCartData] = useState([]);
  const [tongTien, setTongTien] = useState(0);
  const [showModal, setShowModal] = useState(false);
  const id_khach_hang = Number(sessionStorage.getItem('id'));

  const loadCartData = useCallback(() => {
    fetch('http://127.0.0.1:8000/sweet/giohangdouong/')
      .then(res => res.json())
      .then(data => {
        const dataPrD = data.filter(item => item.gio_hang.id === id_khach_hang);
        setCartData(dataPrD);
      })
      .catch(error => {
        console.log('Lỗi khi lấy dữ liệu:', error);
      });
  }, [id_khach_hang]);

  useEffect(() => {
    loadCartData();
  }, [loadCartData]);

  useEffect(() => {
    const total = cartData.reduce((acc, item) => acc + item.so_luong * item.do_uong.don_gia, 0);
    setTongTien(total);
  }, [cartData]);

  const handleMuaNgay = () => {
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
  };

  const handleOk = () => {
    setShowModal(false);
  };

  return (
    <div className="cart-container">
      <h2 className="cart-title">Giỏ hàng của bạn</h2>
      <button id='lsmh'>Lịch Sử Mua Hàng</button>
      <ul className="cart-list">
        {cartData.map(item => (
          <li key={item.do_uong.id} className="cart-item">
            <img
              src={item.do_uong.anh}
              alt={item.do_uong.ten}
              className="cart-item-image"
            />
            <div className="cart-item-info">
              <h3 className="cart-item-title">{item.do_uong.ten}</h3>
              <p className="cart-item-quantity">Số Lượng Bạn Đã Thêm: {item.so_luong}</p>
              <p className="cart-item-quantity">Số Lượng Trong Kho: {item.do_uong.so_luong}</p>
              <p className="cart-item-price">Đơn Giá: {item.do_uong.don_gia.toLocaleString()} VNĐ</p>
            </div>
            <div>
              <button className='add-one-product-cart' onClick={() => handleAddProduct(item.gio_hang.id, item.do_uong, loadCartData)}>+</button>
              <button className='add-one-product-cart' onClick={() => handleDeleteProduct(item.gio_hang.id, item.do_uong, loadCartData)}>-</button><br />
              <button className='del-one-product-cart'>Xóa Sản Phẩm</button>
            </div>
          </li>
        ))}
      </ul>
      <div className="cart-total">
        <h3>Tổng tiền: {tongTien.toLocaleString()} VNĐ</h3>
      </div>
      
      <button style={{ marginLeft: 800 }} onClick={handleMuaNgay} className="button-details">Mua Ngay</button>
      {showModal && (
        <div className="modal-tb-cart-mn">
          <div className="modal-content-tb-cart-mn">
            <h2 className="modal-title-tb-cart-mn">Xác Nhận Đơn Hàng và Đặt Hàng</h2>
            <table className="modal-table-tb-cart-mn">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Tên Đơn Hàng</th>
                  <th>Số Lượng</th>
                  <th>Đơn Giá</th>
                  <th>Giá Thành</th>
                </tr>
              </thead>
              <tbody>
                {cartData.map((item, index) => (
                  <tr key={item.do_uong.id}>
                    <td>{index + 1}</td>
                    <td>{item.do_uong.ten}</td>
                    <td>{item.so_luong}</td>
                    <td>{item.do_uong.don_gia.toLocaleString()} VNĐ</td>
                    <td>{(item.so_luong * item.do_uong.don_gia).toLocaleString()} VNĐ</td>
                  </tr>
                ))}
              </tbody>
            </table>
            <h2 className="modal-total-tb-cart-mn">{tongTien.toLocaleString()} VNĐ</h2>
            <button className='btn-tb-cart-mn' onClick={handleOk}>OK</button>
            <button className='btn-tb-cart-mn' onClick={handleCloseModal}>Hủy</button>
          </div>
        </div>
      )}
    </div>
  );
}

export default Cart;
