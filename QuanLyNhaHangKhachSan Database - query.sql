USE [QuanLyNhaHangKhachSan]
GO

-- Truy vấn 1 bảng
SELECT * FROM Nhan_vien_ql
SELECT ma_kh, ho_ten, gioi_tinh, ngay_sinh FROM Khach_hang
SELECT ma_cn, ten_cn, dia_diem, loai_hinh FROM Chi_nhanh
SELECT ho_ten, ngay_sinh, gioi_tinh, quan_he FROM Than_nhan

-- Truy vấn nhiều bảng
SELECT ho_ten, gioi_tinh, ngay_sinh, ten_cn, dia_diem, loai_hinh, phan_khuc 
FROM Nhan_vien_ql INNER JOIN Chi_nhanh ON Nhan_vien_ql.ma_cn = Chi_nhanh.ma_cn

SELECT ho_ten, gioi_tinh, ngay_sinh, ten_cn, dia_diem, loai_hinh, phan_khuc 
FROM Nhan_vien_ql LEFT JOIN Chi_nhanh ON Nhan_vien_ql.ma_cn = Chi_nhanh.ma_cn

SELECT ten_dv, ten_cn, dia_diem, loai_hinh, phan_khuc 
FROM Chi_nhanh RIGHT JOIN CN_DV ON Chi_nhanh.ma_cn = CN_DV.ma_cn RIGHT JOIN Dich_vu ON CN_DV.ma_dv = Dich_vu.ma_dv

SELECT ho_ten, gioi_tinh, ngay_sinh, tg_bat_dau, tg_ket_thuc, ten_dv 
FROM Khach_hang INNER JOIN KH_DV ON KH_DV.ma_kh = Khach_hang.ma_kh INNER JOIN Dich_vu ON KH_DV.ma_dv = Dich_vu.ma_dv

-- Truy vấn có điều kiện (AND, OR, like, BETWEEN,….)
SELECT Khach_hang.ho_ten, Khach_hang.gioi_tinh, Khach_hang.ngay_sinh, KH_DV.tg_bat_dau, KH_DV.tg_ket_thuc, Dich_vu.ten_dv, Khach_hang.SDT 
FROM Khach_hang, KH_DV, Dich_vu 
WHERE Khach_hang.SDT LIKE '%960' AND KH_DV.ma_kh = Khach_hang.ma_kh AND KH_DV.ma_dv = Dich_vu.ma_dv

SELECT Nhan_vien_ql.ho_ten, Nhan_vien_ql.ho_ten, Than_nhan.gioi_tinh, Than_nhan.ngay_sinh, Than_nhan.quan_he 
FROM Nhan_vien_ql, Than_nhan 
WHERE Nhan_vien_ql.ma_nvql = Than_nhan.ma_nvql AND (Nhan_vien_ql.ma_nvql = '0000000004' OR Nhan_vien_ql.ma_nvql = '0000000009')

SELECT ten_cn, dia_diem, loai_hinh, Loi_nhuan 
FROM Chi_nhanh, Loi_nhuan, Chu_so_huu 
WHERE Chi_nhanh.ma_cn = Loi_nhuan.ma_cn AND Chu_so_huu.ma_csh = Chi_nhanh.ma_csh AND Loi_nhuan > 1000000000

SELECT ho_ten, gioi_tinh, ngay_sinh, tg_bat_dau, tg_ket_thuc, ten_dv, SDT, phi_dv 
FROM Khach_hang, KH_DV, Dich_vu 
WHERE KH_DV.ma_kh = Khach_hang.ma_kh AND KH_DV.ma_dv = Dich_vu.ma_dv AND KH_DV.phi_dv BETWEEN 1000000 AND 3000000

