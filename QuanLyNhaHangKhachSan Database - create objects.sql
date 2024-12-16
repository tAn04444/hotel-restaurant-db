CREATE DATABASE [QuanLyNhaHangKhachSan]
USE [QuanLyNhaHangKhachSan]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chi_nhanh](
	[ma_cn] [nvarchar](10) NOT NULL,
	[ma_csh] [nvarchar](10) NULL,
	[ten_cn] [nvarchar](50) NULL,
	[dia_diem] [nvarchar](200) NULL,
	[loai_hinh] [nvarchar](20) NULL,
	[phan_khuc] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_cn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loi_nhuan](
	[ma_cn] [nvarchar](10) NOT NULL,
	[nam] [nvarchar](4) NOT NULL,
	[Loi_nhuan] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_cn] ASC,
	[nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[thongtinLoi_nhuan] (@nam nvarchar(4), @ma_cn nvarchar(11))
returns table
as
return select ten_cn, dia_diem, loai_hinh, phan_khuc, nam, Loi_nhuan from Chi_nhanh, Loi_nhuan where Chi_nhanh.ma_cn = Loi_nhuan.ma_cn and nam = @nam and Chi_nhanh.ma_cn = @ma_cn
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CN_DV](
	[ma_cn] [nvarchar](10) NOT NULL,
	[ma_dv] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_cn] ASC,
	[ma_dv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chu_so_huu](
	[ma_csh] [nvarchar](10) NOT NULL,
	[ten_csh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_csh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dich_vu](
	[ma_dv] [nvarchar](10) NOT NULL,
	[ten_dv] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_dv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KH_DV](
	[ma_dv] [nvarchar](10) NOT NULL,
	[ma_kh] [nvarchar](10) NOT NULL,
	[tg_bat_dau] [datetime] NULL,
	[tg_ket_thuc] [datetime] NULL,
	[phi_dv] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_dv] ASC,
	[ma_kh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khach_hang](
	[ma_kh] [nvarchar](10) NOT NULL,
	[ma_cn] [nvarchar](10) NULL,
	[ho_ten] [nvarchar](50) NULL,
	[gioi_tinh] [nvarchar](3) NULL,
	[ngay_sinh] [date] NULL,
	[SDT] [nvarchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_kh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhan_vien_ql](
	[ma_nvql] [nvarchar](10) NOT NULL,
	[ho_ten] [nvarchar](50) NULL,
	[gioi_tinh] [nvarchar](3) NULL,
	[ngay_sinh] [date] NULL,
	[luong] [float] NULL,
	[ma_tql] [nvarchar](10) NULL,
	[ma_cn] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_nvql] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Than_nhan](
	[ma_nvql] [nvarchar](10) NOT NULL,
	[ho_ten] [nvarchar](50) NOT NULL,
	[gioi_tinh] [nvarchar](3) NULL,
	[ngay_sinh] [date] NULL,
	[quan_he] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_nvql] ASC,
	[ho_ten] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KH_DV] ADD  DEFAULT (getdate()) FOR [tg_ket_thuc]
