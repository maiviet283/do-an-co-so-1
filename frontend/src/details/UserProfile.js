import React from 'react';

function UserProfile({ account, getSexLabel }) {
    return (
        <div className="details-content">
            <img className="img-details" src={account.anh || 'default-image.png'} alt={account.ten} />
            <div className="info">
                <h2 className="h2-details">{account.ten}</h2>
                <ul className="info-list">
                    <li><strong>Username :</strong> {account.username}</li>
                    <li><strong>Mật Khẩu :</strong> {account.password}</li>
                    <li><strong>Tuổi : </strong> {account.tuoi}</li>
                    <li><strong>Giới Tính : </strong> {getSexLabel(account.gioi_tinh)}</li>
                    <li><strong>Email : </strong> {account.email}</li>
                    <li><strong>Số Điện Thoại : </strong> {account.sdt}</li>
                    <li><strong>Địa Chỉ : </strong> {account.dia_chi}</li>
                </ul>
            </div>
        </div>
    );
}

export default UserProfile;
