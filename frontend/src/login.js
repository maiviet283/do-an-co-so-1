import React, { useState, useEffect } from 'react';
import './css/login.css';
import { Link, useNavigate } from 'react-router-dom';

function Login({ onLoginSuccess }) {
  const navigate = useNavigate();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const [dataLogin, setDataLogin] = useState([]);

  useEffect(() => {
    document.title = 'Đăng Nhập Tài Khoản';
  }, []);

  useEffect(() => {
    fetch('http://localhost:8000/sweet/login/')
      .then(res => res.json())
      .then(data => {
        setDataLogin(data);
      });
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const foundUser = dataLogin.find(item =>
      item.username === username && item.password === password
    );

    if (foundUser) {
      setErrorMessage('');
      onLoginSuccess(foundUser);
      navigate('/');
    } else {
      setErrorMessage('Tên đăng nhập hoặc mật khẩu không đúng');
    }
  };

  return (
    <div id='login-container'>
      <h2 id='title-login'>Đăng nhập</h2>
      {errorMessage && <p style={{ color: 'red', marginBottom: 10 }}>{errorMessage}</p>}
      <form id='form-login' onSubmit={handleSubmit}>
        <div id='username-container-login'>
          <label htmlFor='username-login'>Username</label>
          <input
            type="text"
            id='username-login'
            name="username"
            required
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>
        <div id='password-container-login'>
          <label htmlFor='password-login'>Password</label>
          <input
            type="password"
            id='password-login'
            name="password"
            required
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <button id='submit-login' type="submit">Đăng nhập</button>
        <center style={{ marginTop: 10 }}>
          <Link className="no-underline-login" to={"/register"}>Đăng Ký Tài Khoản</Link>
        </center>
      </form>
    </div>
  );
}

export default Login;