GO
ALTER TABLE [dbo].[CN_DV]  WITH CHECK ADD FOREIGN KEY([ma_cn])
REFERENCES [dbo].[Chi_nhanh] ([ma_cn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CN_DV]  WITH CHECK ADD FOREIGN KEY([ma_dv])
REFERENCES [dbo].[Dich_vu] ([ma_dv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chi_nhanh]  WITH CHECK ADD FOREIGN KEY([ma_csh])
REFERENCES [dbo].[Chu_so_huu] ([ma_csh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KH_DV]  WITH CHECK ADD FOREIGN KEY([ma_dv])
REFERENCES [dbo].[Dich_vu] ([ma_dv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KH_DV]  WITH CHECK ADD FOREIGN KEY([ma_kh])
REFERENCES [dbo].[Khach_hang] ([ma_kh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Khach_hang]  WITH CHECK ADD FOREIGN KEY([ma_cn])
REFERENCES [dbo].[Chi_nhanh] ([ma_cn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Loi_nhuan]  WITH CHECK ADD FOREIGN KEY([ma_cn])
REFERENCES [dbo].[Chi_nhanh] ([ma_cn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nhan_vien_ql]  WITH CHECK ADD FOREIGN KEY([ma_cn])
REFERENCES [dbo].[Chi_nhanh] ([ma_cn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nhan_vien_ql]  WITH CHECK ADD FOREIGN KEY([ma_tql])
REFERENCES [dbo].[Nhan_vien_ql] ([ma_nvql])
GO
ALTER TABLE [dbo].[Than_nhan]  WITH CHECK ADD FOREIGN KEY([ma_nvql])
REFERENCES [dbo].[Nhan_vien_ql] ([ma_nvql])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chi_nhanh]  WITH CHECK ADD CHECK  (([loai_hinh]=N'Khách sạn' OR [loai_hinh]=N'Nhà hàng'))
GO
ALTER TABLE [dbo].[Chi_nhanh]  WITH CHECK ADD CHECK  (([phan_khuc]>(0) AND [phan_khuc]<=(5)))
GO
ALTER TABLE [dbo].[Khach_hang]  WITH CHECK ADD CHECK  (([gioi_tinh]=N'Nam' OR [gioi_tinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[Khach_hang]  WITH CHECK ADD CHECK  ((len([ma_kh])=(10)))
GO
ALTER TABLE [dbo].[Loi_nhuan]  WITH CHECK ADD CHECK  ((len([nam])=(4)))
GO
ALTER TABLE [dbo].[Nhan_vien_ql]  WITH CHECK ADD CHECK  (([gioi_tinh]=N'Nam' OR [gioi_tinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[Nhan_vien_ql]  WITH CHECK ADD CHECK  (([luong]>(0)))
GO
ALTER TABLE [dbo].[Nhan_vien_ql]  WITH CHECK ADD CHECK  ((len([ma_nvql])=(10)))
GO
ALTER TABLE [dbo].[Nhan_vien_ql]  WITH CHECK ADD CHECK  ((len([ma_tql])=(10)))
GO
ALTER TABLE [dbo].[Than_nhan]  WITH CHECK ADD CHECK  (([gioi_tinh]=N'Nam' OR [gioi_tinh]=N'Nữ'))
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[check_VIP] (@ma_kh nvarchar(10), @ma_cn nvarchar (10))
as
begin 
	declare @dieukien int;
	select @dieukien = truyvancon.slsudungDV from (select Khach_hang.ma_kh, Khach_hang.ma_cn, COUNT(Khach_hang.ma_kh) as 'slsudungDV' from KH_DV, Khach_hang where KH_DV.ma_kh = Khach_hang.ma_kh group by Khach_hang.ma_kh,Khach_hang.ma_cn) truyvancon where @ma_kh=ma_kh and @ma_cn=ma_cn
	if ((select count(*) from Khach_hang where ma_kh = @ma_kh) = 0)
	begin
		print N'Mã khách hàng không tồn tại'
	end
	else
	begin
	if(@dieukien >= 20)
		begin
			print N'Mã khách hàng ' + @ma_kh + N' là V.I.P của chi nhánh có mã là ' + @ma_cn
		end
	else 
		begin
			print N'Mã khách hàng ' + @ma_kh + N' chưa đủ điều kiện V.I.P của chi nhánh có mã là ' + @ma_cn
		end
	end
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[restoreDatabase]
    @tencsdl NVARCHAR(100),
    @tenpath NVARCHAR(256)
AS
BEGIN
    BEGIN TRY
        RESTORE DATABASE @tencsdl FROM DISK = @tenpath WITH REPLACE; 
        PRINT 'Phục hồi dữ liệu thành công!';
    END TRY
    BEGIN CATCH
        PRINT 'Lỗi trong quá trình phục hồi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaoLuDuLieu]
    @tencsdl NVARCHAR(200),
    @tentaptin NVARCHAR(200)
AS
BEGIN
    BEGIN TRY
        BACKUP DATABASE @tencsdl TO DISK = @tentaptin;
        PRINT 'Sao lưu dữ liệu thành công!';
    END TRY
    BEGIN CATCH
        PRINT 'Lỗi trong quá trình sao lưu: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[insert_tuoi_nhan_vien] ON [dbo].[Nhan_vien_ql] FOR INSERT
AS
BEGIN
    DECLARE @tuoi INT;

    IF EXISTS (SELECT * FROM inserted WHERE gioi_tinh = N'Nam' AND (YEAR(GETDATE()) - YEAR(ngay_sinh) < 18 OR YEAR(GETDATE()) - YEAR(ngay_sinh) > 61))
    BEGIN
        RAISERROR('Nhân viên nam không được dưới 18 tuổi và không được lớn hơn độ tuổi nghỉ hưu là 61 tuổi', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE IF EXISTS (SELECT * FROM inserted WHERE gioi_tinh = N'Nữ' AND (YEAR(GETDATE()) - YEAR(ngay_sinh) < 18 OR YEAR(GETDATE()) - YEAR(ngay_sinh) > 56))
    BEGIN
        RAISERROR('Nhân viên nữ không được dưới 18 tuổi và không được lớn hơn độ tuổi nghỉ hưu là 56 tuổi', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO

ALTER TABLE [dbo].[Nhan_vien_ql] ENABLE TRIGGER [insert_tuoi_nhan_vien]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[check_tgkt_tgth] ON [dbo].[KH_DV]
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE tg_ket_thuc < tg_bat_dau)
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Thời gian thực hiện dịch vụ không được lớn hơn thời gian kết thúc dịch vụ', 16, 1);
    END
END
GO

ALTER TABLE [dbo].[KH_DV] ENABLE TRIGGER [check_tgkt_tgth]
GO