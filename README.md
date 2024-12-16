# Quản Lý Nhà Hàng Khách Sạn - Cơ Sở Dữ Liệu
![image](https://github.com/user-attachments/assets/e4b0922e-7a94-44b7-9f24-46a557c37391)
## QuanLyNhaHangKhachSan Database - create objects.sql
File này chứa các câu lệnh SQL để tạo cấu trúc cơ sở dữ liệu cho hệ thống quản lý nhà hàng khách sạn, bao gồm:
- Tạo các bảng (tables)
- Xác định khóa chính, khóa ngoại (primary key, foreign key)
- Tạo các ràng buộc dữ liệu (constraints), trigger, stored procedure
## QuanLyNhaHangKhachSan Database - load data.sql
File này chứa các câu lệnh SQL để nạp dữ liệu mẫu vào cơ sở dữ liệu vừa tạo.
- Dữ liệu bao gồm các thông tin mẫu về khách hàng, chi nhánh, dịch vụ, v.v.
- Phục vụ cho việc kiểm thử và chạy thử hệ thống.
## QuanLyNhaHangKhachSan Database - query.sql
File này chứa các câu lệnh SQL phục vụ cho:
- Truy vấn dữ liệu: Truy xuất thông tin từ các bảng dữ liệu.
- Phân quyền người dùng: Cấp quyền truy cập và thao tác trên cơ sở dữ liệu theo vai trò .