-- Truy vấn tính toán
SELECT ma_kh, ho_ten, gioi_tinh, YEAR(GETDATE()) - YEAR(ngay_sinh) AS N'Tuổi' FROM Khach_hang
SELECT COUNT(*) AS N'Số lượng nhân viên'FROM Nhan_vien_ql WHERE YEAR(GETDATE()) - YEAR(ngay_sinh) BETWEEN 30 AND 50
SELECT SUM(phi_dv) AS N'Tổng số tiền' , COUNT(phi_dv) AS N'Số lượng khách hàng' FROM KH_DV, Dich_vu WHERE KH_DV.ma_dv = Dich_vu.ma_dv AND ten_dv = N'Nghỉ dưỡng'
SELECT SUM(Loi_nhuan) AS N'Tổng lợi nhuận' FROM Chi_nhanh, Loi_nhuan WHERE Chi_nhanh.ma_cn = Loi_nhuan.ma_cn AND nam = 2022 AND (ma_csh = '004' OR ma_csh = '003')

-- Truy vấn gom nhóm
SELECT ten_csh,SUM(Loi_nhuan) AS N'Tổng lợi nhuận' 
FROM Chi_nhanh, Loi_nhuan, Chu_so_huu 
WHERE Chi_nhanh.ma_cn = Loi_nhuan.ma_cn AND Chi_nhanh.ma_csh = Chu_so_huu.ma_csh AND nam = 2021
GROUP BY Chu_so_huu.ten_csh

SELECT ten_dv, SUM(phi_dv) AS N'Tổng số tiền', COUNT (*) AS N'Số lần đã thực hiện dịch vụ' 
FROM KH_DV, Dich_vu 
WHERE KH_DV.ma_dv = Dich_vu.ma_dv 
GROUP BY Dich_vu.ten_dv

SELECT ho_ten, gioi_tinh, YEAR(GETDATE()) - YEAR(ngay_sinh) AS N'Tuổi' , COUNT(Dich_vu.ma_dv) AS N'Số lượng dịch vụ' 
FROM KH_DV, Khach_hang, Dich_vu
WHERE Khach_hang.ma_kh = KH_DV.ma_kh AND Dich_vu.ma_dv = KH_DV.ma_dv  
GROUP BY ho_ten, gioi_tinh, Dich_vu.ma_dv, ngay_sinh

SELECT Nhan_vien_ql.ho_ten, Nhan_vien_ql.gioi_tinh,  YEAR(GETDATE()) - YEAR(Nhan_vien_ql.ngay_sinh) AS N'Tuổi', COUNT(Than_nhan.ma_nvql) AS N'Số lượng người thân'  
FROM Than_nhan, Nhan_vien_ql 
WHERE Nhan_vien_ql.ma_nvql = Than_nhan.ma_nvql 
GROUP BY Nhan_vien_ql.ho_ten, Nhan_vien_ql.gioi_tinh, Nhan_vien_ql.ngay_sinh, Than_nhan.ma_nvql

-- Truy vấn gom nhóm có điều hiện
SELECT ten_csh, Chi_nhanh.ma_csh,COUNT(*) AS N'Số lượng' 
FROM Chu_so_huu, Chi_nhanh 
WHERE Chu_so_huu.ma_csh = Chi_nhanh.ma_csh 
GROUP BY ten_csh, Chi_nhanh.ma_csh HAVING COUNT (Chi_nhanh.ma_csh) >= 2

SELECT ten_csh,SUM(Loi_nhuan) AS N'Tổng lợi nhuận' 
FROM Chi_nhanh, Loi_nhuan, Chu_so_huu 
WHERE Chi_nhanh.ma_cn = Loi_nhuan.ma_cn AND Chi_nhanh.ma_csh = Chu_so_huu.ma_csh
GROUP BY Chu_so_huu.ten_csh HAVING SUM(Loi_nhuan) > 3000000000

SELECT ho_ten, gioi_tinh, YEAR(GETDATE()) - YEAR(ngay_sinh) AS N'Tuổi' , COUNT(Dich_vu.ma_dv) AS N'Số lượng dịch vụ' 
FROM KH_DV, Khach_hang, Dich_vu
WHERE Khach_hang.ma_kh = KH_DV.ma_kh AND Dich_vu.ma_dv = KH_DV.ma_dv  
GROUP BY ho_ten, gioi_tinh, Dich_vu.ma_dv, ngay_sinh HAVING SUM(phi_dv) > 1000000

