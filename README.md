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
Categories
GET:http://127.0.0.1:8000/api/categories
POST:http://127.0.0.1:8000/api/categories
PUT: http://127.0.0.1:8000/api/categories/{id}
DELETE: http://127.0.0.1:8000/api/categories/{id}(Xóa mềm)
POST:http://127.0.0.1:8000/api/categories/restore/{id}(Khôi phục)

Banners
GET:http://127.0.0.1:8000/api/banners
POST:http://127.0.0.1:8000/api/banners
PUT: http://127.0.0.1:8000/api/banners/{id}
DELETE: http://127.0.0.1:8000/api/banners/{id}(Xóa)
PUT:http://127.0.0.1:8000/api/banners/toggle/{id} (Active hoặc unactive)

Products
GET:http://127.0.0.1:8000/api/products
POST:http://127.0.0.1:8000/api/products
PUT: http://127.0.0.1:8000/api/products/{id}
DELETE: http://127.0.0.1:8000/api/products/{id}(Xóa mềm)
POST:http://127.0.0.1:8000/api/products/restore/{id}(Khôi phục)

GET:http://127.0.0.1:8000/api/products?min_price=100000&max_price=200000 ( Get sản phẩm trong khoảng giá từ 10000 đến 200000 )
GET:http://127.0.0.1:8000/api/products?brand_id=id_brand ( Get sản phẩm thuộc brand có brand id = id_brands )
GET:http://127.0.0.1:8000/api/products?category_id=id_categories ( Get sản phẩm thuộc danh mục có id categories là = id_categories )
GET:http://127.0.0.1:8000/api/products?search=key ( Tìm kiếm sản phẩm có từ khóa 'key' )
GET:http://127.0.0.1:8000/api/products?sort_by=created_at ( Sắp xếp sản phẩm theo cột. created_at là sắp xếp từ mới đến cũ )

Cart
POST:http://127.0.0.1:8000/api/cart/add
GET:http://127.0.0.1:8000/api/cart/
PUT: http://127.0.0.1:8000/api/cart/{id}
DELETE: http://127.0.0.1:8000/api/cart/{id}

User
GET: http://127.0.0.1:8000/api/users?per_page=1&page=1&keyword (per_page số lượng bản ghi trên mỗi trang, page = 1 trang 1 page = 2 trang 2, keyword giá trị tìm kiếm)
POST:http://127.0.0.1:8000/api/user/add (thêm mới người dùng)
PUT: http://127.0.0.1:8000/api/user/update (cập nhật người dùng)


Auth
POST: http://127.0.0.1:8000/api/register (đăng kí)
POST: http://127.0.0.1:8000/api/login (đăng đăng)

Resetpassword
POST: http://127.0.0.1:8000/api/forgetpassword (Nhập email quên mật khẩu nhận mail)
GET: http://127.0.0.1:8000/api/resetpassword (trả vể token)
POST:http://127.0.0.1:8000/api/resetpassword (Nhập mật khẩu mới và nhập lại mật khẩu mới)




