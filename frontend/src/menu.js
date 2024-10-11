import React from 'react';
import './css/menu.css';
import logo from './assets/logoquan.png';
import user from './assets/user.png';
import { Link } from 'react-router-dom';
import cart from './assets/cart.png';

function Menu({ isLoggedIn, username }) {
    return (
        <div id="header">
            <Link to="/" className="logo">
                <img src={logo} alt="" id="logoquan" />
            </Link>
            <div id="menu">
                <div className="item">
                    <Link to="/">Trang chủ</Link>
                </div>
                <div className="item">
                    <a href="#spcct">Sản phẩm</a>
                </div>
                <div className="item">
                    <a href="#header">Blog</a>
                </div>
                {isLoggedIn && (
                    <div className="item">
                        <a href="#footer">Liên hệ</a>
                    </div>
                )}
            </div>
            <div id="actions">
                <div>
                    <h3>{username}</h3>
                </div>
                <div className="item">
                    <Link to={isLoggedIn ? "/details" : "/login"}>
                        <img src={user} alt="User" />
                    </Link>
                </div>
                {isLoggedIn && (
                    <div className="item">
                        <Link to={"/cart"}>
                            <img src={cart} alt="Cart" />
                        </Link>
                    </div>
                )}
            </div>
        </div>
    );
}

export default Menu;