SELECT Nhan_vien_ql.ho_ten, Nhan_vien_ql.gioi_tinh,  YEAR(GETDATE()) - YEAR(Nhan_vien_ql.ngay_sinh) AS N'Tuổi', COUNT(Than_nhan.ma_nvql) AS N'Số lượng người thân'  
FROM Than_nhan, Nhan_vien_ql 
WHERE Nhan_vien_ql.ma_nvql = Than_nhan.ma_nvql AND YEAR(GETDATE()) - YEAR(Nhan_vien_ql.ngay_sinh) > 35  
GROUP BY Nhan_vien_ql.ho_ten, Nhan_vien_ql.gioi_tinh, Nhan_vien_ql.ngay_sinh, Than_nhan.ma_nvql HAVING COUNT(Than_nhan.ma_nvql) > 1

-- Truy vấn có sử dụng phép giao, hội, trừ
SELECT ma_nvql FROM Nhan_vien_ql INTERSECT SELECT ma_nvql FROM Than_nhan
SELECT ma_cn FROM Chi_nhanh UNION SELECT ma_cn FROM CN_DV
SELECT ma_kh FROM Khach_hang EXCEPT SELECT ma_kh FROM KH_DV
SELECT ma_dv FROM KH_DV INTERSECT SELECT ma_dv FROM CN_DV

-- Truy vấn cON
SELECT ho_ten, gioi_tinh, ngay_sinh 
FROM Nhan_vien_ql 
WHERE ma_nvql in (SELECT ma_nvql FROM Nhan_vien_ql INTERSECT SELECT ma_nvql FROM Than_nhan)

SELECT ln.ma_cn, cn.ten_cn, ln.nam, ln.Loi_nhuan 
FROM Chi_nhanh cn, Loi_nhuan ln 
WHERE cn.ma_cn=ln.ma_cn AND 
not exists (SELECT DISTINCT nam FROM Loi_nhuan EXCEPT SELECT nam FROM Loi_nhuan ln2 WHERE ln2.ma_cn = ln.ma_cn AND ln2.Loi_nhuan<0)

SELECT n.ma_nvql, n.ho_ten,
(SELECT t.ho_ten FROM Than_nhan t WHERE t.ma_nvql=n.ma_nvql AND t.quan_he=N'Vợ chồng') AS N'Vợ chồng' 
FROM Nhan_vien_ql n

SELECT cn.ma_cn, cn.loai_hinh, cn.ten_cn, truyvancON.TONgLoi_nhuan 
FROM Chi_nhanh cn, (SELECT ln.ma_cn, SUM(ln.Loi_nhuan) AS TONgLoi_nhuan FROM Loi_nhuan ln GROUP BY ln.ma_cn) truyvancON 
WHERE truyvancON.ma_cn=cn.ma_cn

