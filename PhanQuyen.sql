
USE QuanLyKhachSan

/*
=============================================
==================PHÂN QUY?N=================
=============================================
*/

--======Tạo vai trò========
CREATE ROLE QuanLy;

CREATE ROLE LeTan;

CREATE ROLE KeToan;
--=========================

--=======Tạo nguời dùng mẫu và gán vai trò==========
-- Tạo Login ở cấp máy chủ
USE master;
GO

CREATE LOGIN QuanLyLogin 
WITH PASSWORD = 'QuanLy', 
DEFAULT_DATABASE = QuanLyKhachSan;

CREATE LOGIN LeTanLogin 
WITH PASSWORD = 'LeTan', 
DEFAULT_DATABASE = QuanLyKhachSan;

CREATE LOGIN KeToanLogin 
WITH PASSWORD = 'KeToan', 
DEFAULT_DATABASE = QuanLyKhachSan;

-- Tạo User và gán vai trò trong QuanLyKhachSan
USE QuanLyKhachSan;
GO

CREATE USER NvQuanLy FOR LOGIN QuanLyLogin;
CREATE USER NvLeTan FOR LOGIN LeTanLogin;
CREATE USER NvKeToan FOR LOGIN KeToanLogin;

ALTER ROLE QuanLy ADD MEMBER NvQuanLy;
ALTER ROLE LeTan ADD MEMBER NvLeTan;
ALTER ROLE KeToan ADD MEMBER NvKeToan;

--===========Phân Quyền Cấp Ðối Tuợng===============
--Vai trò quản lý (toàn quyền)
-- Quyền trên bảng
GRANT SELECT, INSERT, UPDATE, DELETE ON NHANVIEN TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON TAIKHOAN TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON PHONG TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUDAT TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON PHIEUTHUE TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON HOADON TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON DICHVU TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETDV TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON PHUTHU TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETPHUTHU TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON KHUYENMAI TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON CHITIETKHUYENMAI TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON BOPHAN TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON QUYEN TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON LOAIPHONG TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON KIEUPHONG TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON TRANGTHAI TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON KHACHHANG TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON TIENICH TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON PHONG_TIENICH TO QuanLy;

-- Quyền view
GRANT SELECT ON vw_NhanVienTaiKhoan TO QuanLy;
GRANT SELECT ON vw_ThongTinPhong TO QuanLy;
GRANT SELECT ON vw_PhongTienIch TO QuanLy;
GRANT SELECT ON vw_KhachHangPhieuDat TO QuanLy;
GRANT SELECT ON vw_PhieuThueNhanVien TO QuanLy;
GRANT SELECT ON vw_HoaDonDichVu TO QuanLy;
GRANT SELECT ON vw_HoaDonPhuThu TO QuanLy;
GRANT SELECT ON vw_HoaDonKhuyenMai TO QuanLy;
GRANT SELECT ON vw_DoanhThuHoaDon TO QuanLy;
GRANT SELECT ON vw_PhongTrongTheoTang TO QuanLy;

--quyền procedure
GRANT EXECUTE ON pd_ThemNhanVien TO QuanLy;
GRANT EXECUTE ON pd_CapNhatTrangThaiPhong TO QuanLy;
GRANT EXECUTE ON pd_XoaPhieuDat TO QuanLy;
GRANT EXECUTE ON pd_ThemDichVuVaoHoaDon TO QuanLy;
GRANT EXECUTE ON pd_TinhTongTienHoaDon TO QuanLy;
GRANT EXECUTE ON pd_TimPhongTrong TO QuanLy;
GRANT EXECUTE ON pd_CapNhatKhachHang TO QuanLy;
GRANT EXECUTE ON pd_ThemKhuyenMaiVaoHoaDon TO QuanLy;
GRANT EXECUTE ON pd_ThongKeDoanhThuTheoThang TO QuanLy;
GRANT EXECUTE ON pd_XoaPhuThuKhoiHoaDon TO QuanLy;

