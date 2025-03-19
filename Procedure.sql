
USE QuanLyKhachSan;

/*
===================================================
================XÂY DỰNG CÁC PROCEDURE=============
===================================================
*/

--1. Thêm nhân viên mới
--Thêm một nhân viên vào bảng NHANVIEN

CREATE PROCEDURE pd_ThemNhanVien
    @maNV VARCHAR(5),
    @maBP VARCHAR(5),
    @hoNV NVARCHAR(50),
    @tenNV NVARCHAR(50),
    @gioiTinh NVARCHAR(5),
    @ngaySinh DATE,
    @diaChi NVARCHAR(100),
    @SDT VARCHAR(10),
    @email VARCHAR(50)
AS
BEGIN
    INSERT INTO NHANVIEN (maNV, maBP, hoNV, tenNV, gioiTinh, ngaySinh, diaChi, SDT, email)
    VALUES (@maNV, @maBP, @hoNV, @tenNV, @gioiTinh, @ngaySinh, @diaChi, @SDT, @email);
END;

-- Chạy test: 
EXEC pd_ThemNhanVien 'NV021', 'BP002', N'Nguyễn', N'Thị Mai', N'Nữ', '1995-05-10', N'123 Lê Lợi, Hà Nội', '0912345678', 'nguyenthimai@gmail.com';

--2. Cập nhật trạng thái phòng
--Cập nhật trạng thái của một phòng trong bảng PHONG
CREATE PROCEDURE pd_CapNhatTrangThaiPhong
    @maPhong VARCHAR(5),
    @maTT VARCHAR(5)
AS
BEGIN
    UPDATE PHONG
    SET maTT = @maTT
    WHERE maPhong = @maPhong;
END;


-- Chạy test: 
EXEC pd_CapNhatTrangThaiPhong 'P001', 'TT002'; 

--3. Xóa phiếu đặt phòng
--Xóa một phiếu đặt phòng khỏi bảng PHIEUDAT
CREATE PROCEDURE pd_XoaPhieuDat
    @maPD VARCHAR(5)
AS
BEGIN
    DELETE FROM PHIEUDAT
    WHERE maPD = @maPD;
END;

-- Chạy test: 
EXEC pd_XoaPhieuDat 'PD001';

--4. Thêm dịch vụ vào hóa đơn
--Thêm một dịch vụ vào bảng CHITIETDV cho một hóa đơn
CREATE PROCEDURE pd_ThemDichVuVaoHoaDon
    @maDV VARCHAR(5),
    @maHD VARCHAR(5),
    @soLuong INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM CHITIETDV WHERE maDV = @maDV AND maHD = @maHD)
    BEGIN
        UPDATE CHITIETDV
        SET soLuong = soLuong + @soLuong
        WHERE maDV = @maDV AND maHD = @maHD;
    END
    ELSE
    BEGIN
        INSERT INTO CHITIETDV (maDV, maHD, soLuong)
        VALUES (@maDV, @maHD, @soLuong);
    END
END;
GO

-- Chạy test: 
EXEC pd_ThemDichVuVaoHoaDon 'DV001', 'HD001', 2; 

--5. Tính tổng tiền hóa đơn
--Tính tổng tiền hóa đơn bao gồm tiền phòng, dịch vụ, phụ thu, và khuyến mãi
CREATE PROCEDURE pd_TinhTongTienHoaDon
    @maHD VARCHAR(5),
    @tongTien DECIMAL(15,2) OUTPUT
AS
BEGIN
    SELECT @tongTien = 
        HD.tongTien + 
        ISNULL(SUM(DV.giaDV * CTDV.soLuong), 0) + 
        ISNULL(SUM(PT.donGia * CTPT.soLuong), 0) - 
        ISNULL(SUM(HD.tongTien * KM.phanTramGiam / 100), 0)
    FROM HOADON HD
    LEFT JOIN CHITIETDV CTDV ON HD.maHD = CTDV.maHD
    LEFT JOIN DICHVU DV ON CTDV.maDV = DV.maDV
    LEFT JOIN CHITIETPHUTHU CTPT ON HD.maHD = CTPT.maHD
    LEFT JOIN PHUTHU PT ON CTPT.maPT = PT.maPT
    LEFT JOIN CHITIETKHUYENMAI CTKM ON HD.maHD = CTKM.maHD
    LEFT JOIN KHUYENMAI KM ON CTKM.maKM = KM.maKM
    WHERE HD.maHD = @maHD
    GROUP BY HD.tongTien;
END;


-- Chạy tesst: 
DECLARE @tong DECIMAL(15,2); 
EXEC sp_TinhTongTienHoaDon 'HD001', @tong OUTPUT; 
PRINT @tong;

--6. Tìm phòng trống theo ngày
--Tìm các phòng trống trong một khoảng thời gian
CREATE PROCEDURE pd_TimPhongTrong
    @ngayBD DATE,
    @ngayKT DATE
