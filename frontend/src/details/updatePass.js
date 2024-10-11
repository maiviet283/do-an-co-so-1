import React, { useState, useEffect } from 'react';
import '../css/updatePass.css';
import { useNavigate } from 'react-router-dom';

function UpdatePass({ onCancel }) {
    const [oldPassword, setOldPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [error, setError] = useState('');
    const [showOldPassword, setShowOldPassword] = useState(false);
    const [showNewPassword, setShowNewPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);
    const [passwords, setPasswords] = useState([]);
    const [loading, setLoading] = useState(true);

    const navigate = useNavigate();

    useEffect(() => {
        fetch('http://localhost:8000/sweet/update/password/')
            .then(res => res.json())
            .then(data => {
                setPasswords(data);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                setLoading(false);
            });
    }, []);

    const handleSubmit = (e) => {
        e.preventDefault();

        // Check if the old password is correct
        const user = passwords.find(user => user.password === oldPassword);
        if (!user) {
            setError('Mật khẩu cũ không đúng.');
            return;
        }

        // Check if new password and confirm password match
        if (newPassword !== confirmPassword) {
            setError('Mật khẩu mới và xác nhận mật khẩu không khớp.');
            return;
        }

        // Update the password
        fetch(`http://localhost:8000/sweet/update/password/${user.id}/`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ password: newPassword }),
        })
            .then(res => res.json())
            .then(() => {
                setError('');
                handleCancel();
            })
            .catch(error => {
                console.error('Error updating password:', error);
                setError('Có lỗi xảy ra khi cập nhật mật khẩu.');
            });
    };

    const handleCancel = () => {
        if (typeof onCancel === 'function') {
            onCancel();
        } else {
            navigate('/details');
        }
    };

    return (
        <div className="update-pass-container">
            <h1>Thay Đổi Mật Khẩu</h1>
            {loading ? (
                <p>Loading...</p>
            ) : (
                <form onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="old-password">Mật Khẩu Cũ:</label>
                        <div className="password-field">
                            <input
                                style={{ width: 360 }}
                                type={showOldPassword ? 'text' : 'password'}
                                id="old-password"
                                value={oldPassword}
                                onChange={(e) => setOldPassword(e.target.value)}
                                required
                            />
                            <input
                                type="checkbox"
                                id="show-old-password"
                                checked={showOldPassword}
                                onChange={() => setShowOldPassword(!showOldPassword)}
                            />
                            <label htmlFor="show-old-password">Hiển Thị</label>
                        </div>
                    </div>
                    <div className="form-group">
                        <label htmlFor="new-password">Mật Khẩu Mới:</label>
                        <div className="password-field">
                            <input
                                style={{ width: 360 }}
                                type={showNewPassword ? 'text' : 'password'}
                                id="new-password"
                                value={newPassword}
                                onChange={(e) => setNewPassword(e.target.value)}
                                required
                            />
                            <input
                                type="checkbox"
                                id="show-new-password"
                                checked={showNewPassword}
                                onChange={() => setShowNewPassword(!showNewPassword)}
                            />
                            <label htmlFor="show-new-password">Hiển Thị</label>
                        </div>
                    </div>
                    <div className="form-group">
                        <label htmlFor="confirm-password">Xác Nhận Mật Khẩu Mới:</label>
                        <div className="password-field">
                            <input
                                style={{ width: 360 }}
                                type={showConfirmPassword ? 'text' : 'password'}
                                id="confirm-password"
                                value={confirmPassword}
                                onChange={(e) => setConfirmPassword(e.target.value)}
                                required
                            />
                            <input
                                type="checkbox"
                                id="show-confirm-password"
                                checked={showConfirmPassword}
                                onChange={() => setShowConfirmPassword(!showConfirmPassword)}
                            />
                            <label htmlFor="show-confirm-password">Hiển Thị</label>
                        </div>
                    </div>
                    {error && <p className="error-message">{error}</p>}
                    <button type="submit" className="submit-button">Cập Nhật Mật Khẩu</button>
                    <button type="button" className="cancel-button" onClick={handleCancel}>Quay Lại</button>
                </form>
            )}
        </div>
    );
}

export default UpdatePass;
