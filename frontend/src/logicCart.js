
export const handleDeleteProduct = (IdGioHang, product, loadCartData) => {
  fetch('http://127.0.0.1:8000/sweet/addgiohangdouong/')
    .then(res => res.json())
    .then(data => {
      const existingProduct = data.find(item => item.gio_hang === IdGioHang && item.do_uong === product.id);

      if (existingProduct) {
        if (existingProduct.so_luong > 1) {
          const updateProductCartBody = {
            so_luong: existingProduct.so_luong - 1,
            gio_hang: existingProduct.gio_hang,
            do_uong: product.id
          };

          return fetch(`http://127.0.0.1:8000/sweet/addgiohangdouong/${existingProduct.id}/`, {
            method: 'PUT',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(updateProductCartBody)
          });
        } else {
          return fetch(`http://127.0.0.1:8000/sweet/addgiohangdouong/${existingProduct.id}/`, {
            method: 'DELETE',
            headers: {
              'Content-Type': 'application/json'
            }
          });
        }
      }
      return Promise.reject('Sản phẩm không tồn tại trong giỏ hàng');
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`Lỗi khi cập nhật sản phẩm: ${response.statusText}`);
      }
      loadCartData();
    })
    .catch(error => {
      console.error('Lỗi khi thêm sản phẩm vào giỏ hàng:', error);
    });

  fetch(`http://127.0.0.1:8000/sweet/update/soluongdoduong/${product.id}/`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      ...product,
      so_luong: product.so_luong + 1
    })
  })
    .then(response => response.json())
    .then(updatedProduct => { });
};

export const handleAddProduct = (IdGioHang, product, loadCartData) => {
  fetch(`http://127.0.0.1:8000/sweet/update/soluongdoduong/${product.id}/`)
    .then(response => response.json())
    .then(data => {
      if (data.so_luong > 0) {
        fetch('http://127.0.0.1:8000/sweet/addgiohangdouong/')
          .then(res => res.json())
          .then(data => {
            const existingProduct = data.find(item => item.gio_hang === IdGioHang && item.do_uong === product.id);

            if (existingProduct) {
              const addOneProductCartBody = {
                so_luong: existingProduct.so_luong + 1,
                gio_hang: existingProduct.gio_hang,
                do_uong: product.id
              };

              return fetch(`http://127.0.0.1:8000/sweet/addgiohangdouong/${existingProduct.id}/`, {
                method: 'PUT',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify(addOneProductCartBody)
              });
            }
            return Promise.reject('Sản phẩm không tồn tại trong giỏ hàng');
          })
          .then(response => {
            if (!response.ok) {
              throw new Error(`Lỗi khi cập nhật sản phẩm: ${response.statusText}`);
            }
            return response.json();
          })
          .then(updatedProduct => {
            loadCartData();
          })
          .catch(error => {
            console.error('Lỗi khi thêm sản phẩm vào giỏ hàng:', error);
          });

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
          .then(updatedProduct => { });
      }
    });


};


export const handleDeleteAllProductInCart = (IdGioHang, product, loadCartData) => {
  fetch('http://127.0.0.1:8000/sweet/addgiohangdouong/')
    .then(res => res.json())
    .then(data => {
      const existingProduct = data.find(item => item.gio_hang === IdGioHang && item.do_uong === product.id);

      if (existingProduct) {
        const addOneProductCartBody = {
          so_luong: existingProduct.so_luong + 1,
          gio_hang: existingProduct.gio_hang,
          do_uong: product.id
        };

        return fetch(`http://127.0.0.1:8000/sweet/addgiohangdouong/${existingProduct.id}/`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(addOneProductCartBody)
        });
      }
      return Promise.reject('Sản phẩm không tồn tại trong giỏ hàng');
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`Lỗi khi cập nhật sản phẩm: ${response.statusText}`);
      }
      return response.json();
    })
    .then(updatedProduct => {
      loadCartData();
    })
    .catch(error => {
      console.error('Lỗi khi thêm sản phẩm vào giỏ hàng:', error);
    });

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
    .then(updatedProduct => { });
};
