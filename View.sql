
USE QuanLyKhachSan;

/*
=========================================
===========XÂY DỰNG CÁC VIEW=============
=========================================
*/

--1. View danh sách nhân viên và thông tin tài khoản
--Hiển thị thông tin nhân viên cùng với quyền truy cập và tên bộ phận
CREATE VIEW vw_NhanVienTaiKhoan AS
SELECT 
    NV.maNV, 
    NV.hoNV, 
    NV.tenNV, 
    NV.gioiTinh, 
    NV.SDT, 
    NV.email, 
    BP.tenBP, 
    TK.tenDN, 
    Q.tenQuyen
FROM NHANVIEN NV
JOIN BOPHAN BP ON NV.maBP = BP.maBP
JOIN TAIKHOAN TK ON NV.maNV = TK.maNV
JOIN QUYEN Q ON TK.maQuyen = Q.maQuyen;

--2. View thông tin phòng và trạng thái
--Hiển thị thông tin chi tiết về phòng, bao gồm loại phòng, kiểu phòng, và trạng thái
CREATE VIEW vw_ThongTinPhong AS
SELECT 
    P.maPhong, 
    P.soPhong, 
    P.tang, 
    LP.tenLoai, 
    LP.giaNiemYet, 
    KP.tenKieu, 
    KP.soGiuong, 
    TT.tenTT
FROM PHONG P
JOIN LOAIPHONG LP ON P.maLoai = LP.maLoai
JOIN KIEUPHONG KP ON P.maKieu = KP.maKieu
JOIN TRANGTHAI TT ON P.maTT = TT.maTT;

--3. View danh sách tiện ích của từng phòng
--Hiển thị các phòng cùng danh sách tiện ích đi kèm
CREATE VIEW vw_PhongTienIch AS
SELECT 
    P.maPhong, 
    P.soPhong, 
    TI.tenTI
FROM PHONG P
JOIN PHONG_TIENICH PT ON P.maPhong = PT.maPhong
JOIN TIENICH TI ON PT.maTI = TI.maTI;

--4. View thông tin khách hàng và phiếu đặt phòng
--Hiển thị thông tin khách hàng cùng các phiếu đặt phòng của họ
CREATE VIEW vw_KhachHangPhieuDat AS
SELECT 
    KH.maKH, 
    KH.hoKH, 
    KH.tenKH, 
    KH.SDT, 
    KH.email, 
    PD.maPD, 
    PD.maPhong, 
    PD.ngayBD, 
    PD.ngayKT, 
    TT.tenTT
FROM KHACHHANG KH
JOIN PHIEUDAT PD ON KH.maKH = PD.maKH
JOIN TRANGTHAI TT ON PD.maTT = TT.maTT;

--5. View thông tin phiếu thuê và nhân viên xử lý
--Hiển thị thông tin phiếu thuê cùng nhân viên phụ trách
CREATE VIEW vw_PhieuThueNhanVien AS
SELECT 
    PT.maPT, 
    KH.hoKH, 
    KH.tenKH, 
    NV.hoNV, 
    NV.tenNV, 
    PT.ngayBD, 
    PT.ngayKT, 
    PT.loaiPT
FROM PHIEUTHUE PT
JOIN KHACHHANG KH ON PT.maKH = KH.maKH
JOIN NHANVIEN NV ON PT.maNV = NV.maNV;

--6. View chi tiết hóa đơn và dịch vụ sử dụng
--Hiển thị thông tin hóa đơn cùng các dịch vụ khách đã sử dụng
CREATE VIEW vw_HoaDonDichVu AS
SELECT 
    HD.maHD, 
    HD.maPT, 
    KH.hoKH, 
    KH.tenKH, 
    HD.ngayLap, 
    HD.tongTien, 
    TT.tenTT, 
    DV.tenDV, 
    CTDV.soLuong, 
    (DV.giaDV * CTDV.soLuong) AS thanhTienDV
FROM HOADON HD
JOIN KHACHHANG KH ON HD.maKH = KH.maKH
JOIN TRANGTHAI TT ON HD.maTT = TT.maTT
JOIN CHITIETDV CTDV ON HD.maHD = CTDV.maHD
JOIN DICHVU DV ON CTDV.maDV = DV.maDV;

--7. View hóa đơn và phụ thu
--Hiển thị thông tin hóa đơn cùng các khoản phụ thu áp dụng
CREATE VIEW vw_HoaDonPhuThu AS
SELECT 
    HD.maHD, 
    HD.maPT, 
    KH.hoKH, 
    KH.tenKH, 
    HD.ngayLap, 
    HD.tongTien, 
    TT.tenTT, 
    PT.tenPT, 
    CTPT.soLuong, 
    (PT.donGia * CTPT.soLuong) AS thanhTienPT
