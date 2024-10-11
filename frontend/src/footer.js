import React from 'react';
import './css/footer.css'
import logo from './assets/avatar_1.png';

function QuickMenuItem({ path, label }) {
    return (
        <div className="item">
            <a href={path}>{label}</a>
        </div>
    );
}

function Footer({ isLoggedIn }) {
    return (
        <div id="footer">
            <div className="box">
                <div className="logo">
                    <img id='avatar-1-png-fo' src={logo} alt="Logo" />
                </div>
                <p>Cung cấp sản phẩm với chất lượng an toàn cho quý khách</p>
            </div>
            <div className="box">
                <h3>NỘI DUNG</h3>
                <ul className="quick-menu">
                    <QuickMenuItem path="#header" label="Trang chủ" />
                    <QuickMenuItem path="#spcct" label="Sản phẩm" />
                    <QuickMenuItem path="/#header" label="Blog" />
                    {isLoggedIn && <QuickMenuItem path="/#footer" label="Liên hệ" />}
                </ul>
            </div>
            {isLoggedIn && (
                <div className="box">
                    <h3>LIÊN HỆ</h3>
                    <form action="">
                        <input type="text" placeholder="Địa chỉ email" />
                        <button type="submit">Nhận tin</button>
                    </form>
                </div>
            )}
        </div>
    );
}

export default Footer;
