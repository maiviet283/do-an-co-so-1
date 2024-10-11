import React from 'react';
import './css/banner.css'
import img1 from './assets/img_1.png';
import img2 from './assets/img_2.png';
import img3 from './assets/img_3.png';
import toBottom from './assets/to_bottom.png';

function Banner({ isLoggedIn }) {
    return (
        <div id="banner">
            <div className="box-left">
                <h2>
                    <span>NƯỚC UỐNG</span>
                    <br />
                    <span>THƯỢNG HẠNG</span>
                </h2>
                <p>
                    Chuyên cung cấp các đồ uống đảm bảo dinh dưỡng hợp vệ sinh đến người dùng,
                    phục vụ người dùng một cách hoàn hảo nhất
                </p>
                {isLoggedIn && <button>Mua ngay</button>}
            </div>
            <div className="box-right">
                <img style={{ width:110 }} src={img1} alt="Thức ăn thượng hạng 1" />
                <img style={{ width:160 }} src={img2} alt="Thức ăn thượng hạng 2" />
                <img style={{ width:160 }} src={img3} alt="Thức ăn thượng hạng 3" />
            </div>
            <div className="to-bottom">
                <a href='#wp-products'>
                    <img src={toBottom} alt="Chuyển xuống dưới" />
                </a>
            </div>
        </div>
    );
}

export default Banner;