AS
BEGIN
    SELECT P.maPhong, P.soPhong, LP.tenLoai, KP.tenKieu, TT.tenTT
    FROM PHONG P
    JOIN LOAIPHONG LP ON P.maLoai = LP.maLoai
    JOIN KIEUPHONG KP ON P.maKieu = KP.maKieu
    JOIN TRANGTHAI TT ON P.maTT = TT.maTT
    WHERE P.maPhong NOT IN (
        SELECT PD.maPhong
        FROM PHIEUDAT PD
        WHERE (PD.ngayBD <= @ngayKT AND PD.ngayKT >= @ngayBD)
        AND PD.maTT IN ('TT002', 'TT006') 
    )
    AND TT.tenTT = N'Trống';
END;

-- CHạy test: 
EXEC pd_TimPhongTrong '2025-03-25', '2025-03-27';

--7. Cập nhật thông tin khách hàng
--Cập nhật thông tin liên lạc của khách hàng trong bảng KHACHHANG
CREATE PROCEDURE pd_CapNhatKhachHang
    @maKH VARCHAR(5),
    @SDT VARCHAR(10),
    @email VARCHAR(50),
    @DC NVARCHAR(100)
AS
BEGIN
    UPDATE KHACHHANG
    SET SDT = @SDT, email = @email, DC = @DC
    WHERE maKH = @maKH;
END;

-- Chạy test: 
EXEC PD_CapNhatKhachHang 'KH001', '0912345679', 'newemail@gmail.com', N'456 Lê Lợi, Hà Nội';

--8. Thêm khuyến mãi cho hóa đơn
--Áp dụng một khuyến mãi vào hóa đơn trong bảng CHITIETKHUYENMAI
CREATE PROCEDURE pd_ThemKhuyenMaiVaoHoaDon
    @maKM VARCHAR(5),
    @maHD VARCHAR(5)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM CHITIETKHUYENMAI WHERE maKM = @maKM AND maHD = @maHD)
    BEGIN
        PRINT N'Khuyến mãi này đã được áp dụng cho hóa đơn.';
    END
    ELSE
    BEGIN
        IF EXISTS (
            SELECT 1 
            FROM KHUYENMAI KM
            JOIN HOADON HD ON HD.ngayLap BETWEEN KM.tgBD AND KM.tgKT
            WHERE KM.maKM = @maKM AND HD.maHD = @maHD
        )
        BEGIN
            INSERT INTO CHITIETKHUYENMAI (maKM, maHD)
            VALUES (@maKM, @maHD);
            PRINT N'Đã áp dụng khuyến mãi thành công.';
        END
        ELSE
        BEGIN
            PRINT N'Khuyến mãi không áp dụng được do không trong thời gian hiệu lực.';
        END
    END
END;
GO

-- Chạy test: 
EXEC pd_ThemKhuyenMaiVaoHoaDon 'KM001', 'HD001';

--9. Thống kê doanh thu theo tháng
--Tính tổng doanh thu từ hóa đơn theo tháng
CREATE PROCEDURE pd_ThongKeDoanhThuTheoThang
    @thang INT,
    @nam INT
AS
BEGIN
    WITH DoanhThuChiTiet AS (
        SELECT 
            HD.maHD,
            HD.ngayLap,
            HD.tongTien,
            ISNULL(SUM(DV.giaDV * CTDV.soLuong), 0) AS tongTienDV,
            ISNULL(SUM(PT.donGia * CTPT.soLuong), 0) AS tongTienPT,
            ISNULL(SUM(HD.tongTien * KM.phanTramGiam / 100), 0) AS tongTienGiam
        FROM HOADON HD
        LEFT JOIN CHITIETDV CTDV ON HD.maHD = CTDV.maHD
        LEFT JOIN DICHVU DV ON CTDV.maDV = DV.maDV
        LEFT JOIN CHITIETPHUTHU CTPT ON HD.maHD = CTPT.maHD
        LEFT JOIN PHUTHU PT ON CTPT.maPT = PT.maPT
        LEFT JOIN CHITIETKHUYENMAI CTKM ON HD.maHD = CTKM.maHD
        LEFT JOIN KHUYENMAI KM ON CTKM.maKM = KM.maKM
        WHERE MONTH(HD.ngayLap) = @thang AND YEAR(HD.ngayLap) = @nam
        GROUP BY HD.maHD, HD.ngayLap, HD.tongTien
    )
    SELECT 
        MONTH(ngayLap) AS thang,
        YEAR(ngayLap) AS nam,
        SUM(tongTien + tongTienDV + tongTienPT - tongTienGiam) AS doanhThu
    FROM DoanhThuChiTiet
    GROUP BY MONTH(ngayLap), YEAR(ngayLap);
END;
GO
-- Chạy test: 
EXEC pd_ThongKeDoanhThuTheoThang 3, 2025;

--10. Xóa phụ thu khỏi hóa đơn
--Mục đích: Xóa một phụ thu khỏi hóa đơn trong bảng CHITIETPHUTHU
CREATE PROCEDURE pd_XoaPhuThuKhoiHoaDon
    @maPT VARCHAR(5),
    @maHD VARCHAR(5)
AS
BEGIN
    DELETE FROM CHITIETPHUTHU
    WHERE maPT = @maPT AND maHD = @maHD;
END;
-- CHạy test: 
EXEC pd_XoaPhuThuKhoiHoaDon 'PT001', 'HD001';