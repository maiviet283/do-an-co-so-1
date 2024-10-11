import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Menu from "./menu";
import Banner from "./banner";
import Products from "./product";
import SaleOff from "./saleoff";
import Comment from "./comment";
import Footer from "./footer";
import Cart from "./cart";
import Login from "./login";
import Register from "./register";
import Details from './details';
import './App.css';

function App() {
  document.title = "Trang Chủ"
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [username, setUsername] = useState('');
  const [id,setID] = useState('')

  useEffect(() => {
    const storedId = sessionStorage.getItem('id');
    const storedUsername = sessionStorage.getItem('username');
    const storedStatus = sessionStorage.getItem('isLoggedIn');

    if (storedStatus === 'true' && storedId && storedUsername) {
      setIsLoggedIn(true);
      setUsername(storedUsername);
    } else {
      setIsLoggedIn(false);
      setID('')
      setUsername('');
    }
  }, []);

  const handleLoginSuccess = (user) => {
    setIsLoggedIn(true);
    setUsername(user.username);
    setID(user.id)
    sessionStorage.setItem('id', user.id);
    sessionStorage.setItem('username', user.username);
    sessionStorage.setItem('isLoggedIn', 'true');
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
    setUsername('');
    setID('')
    sessionStorage.removeItem('id');
    sessionStorage.removeItem('username');
    sessionStorage.removeItem('isLoggedIn');
  };

  return (
    <Router>
      <div id="wrapper">
        <Menu isLoggedIn={isLoggedIn} username={username} />
        <Routes>
          <Route
            path="/"
            element={<><Banner isLoggedIn={isLoggedIn} /><Products isLoggedIn={isLoggedIn} /><SaleOff /><Comment /></>}
          />
          <Route path="/cart" element={<Cart />} />
          <Route
            path="/login"
            element={<Login onLoginSuccess={handleLoginSuccess} />}
          />
          <Route
            path='/details'
            element={<Details onLogout={handleLogout} id={id}/>}
          />
          <Route path="/register" element={<Register />} />
        </Routes>
        <Footer isLoggedIn={isLoggedIn} />
      </div>
    </Router>
  );
}

export default App;