--Vai trò lễ tân (Ðặt phòng, thuê phòng, thêm dịch vụ/phụ thu, xem thông tin co bản)
-- Quyền trên b?ng
GRANT SELECT, INSERT, UPDATE ON PHIEUDAT TO LeTan;
GRANT SELECT, INSERT, UPDATE ON PHIEUTHUE TO LeTan;
GRANT SELECT ON PHONG TO LeTan;
GRANT SELECT, INSERT ON CHITIETDV TO LeTan;
GRANT SELECT, INSERT ON CHITIETPHUTHU TO LeTan;
GRANT SELECT ON HOADON TO LeTan;
GRANT SELECT ON KHACHHANG TO LeTan;
GRANT SELECT ON DICHVU TO LeTan;
GRANT SELECT ON PHUTHU TO LeTan;
GRANT SELECT ON KHUYENMAI TO LeTan;
GRANT SELECT ON CHITIETKHUYENMAI TO LeTan;

-- Quyền trên view
GRANT SELECT ON vw_ThongTinPhong TO LeTan;
GRANT SELECT ON vw_KhachHangPhieuDat TO LeTan;
GRANT SELECT ON vw_PhieuThueNhanVien TO LeTan;
GRANT SELECT ON vw_HoaDonDichVu TO LeTan;
GRANT SELECT ON vw_HoaDonPhuThu TO LeTan;
GRANT SELECT ON vw_HoaDonKhuyenMai TO LeTan;
GRANT SELECT ON vw_PhongTrongTheoTang TO LeTan;

-- Quyền trên procedure
GRANT EXECUTE ON pd_CapNhatTrangThaiPhong TO LeTan;
GRANT EXECUTE ON pd_XoaPhieuDat TO LeTan;
GRANT EXECUTE ON pd_ThemDichVuVaoHoaDon TO LeTan;
GRANT EXECUTE ON pd_TimPhongTrong TO LeTan;
GRANT EXECUTE ON pd_CapNhatKhachHang TO LeTan;
GRANT EXECUTE ON pd_ThemKhuyenMaiVaoHoaDon TO LeTan;
GRANT EXECUTE ON pd_XoaPhuThuKhoiHoaDon TO LeTan;

--Vai trò kế toán (quyền lý hoá don, thống kê doanh thu, xem dvu/phụ thu/khuyến mãi)
-- Quyền trên bảng
GRANT SELECT, UPDATE ON HOADON TO KeToan;
GRANT SELECT ON CHITIETDV TO KeToan;
GRANT SELECT ON CHITIETPHUTHU TO KeToan;
GRANT SELECT ON CHITIETKHUYENMAI TO KeToan;
GRANT SELECT ON DICHVU TO KeToan;
GRANT SELECT ON PHUTHU TO KeToan;
GRANT SELECT ON KHUYENMAI TO KeToan;

-- Quyền trên view
GRANT SELECT ON vw_HoaDonDichVu TO KeToan;
GRANT SELECT ON vw_HoaDonPhuThu TO KeToan;
GRANT SELECT ON vw_HoaDonKhuyenMai TO KeToan;
GRANT SELECT ON vw_DoanhThuHoaDon TO KeToan;

-- Quy?n trên procedure
GRANT EXECUTE ON pd_TinhTongTienHoaDon TO KeToan;
GRANT EXECUTE ON pd_ThongKeDoanhThuTheoThang TO KeToan;

--================Bảo Vệ Cơ Sở Dữ Liệu=====================
--thu hồi quyền mặc định từ public
REVOKE ALL ON DATABASE::QuanLyKhachSan FROM public;

