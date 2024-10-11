import React, { useEffect, useState } from 'react';
import './css/product.css';
import addcard from './assets/add_card.png';
import star from './assets/star.png';

function Products({ isLoggedIn }) {
    const [products, setProducts] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(0);
    const id_khach_hang = Number(sessionStorage.getItem('id'));

    useEffect(() => {
        fetchProducts(currentPage);
    }, [currentPage]);

    const fetchProducts = (page) => {
        fetch(`http://127.0.0.1:8000/sweet/douong/?page=${page}`)
            .then(response => response.json())
            .then(data => {
                setProducts(data.results);
                setTotalPages(Math.ceil(data.count / 6));
            })
            .catch(error => console.error('Error fetching data:', error));
    };

    const handlePageClick = (page) => {
        setCurrentPage(page);
    };

    const getShortDescription = (htmlContent) => {
        const div = document.createElement('div');
        div.innerHTML = htmlContent;
        const textContent = div.textContent || div.innerText || '';
        return textContent.split(' ').slice(0, 10).join(' ') + '...';
    };

    const handleAddProductToCart = (product) => {
        fetch('http://127.0.0.1:8000/sweet/addgiohangdouong/')
            .then(res => res.json())
            .then(data => {
                const existingProduct = data.find(item => item.gio_hang === id_khach_hang && item.do_uong === product.id);

                if (existingProduct) {
                    console.log(existingProduct.so_luong + 1);

                    const updateData = {
                        so_luong: existingProduct.so_luong + 1,
                        gio_hang: id_khach_hang,
                        do_uong: product.id
                    };

                    fetch(`http://127.0.0.1:8000/sweet/addgiohangdouong/${existingProduct.id}/`, {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(updateData)
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(updatedProduct => {
                            console.log('Product quantity updated:', updatedProduct);
                        })
                        .catch(error => console.error('Error updating product quantity:', error));
                } else {
                    console.log("Không có sản phẩm nào trong giỏ hàng");
                    const addCartBody = {
                        so_luong: 1,
                        gio_hang: id_khach_hang,
                        do_uong: product.id
                    };

                    fetch('http://127.0.0.1:8000/sweet/addgiohangdouong/', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(addCartBody)
                    })
                        .then(response => response.json())
                        .then(dataa => {
                            console.log('Thêm thành công vào giỏ hàng');
                        })
                        .catch(error => console.error('Error adding product to cart:', error));
                }

            })
            .catch(error => console.error('Error fetching cart products:', error));

        // Trừ số lượng sản phẩm trong kho
        fetch(`http://127.0.0.1:8000/sweet/update/soluongdoduong/${product.id}/`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                ...product,
                so_luong: product.so_luong - 1
            })
        })
            .then(response => response.json())
            .then(updatedProduct => {
                // console.log('Product quantity updated:', updatedProduct);
            })
    };

    return (
        <div id="wp-products">
            <h2 id="spcct">SẢN PHẨM CỦA CHÚNG TÔI</h2>
            <ul id="list-products">
                {products.map(product => (
                    <div className="item" key={product.id}>
                        <img style={{ height: 174, width: 256, borderRadius: 3 }} src={product.anh} alt={product.ten} />
                        <div className="stars">
                            {[...Array(5)].map((_, i) => (
                                <span key={i}>
                                    <img src={star} alt="" />
                                </span>
                            ))}
                        </div>
                        <div className="name">{product.ten}</div>
                        <div className="desc" title={product.thong_tin} dangerouslySetInnerHTML={{ __html: getShortDescription(product.thong_tin) }}></div>
                        <div className="price">
                            <span>{product.don_gia.toLocaleString()} VNĐ </span>
                        </div>
                        {isLoggedIn && (
                            <div id='div-add-card-img'>
                                <button onClick={() => handleAddProductToCart(product)} style={{ width: 33, height: 33 }}><img style={{ margin: 0 }} id='add-card-img' src={addcard} alt="" /></button>
                            </div>
                        )}
                    </div>
                ))}
            </ul>
            <div className="list-page">
                {[...Array(totalPages).keys()].map(page => (
                    <div className="item" key={page + 1} onClick={() => handlePageClick(page + 1)}>
                        <a href='#spcct'>{page + 1}</a>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default Products;