-- Truy vấn chéo
SELECT ten_cn,
[Trần Khánh Linh],[Hoàng Đức Sơn],[Phạm Tiến Minh],[Trần Hữu Nghĩa]
FROM
(SELECT DISTINCT ten_csh, ten_cn
FROM Chu_so_huu c, Chi_nhanh cn
WHERE c.ma_csh=cn.ma_csh) AS BangNguON
PIVOT
(
COUNT(ten_csh)
FOR ten_csh IN ([Trần Khánh Linh], [Hoàng Đức Sơn],[Phạm Tiến Minh],[Trần Hữu Nghĩa])
) AS BangChuyen;
-- -- -- 
SELECT nam,
[A In Hotel Del Luna], [A In Hotel Glamour],[A In Hotel Riverside],[A In Hotel Trung Sơn],[BONita THT],[Hội Nghộ],[Phố 79 - Phạm Ngọc Thạch],[Phố 79 - Sương Nguyệt Ánh]
FROM
(SELECT DISTINCT Loi_nhuan, nam, ten_cn
FROM Loi_nhuan l, Chi_nhanh cn
WHERE l.ma_cn=cn.ma_cn) AS BangNguON
PIVOT
(
SUM(Loi_nhuan)
FOR ten_cn IN ([A In Hotel Del Luna], [A In Hotel Glamour],[A In Hotel Riverside],[A In Hotel Trung Sơn],[BONita THT],[Hội Nghộ],[Phố 79 - Phạm Ngọc Thạch],[Phố 79 - Sương Nguyệt Ánh])
) AS BangChuyen;
-- -- --
SELECT ho_ten,
[Vợ chồng], [CON trai],[CON gái]
FROM
(SELECT DISTINCT t.ho_ten, quan_he
FROM Nhan_vien_ql n, Than_nhan t
WHERE n.ma_nvql = t.ma_nvql) AS BangNguON
PIVOT
(
COUNT(quan_he)
FOR quan_he IN ([Vợ chồng], [CON trai],[CON gái])
) AS BangChuyen;
-- -- --
SELECT ho_ten,
[Quầy bar], [Catering],[Đồ ăn mang về],[Đặt giữ chỗ nhà hàng],[Đưa đón sân bay],[Fitness center],[Sân golf và sân tennis],[Giao hàng tận nơi],[Giặt ủi quần áo],[Hội họp, văn phòng],[Nghỉ dưỡng],[Nhà hàng],[Phục vụ trực tiếp tại nhà hàng],[Spa]
FROM
(SELECT DISTINCT d.ten_dv, k.ho_ten
FROM Khach_hang k, KH_DV kd, Dich_vu d
WHERE k.ma_kh=kd.ma_kh AND kd.ma_dv=d.ma_dv) AS BangNguON
PIVOT
(
COUNT(ten_dv)
FOR ten_dv IN ([Quầy bar], [Catering],[Đồ ăn mang về],[Đặt giữ chỗ nhà hàng],[Đưa đón sân bay],[Fitness center],[Sân golf và sân tennis],[Giao hàng tận nơi],[Giặt ủi quần áo],[Hội họp, văn phòng],[Nghỉ dưỡng],[Nhà hàng],[Phục vụ trực tiếp tại nhà hàng],[Spa])
) AS BangChuyen;

-- Phân quyền
-- Tạo tài khoản
create login mathanhan with password = '12345678'
create login trankhanhminh with password = '12345678'
create login nguyentrinhhieukien with password = '12345678'
create login luuquanghuy with password = '12345678'

-- Tạo user nhanvienthongkesolieu
CREATE USER nhanvienthongkesolieu FOR LOGIN mathanhan;
GRANT SELECT, UPDATE ON Nhan_vien_ql TO nhanvienthongkesolieu;
GRANT SELECT, UPDATE ON Loi_nhuan TO nhanvienthongkesolieu;
GRANT SELECT, UPDATE ON KH_DV TO nhanvienthongkesolieu;

-- Tạo user kysu
CREATE USER kysu FOR LOGIN trankhanhminh;
GRANT CREATE TABLE, CREATE PROCEDURE TO kysu;

-- Tạo user nhanvien
CREATE USER nhanvien FOR LOGIN luuquanghuy;
GRANT SELECT, INSERT, UPDATE ON Nhan_vien_ql TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON Chi_nhanh TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON Chu_so_huu TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON Khach_hang TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON KH_DV TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON CN_DV TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON Than_nhan TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON Loi_nhuan TO nhanvien;
GRANT SELECT, INSERT, UPDATE ON Dich_vu TO nhanvien;

-- Tạo user quanly
CREATE USER quanly FOR LOGIN nguyentrinhhieukien;
GRANT SELECT, INSERT, UPDATE, DELETE ON Nhan_vien_ql TO quanly WITH GRANT OPTION; 