--Từ chối quyền không nhất thiết
-- Từ chối quyền ALTER trên tất cả bảng cho LeTan và KeToan
DENY ALTER ON OBJECT::NHANVIEN TO LeTan;
DENY ALTER ON OBJECT::TAIKHOAN TO LeTan;
DENY ALTER ON OBJECT::PHONG TO LeTan;
DENY ALTER ON OBJECT::PHIEUDAT TO LeTan;
DENY ALTER ON OBJECT::PHIEUTHUE TO LeTan;
DENY ALTER ON OBJECT::HOADON TO LeTan;
DENY ALTER ON OBJECT::DICHVU TO LeTan;
DENY ALTER ON OBJECT::CHITIETDV TO LeTan;
DENY ALTER ON OBJECT::PHUTHU TO LeTan;
DENY ALTER ON OBJECT::CHITIETPHUTHU TO LeTan;
DENY ALTER ON OBJECT::KHUYENMAI TO LeTan;
DENY ALTER ON OBJECT::CHITIETKHUYENMAI TO LeTan;
DENY ALTER ON OBJECT::BOPHAN TO LeTan;
DENY ALTER ON OBJECT::QUYEN TO LeTan;
DENY ALTER ON OBJECT::LOAIPHONG TO LeTan;
DENY ALTER ON OBJECT::KIEUPHONG TO LeTan;
DENY ALTER ON OBJECT::TRANGTHAI TO LeTan;
DENY ALTER ON OBJECT::KHACHHANG TO LeTan;
DENY ALTER ON OBJECT::TIENICH TO LeTan;
DENY ALTER ON OBJECT::PHONG_TIENICH TO LeTan;

DENY ALTER ON OBJECT::NHANVIEN TO KeToan;
DENY ALTER ON OBJECT::TAIKHOAN TO KeToan;
DENY ALTER ON OBJECT::PHONG TO KeToan;
DENY ALTER ON OBJECT::PHIEUDAT TO KeToan;
DENY ALTER ON OBJECT::PHIEUTHUE TO KeToan;
DENY ALTER ON OBJECT::HOADON TO KeToan;
DENY ALTER ON OBJECT::DICHVU TO KeToan;
DENY ALTER ON OBJECT::CHITIETDV TO KeToan;
DENY ALTER ON OBJECT::PHUTHU TO KeToan;
DENY ALTER ON OBJECT::CHITIETPHUTHU TO KeToan;
DENY ALTER ON OBJECT::KHUYENMAI TO KeToan;
DENY ALTER ON OBJECT::CHITIETKHUYENMAI TO KeToan;
DENY ALTER ON OBJECT::BOPHAN TO KeToan;
DENY ALTER ON OBJECT::QUYEN TO KeToan;
DENY ALTER ON OBJECT::LOAIPHONG TO KeToan;
DENY ALTER ON OBJECT::KIEUPHONG TO KeToan;
DENY ALTER ON OBJECT::TRANGTHAI TO KeToan;
DENY ALTER ON OBJECT::KHACHHANG TO KeToan;
DENY ALTER ON OBJECT::TIENICH TO KeToan;
DENY ALTER ON OBJECT::PHONG_TIENICH TO KeToan;

-- Từ chối quyền CREATE TABLE cho LeTan và KeToan
DENY CREATE TABLE TO LeTan;
DENY CREATE TABLE TO KeToan;


-- Kiểm tra quyền hiện tại
SELECT * FROM sys.database_permissions
WHERE grantee_principal_id IN (
    SELECT principal_id FROM sys.database_principals 
    WHERE name IN ('QuanLy', 'LeTan', 'KeToan')
);

/*
=======================================================
=====================Kiểm Tra Quyền====================
=======================================================
*/

--========Kiểm tra quyền QuanLy=======
--Login: QuanLyLoGin
--Password: QuanLy

USE QuanLyKhachSan;
GO

-- Kiểm tra quyền SELECT trên bảng NHANVIEN
SELECT * FROM NHANVIEN;

-- Kiểm tra quyền INSERT trên bảng PHONG
INSERT INTO PHONG (maPhong, soPhong, tang, maLoai, maKieu, maTT) 
VALUES ('P024', '503', 5, 'LP001', 'KP001', 'TT001');

-- Kiểm tra quyền UPDATE trên bảng KHACHHANG
UPDATE KHACHHANG 
SET SDT = '0987654321' 
WHERE maKH = 'KH001';

