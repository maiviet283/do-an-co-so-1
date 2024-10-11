import React, { useState } from 'react';
import './css/register.css'; // Import file CSS
import { Link, useNavigate } from 'react-router-dom';


function Register() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    username: '',
    sdt: '',
    email: '',
    password: '',
  });

  const [usernamePlaceholder, setUsernamePlaceholder] = useState('Nhập Tên Đăng Nhập');

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // Kiểm tra xem username có tồn tại không
      const checkResponse = await fetch('http://localhost:8000/sweet/get/username/');
      const existingUsers = await checkResponse.json();

      const usernameExists = existingUsers.some(user => user.username === formData.username);

      if (usernameExists) {
        setFormData({ ...formData, username: '' });
        setUsernamePlaceholder('Username đã được sử dụng');
        return;
      }

      // Nếu username không tồn tại, tiến hành đăng ký
      const response = await fetch('http://localhost:8000/sweet/register/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      const data = await response.json();

      if (!response.ok) {
        setFormData({ ...formData, username: '' });
        setUsernamePlaceholder('Username đã được sử dụng');
        return;
      }

      console.log('Registration successful:', data);
      // Có thể điều hướng đến trang khác hoặc thông báo cho người dùng
      navigate('/login');
    } catch (error) {
      console.error('Error:', error);
      setFormData({ ...formData, username: '' });
      setUsernamePlaceholder('Username đã được sử dụng');
    }
  };

  return (
    <div className="register-container">
      <h2 id="title-register">Đăng Ký Tài Khoản</h2>
      <form onSubmit={handleSubmit}>
        <div className="input-group">
          <div className="input-field">
            <label>Username</label>
            <input
              type="text"
              name="username"
              value={formData.username}
              onChange={handleChange}
              required
              id="username-register"
              placeholder={usernamePlaceholder}
            />
          </div>
          <div className="input-field">
            <label>Số Điện Thoại</label>
            <input
              type="text"
              name="sdt"
              value={formData.sdt}
              onChange={handleChange}
              required
              id="phone-register"
              placeholder='Nhập Số Điện Thoại'
            />
          </div>
        </div>
        <div className="input-group">
          <div className="input-field">
            <label>Email</label>
            <input
              type="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              required
              id="email-register"
              placeholder='Nhập Địa Chỉ Email'
            />
          </div>
          <div className="input-field">
            <label>Password</label>
            <input
              type="password"
              name="password"
              value={formData.password}
              onChange={handleChange}
              required
              id="password-register"
              placeholder='Nhập Mật Khẩu'
            />
          </div>
        </div>
        <button id="submit-register" type="submit">Đăng Ký</button>
        <center style={{ marginTop: 15 }}>
          <Link className="no-underline-login" to={"/login"}>Đăng Nhập Tài Khoản</Link>
        </center>
      </form>
    </div>
  );
}

export default Register;
