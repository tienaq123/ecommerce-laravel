Run project laravel
#1
composer instal
npm instal
#2
import db
#3

 <!--  -->

#4
php artisan storage:link
#5
php artisan serve

Api

<!-- Categories -->

-   GET:http://127.0.0.1:8000/api/categories
-   POST:http://127.0.0.1:8000/api/categories
-   PUT: http://127.0.0.1:8000/api/categories/{id}
-   DELETE: http://127.0.0.1:8000/api/categories/{id}(Xóa mềm)
-   POST:http://127.0.0.1:8000/api/categories/restore/{id}(Khôi phục)

<!-- Banners -->

-   GET:http://127.0.0.1:8000/api/banners
-   POST:http://127.0.0.1:8000/api/banners
-   PUT: http://127.0.0.1:8000/api/banners/{id}
-   DELETE: http://127.0.0.1:8000/api/banners/{id}(Xóa)
-   PUT:http://127.0.0.1:8000/api/banners/toggle/{id} (Active hoặc unactive)

<!-- Products -->

-   GET:http://127.0.0.1:8000/api/products
-   POST:http://127.0.0.1:8000/api/products
-   PUT: http://127.0.0.1:8000/api/products/{id}
-   DELETE: http://127.0.0.1:8000/api/products/{id}(Xóa mềm)
-   POST:http://127.0.0.1:8000/api/products/restore/{id}(Khôi phục)

-   GET:http://127.0.0.1:8000/api/products?min_price=100000&max_price=200000 ( Get sản phẩm trong khoảng giá từ 10000 đến 200000 )
-   GET:http://127.0.0.1:8000/api/products?brand_id=id_brand ( Get sản phẩm thuộc brand có brand id = id_brands )
-   GET:http://127.0.0.1:8000/api/products?category_id=id_categories ( Get sản phẩm thuộc danh mục có id categories là = id_categories )
-   GET:http://127.0.0.1:8000/api/products?search=key ( Tìm kiếm sản phẩm có từ khóa 'key' )
-   GET:http://127.0.0.1:8000/api/products?sort_by=created_at ( Sắp xếp sản phẩm theo cột. created_at là sắp xếp từ mới đến cũ )
-   GET:http://127.0.0.1:8000/api/products?attribute[id_attribute][]=id_attribute_value&attribute[id_attribute][]=id_attribute_value&attribute[id_attribute][]=id_attribute_value ( Lọc sản phẩm theo biến thể  ví dụ: http://127.0.0.1:8000/api/products?attribute[1][]=1&attribute[2][]=10&attribute[3][]=16 )


<!-- Attribute -->
GET:http://127.0.0.1:8000/api/attributes (Get all)
POST:http://127.0.0.1:8000/api/attributes (Add new)
PUT:http://127.0.0.1:8000/api/attributes/{id} (Cập nhật)
DELETE:http://127.0.0.1:8000/api/attributes/{id} (Xóa thuộc tính)
DELETE:http://127.0.0.1:8000/api/attributes/{attributeId}/values/{valueId} (Xóa giá trị của thuộc tính, ví dụ xóa màu đỏ của thuộc tính màu sắc)
PATCH:http://127.0.0.1:8000/api/attributes/{attributeId}/values/{valueId}/restore (Khôi phục lại giá trị đã xóa của thuộc tính)

<!-- Cart -->

-   POST:http://127.0.0.1:8000/api/cart/add
-   GET:http://127.0.0.1:8000/api/cart/
-   PUT: http://127.0.0.1:8000/api/cart/{id}
-   DELETE: http://127.0.0.1:8000/api/cart/{id}
-   DELETE: http://127.0.0.1:8000/api/cart (clear cart)

<!-- Checkout -->

-   POST:http://127.0.0.1:8000/api/cart/checkout
    -   Lấy api address VietNam ở đây: https://esgoo.net/api-lay-thong-tin-tinh-thanh-quan-huyen-phuong-xa-viet-nam-bv5.htm


<!-- order -->
 GET:http://127.0.0.1:8000/api/order (get all admin)
 GET:http://127.0.0.1:8000/api/update-status(update order user. 
 Truyền vào {
  "status_id" từ 1->5 tương ứng với các trạng thái
})

 GET:http://127.0.0.1:8000/api/list-order(get order user)
 GET:http://127.0.0.1:8000/api/orders/{orderId}/detail(get order detail user)
 PUT:http://127.0.0.1:8000/api/orders/{orderId}/cancel(Hủy đơn order user)

<!-- User -->

-   GET: http://127.0.0.1:8000/api/users?per_page=1&page=1&keyword (per_page số lượng bản ghi trên mỗi trang, page = 1 trang 1 page = 2 trang 2, keyword giá trị tìm kiếm)
-   POST:http://127.0.0.1:8000/api/user/add (thêm mới người dùng)
-   PUT: http://127.0.0.1:8000/api/user/update (cập nhật người dùng)

<!-- Auth -->
POST: http://127.0.0.1:8000/api/register (đăng kí)
POST: http://127.0.0.1:8000/api/login (đăng đăng)

<!-- Resetpassword -->
POST: http://127.0.0.1:8000/api/forgetpassword (Nhập email quên mật khẩu nhận mail)
GET: http://127.0.0.1:8000/api/resetpassword (trả vể token)
POST:http://127.0.0.1:8000/api/resetpassword (Nhập mật khẩu mới và nhập lại mật khẩu mới)

<!-- Dashboard -->
productStock sản phẩm còn lại trong kho
inventoryTotalValue tổng tiền của sản phẩm trong kho
countSoldProducts số lượng sản phẩm đã bán