-- Kiểm tra quyền DELETE trên bảng PHIEUDAT
DELETE FROM PHIEUDAT 
WHERE maPD = 'PD001';

-- Kiểm tra quyền EXECUTE stored procedure
EXEC pd_ThemNhanVien 'NV027', 'BP002', N'Trần', N'Văn C', N'Nam', '1990-01-01', N'456 Trần Phú', '0987654321', 'c@gmail.com';

-- Kiểm tra quyền SELECT trên view
SELECT * FROM vw_ThongTinPhong;

--===============Kiểm Tra Quyền LeTan====================
--Login: LeTanLogin
--Password: LeTan

USE QuanLyKhachSan;
GO

-- Kiểm tra quyền SELECT trên bảng PHONG (được phép)
SELECT * FROM PHONG;

-- Kiểm tra quyền INSERT trên bảng PHIEUDAT (được phép)
INSERT INTO PHIEUDAT (maPD, maKH, maPhong, maTT, ngayBD, ngayKT) 
VALUES ('PD023', 'KH001', 'P001', 'TT002', '2025-03-26', '2025-03-28');

-- Kiểm tra quyền UPDATE trên bảng PHIEUTHUE (được phép)
UPDATE PHIEUTHUE 
SET ngayKT = '2025-03-29' 
WHERE maPT = 'PT001';

-- Kiểm tra quyền INSERT trên bảng CHITIETDV (được phép)
INSERT INTO CHITIETDV (maDV, maHD, soLuong) 
VALUES ('DV002', 'HD001', 1);

-- Kiểm tra quyền EXECUTE stored procedure sp_TimPhongTrong (được phép)
EXEC pd_TimPhongTrong '2025-03-26', '2025-03-28';

-- Kiểm tra quyền SELECT trên view vw_KhachHangPhieuDat (được phép)
SELECT * FROM vw_KhachHangPhieuDat;

-- Kiểm tra quyền INSERT trên bảng NHANVIEN (không được phép)
INSERT INTO NHANVIEN (maNV, maBP, hoNV, tenNV, gioiTinh, ngaySinh, diaChi, SDT, email) 
VALUES ('NV027', 'BP002', N'Lê', N'Thị D', N'Nữ', '1992-01-01', N'789 Nguyễn Trãi', '0912345678', 'd@gmail.com');

-- Kiểm tra quyền ALTER trên bảng PHONG (không được phép)
ALTER TABLE PHONG ADD testColumn INT;


--=====================Kiểm Tra Quyền KeToan=====================
--Login: KeToanLoGin
--Password: KeToan

USE QuanLyKhachSan;
GO

-- Kiểm tra quyền SELECT trên bảng HOADON (được phép)
SELECT * FROM HOADON;

-- Kiểm tra quyền UPDATE trên bảng HOADON (được phép)
UPDATE HOADON 
SET tongTien = 2500000 
WHERE maHD = 'HD001';

-- Kiểm tra quyền SELECT trên bảng CHITIETDV (được phép)
SELECT * FROM CHITIETDV;

-- Kiểm tra quyền EXECUTE stored procedure sp_ThongKeDoanhThuTheoThang (được phép)
EXEC pd_ThongKeDoanhThuTheoThang 3, 2025;

-- Kiểm tra quyền SELECT trên view vw_DoanhThuHoaDon (được phép)
SELECT * FROM vw_DoanhThuHoaDon;

-- Kiểm tra quyền INSERT trên bảng HOADON (được phép)
INSERT INTO HOADON (maHD, maPT, ngayLap, tongTien, maTT) 
VALUES ('HD022', 'PT001', '2025-03-19', 3000000, 'TT008');

-- Kiểm tra quyền DELETE trên bảng PHIEUDAT (được phép)
DELETE FROM PHIEUDAT 
WHERE maPD = 'PD001';

-- Kiểm tra quyền ALTER trên bảng HOADON (không được phép)
ALTER TABLE HOADON ADD testColumn INT;







