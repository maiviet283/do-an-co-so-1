import React, { useState, useEffect } from 'react';
import '../css/updateUser.css';

function UpdateUser({ onCancel }) {
    const [user, setUser] = useState(null);
    const [error, setError] = useState('');
    const [selectedFile, setSelectedFile] = useState(null);
    const id = parseInt(sessionStorage.getItem('id'), 10);

    useEffect(() => {
        if (id) {
            fetch(`http://localhost:8000/sweet/details/${id}/`)
                .then(res => res.json())
                .then(data => {
                    setUser(data);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                    setError('Error fetching data');
                });
        }
    }, [id]);

    const handleChange = (e) => {
        const { name, value, type, files } = e.target;
        if (type === 'file') {
            setSelectedFile(files[0]);
        } else {
            setUser(prevUser => ({
                ...prevUser,
                [name]: value
            }));
        }
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        const formData = new FormData();
        if (selectedFile) {
            formData.append('anh', selectedFile);
        }
        formData.append('ten', user.ten || '');
        formData.append('tuoi', user.tuoi || '');
        formData.append('gioi_tinh', user.gioi_tinh || '');
        formData.append('email', user.email || '');
        formData.append('sdt', user.sdt || '');
        formData.append('dia_chi', user.dia_chi || '');
        formData.append('username', user.username || '');
        formData.append('password', user.password || '');

        fetch(`http://localhost:8000/sweet/details/${id}/`, {
            method: 'PUT',
            body: formData,
        })
            .then(res => res.json())
            .then(data => {
                if (data.error) {
                    setError(data.error);
                } else {
                    if (typeof onCancel === 'function') {
                        onCancel();
                    }
                }
            })
            .catch(error => {
                setError('Error updating user');
            });
    };

    return (
        <div className="update-user-container">
            <h1>Cập Nhật Thông Tin Người Dùng</h1>
            {user ? (
                <form onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="anh">Ảnh:</label>
                        <input
                            type="file"
                            id="anh"
                            name="anh"
                            onChange={handleChange}
                            accept="image/*"
                        />
                        {user.anh && !selectedFile && <img src={user.anh} alt="Profile" style={{ width: '100px'}} />}
                    </div>
                    <div className="form-group">
                        <label htmlFor="ten">Tên:</label>
                        <input
                            type="text"
                            id="ten"
                            name="ten"
                            value={user.ten || ''}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="tuoi">Tuổi:</label>
                        <input
                            type="number"
                            id="tuoi"
                            name="tuoi"
                            value={user.tuoi || ''}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="gioi_tinh">Giới Tính:</label>
                        <select
                            id="gioi_tinh"
                            name="gioi_tinh"
                            value={user.gioi_tinh || ''}
                            onChange={handleChange}
                        >
                            <option value="">Chọn giới tính</option>
                            <option value="M">Nam</option>
                            <option value="F">Nữ</option>
                            <option value="O">Khác</option>
                        </select>
                    </div>
                    <div className="form-group">
                        <label htmlFor="email">Email:</label>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            value={user.email || ''}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="sdt">Số Điện Thoại:</label>
                        <input
                            type="text"
                            id="sdt"
                            name="sdt"
                            value={user.sdt || ''}
                            onChange={handleChange}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="dia_chi">Địa Chỉ:</label>
                        <input
                            type="text"
                            id="dia_chi"
                            name="dia_chi"
                            value={user.dia_chi || ''}
                            onChange={handleChange}
                        />
                    </div>
                    {error && <p className="error-message">{error}</p>}
                    <button type="submit" className="submit-button">Cập Nhật</button>
                    <button type="button" className="cancel-button" onClick={onCancel}>Hủy</button>
                </form>
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}

export default UpdateUser;