countOrder số đơn đã được đặt
sumOrder doanh thu
countCompletedOrders số đơn đã hoàn thành
countCancelledOrders số đơn đã hủy

GET: http://127.0.0.1:8000/api/productByCategory/id (id là id của category)


<!----------------------- Biến thể ---------------------------->

<!-- Api thứ nhất để lưu các thông tin cơ bản của sản phẩm -->
- POST: http://127.0.0.1:8000/api/products
    data mẫu:
    {
    "name": "Áo Phao Nam Mũ Nhám Cài Siêu Ấm",
    "description": "Áo phao giữ ấm tốt nhờ kiểu dệt của hai hệ sợi vuông góc với nhau khăng khít, giúp cản gió, cách nhiệt, giữ ấm hiệu quả. sử dụng sợi Polyester chi số lớn, tạo bề mặt vừa đứng phom vừa mềm mại, vừa giữ ấm tốt. Bền, dễ chăm sóc, dễ bảo quản.",
    "price": 989000,
    "price_old": 1000000,
    "quantity": 100,
    "category_id": 14,
    "brand_id": null,
    "promotion": "Giảm giá",
    "status": "active",
    "images": [
        {
            "url": "https://m.yodycdn.com/fit-in/filters:format(webp)/products/pvm6003-gir-smm6097-nau-atm6010-den-01.jpg",
            "is_thumbnail": true
        },
        {
            "url": "https://m.yodycdn.com/fit-in/filters:format(webp)/products/pvm6003-gir-smm6097-nau-atm6010-den-03.jpg",
            "is_thumbnail": false
        },
        {
            "url": "https://m.yodycdn.com/fit-in/filters:format(webp)/products/pvm6003-gir-smm6097-nau-atm6010-den-04.jpg",
            "is_thumbnail": false
        }
    ]
}

   + Khi api được thực hiện nó sẽ lưu thông tin sản phẩm và trả ra cục data như sau:
   {
    "status": true,
    "message": "Product created successfully",
    "data": {
        "id": 15,
        "name": "Áo thun nam àdfhsdifhsduiguisdfgh",
        "description": "Áo thun nam chất liệu cotton, mềm mại và thoải mái.",
        "price": 200000,
        "price_old": 250000,
        "quantity": 100,
        "view": null,
        "category_id": 53,
        "brand_id": null,
        "promotion": "Giảm giá 10%",
        "status": "active",
        "created_at": "2024-08-26T17:10:11.000000Z",
        "updated_at": "2024-08-26T17:10:11.000000Z"
            }
    }
    + Dựa vào nó để show ra bảng để điền các thuộc tính.

    Khi chọn các attribute ví dụ như màu sắc, size thì show ra các value bên dưới, các value ấy sẽ là checkbox và value checkbox chính là thằng value_id ấy. Khi đã chọn thành công click button tạo thuộc tính.
    Button ấy sẽ lấy id của các thuộc tính mình vừa chọn và gọi đến api
- POST: http://127.0.0.1:8000/api/products/{productId}/variants
    + api đó sẽ lấy các giá trị bên dưới và truyền vào các value_id:
    {
    "product_id": 14,  // ID của sản phẩm vừa tạo
    "attribute": [
        {
            "attribute_id": 1,  // Ví dụ: Màu sắc
            "value_ids": [1,2, 3]  // Ví dụ: Đỏ (1), Xanh (2), Tím (3)
        },
        {
            "attribute_id": 2,  // Ví dụ: Kích thước
            "value_ids": [8, 9, 10]  // Ví dụ: S (8), M (9), L (10)
        },
        {
            "attribute_id": 3, // Ví dụ: Chất liệu
            "value_ids": [14, 15, 16] 
        }
                    ],
        "stock": 10,
        "price": 500000
    }

    + Sau khi api được gọi thành công trả về true thì get lại product bằng api 
- GET:http://127.0.0.1:8000/api/products/{idProduct}(idProduct mình sẽ lấy id của thằng product mình vừa tạo ấy)

    + get xong được api đấy nó cho cục chi tiết sản phẩm với 1 đống biến thể, show nó ra cái bảng bên phải rồi mình điền ảnh, giá, số lượng.
    + Điền xong gọi api
- PUT:http://127.0.0.1:8000/api/products/variants/update-multiple
    + Nó sẽ cần các thông tin mình nhập ví dụ như:
    {
    "variants": [
        {
            "id": 183,(Đây là id của thằng productVariants)
            "price": 350000, (giá tùy ý)
            "stock": 3,(số lượng)
            "thumbnail": "new-image-url-1.jpg" (ảnh)
        },
        {
            "id": 184,
            "price": 400000,
            "stock": 4,
            "thumbnail": "new-image-url-2.jpg"
        },
        {
            "id": 185,
            "price": 550000,
            "stock": 5,
            "thumbnail": "new-image-url-3.jpg"
        },
    ]
}


GET: http://127.0.0.1:8000/api/coupon/list-coupon -> trả về list coupon
POST: http://127.0.0.1:8000/api/coupon/add -> thêm mới
GET: http://127.0.0.1:8000/api/coupon/showById/{id} -> trả về theo id
POST: http://127.0.0.1:8000/api/coupon/getByCode -> truyền vào code trả về theo code
PUT: http://127.0.0.1:8000/api/coupon/update/{id} -> cập nhật
PATCH: http://127.0.0.1:8000/api/coupon/updateStatus/{id} -> cập nhật trạng thái
DELETE: http://127.0.0.1:8000/api/coupon/delete/{id} -> xóa
GET: http://127.0.0.1:8000/api/make-code-coupon -> tạo một code
