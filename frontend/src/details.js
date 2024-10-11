import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './css/details.css';
import UserProfile from './details/UserProfile';
import UpdatePass from './details/updatePass';
import UpdateUser from './details/updateUser'; // Import component UpdateUser

function Details({ onLogout }) {
    document.title = "Thông Tin của Bạn";
    const navigate = useNavigate();
    const [account, setAccount] = useState(null);
    const [isUpdating, setIsUpdating] = useState(null); // null, 'pass', or 'user'

    const id = parseInt(sessionStorage.getItem('id'), 10);

    const handleLogout = () => {
        if (typeof onLogout === 'function') {
            sessionStorage.removeItem('id');
            sessionStorage.removeItem('username');
            sessionStorage.removeItem('isLoggedIn');
            onLogout();
            navigate('/');
        } else {
            console.error('onLogout is not a function');
        }
    };

    useEffect(() => {
        if (id) {
            fetch('http://localhost:8000/sweet/details/')
                .then(res => res.json())
                .then(data => {
                    const accountData = data.find(account => account.id === id);
                    if (accountData) {
                        setAccount(accountData);
                    } else {
                        navigate('/login');
                    }
                })
                .catch(error => console.error('Error fetching data:', error));
        } else {
            navigate('/login');
        }
    }, [id, navigate]);

    const getSexLabel = (sex) => {
        switch (sex) {
            case 'M':
                return 'Nam';
            case 'F':
                return 'Nữ';
            case 'O':
                return 'Khác';
            default:
                return 'Chưa xác định';
        }
    };

    const handleUpdatePassClick = () => {
        setIsUpdating('pass');
    };

    const handleUpdateUserClick = () => {
        setIsUpdating('user');
    };

    const handleCancelUpdate = () => {
        setIsUpdating(null);
        // Refresh account data after update
        fetch('http://localhost:8000/sweet/details/')
            .then(res => res.json())
            .then(data => {
                const accountData = data.find(account => account.id === id);
                if (accountData) {
                    setAccount(accountData);
                } else {
                    navigate('/login');
                }
            })
            .catch(error => console.error('Error fetching data:', error));
    };

    return (
        <div className="details-container">
            <div className="details-header">
                <h1>Thông Tin của Bạn</h1>
            </div>
            {account ? (
                <>
                    {isUpdating === 'pass' ? (
                        <UpdatePass onCancel={handleCancelUpdate} />
                    ) : isUpdating === 'user' ? (
                        <UpdateUser onCancel={handleCancelUpdate} />
                    ) : (
                        <>
                            <UserProfile account={account} getSexLabel={getSexLabel} />
                            <ul className="info-list">
                                <li>
                                    <button className="button-details-s" onClick={handleUpdatePassClick}>Thay Đổi Mật Khẩu</button>
                                    <button className="button-details-s" onClick={handleUpdateUserClick}>Chỉnh Sửa Thông Tin</button>
                                </li>
                            </ul>
                        </>
                    )}
                    <button className="button-details" onClick={handleLogout}>Logout</button>
                </>
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}

export default Details;