FROM HOADON HD
JOIN KHACHHANG KH ON HD.maKH = KH.maKH
JOIN TRANGTHAI TT ON HD.maTT = TT.maTT
JOIN CHITIETPHUTHU CTPT ON HD.maHD = CTPT.maHD
JOIN PHUTHU PT ON CTPT.maPT = PT.maPT;

--8. View hóa đơn và khuyến mãi
--Hiển thị thông tin hóa đơn cùng các khuyến mãi được áp dụng
CREATE VIEW vw_HoaDonKhuyenMai AS
SELECT 
    HD.maHD, 
    HD.maPT, 
    KH.hoKH, 
    KH.tenKH, 
    HD.ngayLap, 
    HD.tongTien, 
    TT.tenTT, 
    KM.tenKM, 
    KM.phanTramGiam, 
    (HD.tongTien * KM.phanTramGiam / 100) AS tienGiam
FROM HOADON HD
JOIN KHACHHANG KH ON HD.maKH = KH.maKH
JOIN TRANGTHAI TT ON HD.maTT = TT.maTT
JOIN CHITIETKHUYENMAI CTKM ON HD.maHD = CTKM.maHD
JOIN KHUYENMAI KM ON CTKM.maKM = KM.maKM;

--9. View tổng hợp doanh thu theo hóa đơn
--Hiển thị tổng doanh thu từ hóa đơn, bao gồm tiền phòng, dịch vụ, và phụ thu
CREATE VIEW vw_DoanhThuHoaDon AS
SELECT 
    HD.maHD, 
    HD.ngayLap, 
    HD.tongTien AS tongTienGoc,
    ISNULL(SUM(DV.giaDV * CTDV.soLuong), 0) AS tongTienDV,
    ISNULL(SUM(PT.donGia * CTPT.soLuong), 0) AS tongTienPT,
    ISNULL(SUM(HD.tongTien * KM.phanTramGiam / 100), 0) AS tongTienGiam,
    (HD.tongTien + ISNULL(SUM(DV.giaDV * CTDV.soLuong), 0) + ISNULL(SUM(PT.donGia * CTPT.soLuong), 0) - ISNULL(SUM(HD.tongTien * KM.phanTramGiam / 100), 0)) AS doanhThuThucTe
FROM HOADON HD
LEFT JOIN CHITIETDV CTDV ON HD.maHD = CTDV.maHD
LEFT JOIN DICHVU DV ON CTDV.maDV = DV.maDV
LEFT JOIN CHITIETPHUTHU CTPT ON HD.maHD = CTPT.maHD
LEFT JOIN PHUTHU PT ON CTPT.maPT = PT.maPT
LEFT JOIN CHITIETKHUYENMAI CTKM ON HD.maHD = CTKM.maHD
LEFT JOIN KHUYENMAI KM ON CTKM.maKM = KM.maKM
GROUP BY HD.maHD, HD.ngayLap, HD.tongTien;

--10. View thống kê phòng trống theo tầng
--Hiển thị số lượng phòng trống theo từng tầng
CREATE VIEW vw_PhongTrongTheoTang AS
SELECT 
    P.tang, 
    COUNT(P.maPhong) AS soPhongTrong
FROM PHONG P
JOIN TRANGTHAI TT ON P.maTT = TT.maTT
WHERE TT.tenTT = N'Trống'
GROUP BY P.tang;

/*
=======================CHẠY KIỂM TRA=====================
*/
USE QuanLyKhachSan;
GO

PRINT '1. vw_NhanVienTaiKhoan';
SELECT * FROM vw_NhanVienTaiKhoan;
PRINT '2. vw_ThongTinPhong';
SELECT * FROM vw_ThongTinPhong;
PRINT '3. vw_PhongTienIch';
SELECT * FROM vw_PhongTienIch;
PRINT '4. vw_KhachHangPhieuDat';
SELECT * FROM vw_KhachHangPhieuDat;
PRINT '5. vw_PhieuThueNhanVien';
SELECT * FROM vw_PhieuThueNhanVien;
PRINT '6. vw_HoaDonDichVu';
SELECT * FROM vw_HoaDonDichVu;
PRINT '7. vw_HoaDonPhuThu';
SELECT * FROM vw_HoaDonPhuThu;
PRINT '8. vw_HoaDonKhuyenMai';
SELECT * FROM vw_HoaDonKhuyenMai;
PRINT '9. vw_DoanhThuHoaDon';
SELECT * FROM vw_DoanhThuHoaDon;
PRINT '10. vw_PhongTrongTheoTang';
SELECT * FROM vw_PhongTrongTheoTang;