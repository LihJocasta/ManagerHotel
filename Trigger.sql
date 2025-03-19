
USE QuanLyKhachSan;

/*
=========================================================
==================XÂY DỰNG CÁC TRIGGER===================
=========================================================
*/

--1. Trigger cập nhật trạng thái phòng khi thêm phiếu đặt
--Tự động đổi trạng thái phòng sang "Đã đặt" khi thêm phiếu đặt mới
CREATE TRIGGER tg_CapNhatTrangThaiPhong_PhieuDat
ON PHIEUDAT
AFTER INSERT
AS
BEGIN
    UPDATE PHONG
    SET maTT = 'TT002' 
    FROM PHONG P
    JOIN inserted I ON P.maPhong = I.maPhong
    WHERE I.maTT IN ('TT002', 'TT006');
END;
-- Chạy test: 
INSERT INTO PHIEUDAT (maPD, maKH, maPhong, maTT, ngayBD, ngayKT) VALUES ('PD021', 'KH001', 'P001', 'TT002', '2025-03-25', '2025-03-27');

--2. Trigger kiểm tra thời gian hiệu lực khuyến mãi
--Ngăn chèn khuyến mãi vào hóa đơn nếu không trong thời gian hiệu lực
CREATE TRIGGER tg_KiemTraKhuyenMai
ON CHITIETKHUYENMAI
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted I
        JOIN HOADON HD ON I.maHD = HD.maHD
        JOIN KHUYENMAI KM ON I.maKM = KM.maKM
        WHERE HD.ngayLap NOT BETWEEN KM.tgBD AND KM.tgKT
    )
    BEGIN
        RAISERROR (N'Khuyến mãi không áp dụng được do không trong thời gian hiệu lực.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO CHITIETKHUYENMAI (maKM, maHD)
        SELECT maKM, maHD FROM inserted;
    END
END;


-- Chạy test: 
INSERT INTO CHITIETKHUYENMAI (maKM, maHD) VALUES ('KM002', 'HD001');

--3. Trigger ghi log khi xóa nhân viên
--Ghi lại thông tin nhân viên bị xóa vào bảng log (giả định có bảng LogNhanVien)
CREATE TABLE LogNhanVien (
    maNV VARCHAR(5),
    hoNV NVARCHAR(50),
    tenNV NVARCHAR(50),
    ngayXoa DATETIME
);
GO

CREATE TRIGGER trg_LogXoaNhanVien
ON NHANVIEN
INSTEAD OF DELETE
AS
BEGIN
    -- Xóa dữ liệu liên quan trong TAIKHOAN
    DELETE FROM TAIKHOAN WHERE maNV IN (SELECT maNV FROM deleted);

    -- Xóa dữ liệu liên quan trong PHIEUTHUE
    DELETE FROM PHIEUTHUE WHERE maNV IN (SELECT maNV FROM deleted);

    -- Ghi log
    INSERT INTO LogNhanVien (maNV, hoNV, tenNV, ngayXoa)
    SELECT maNV, hoNV, tenNV, GETDATE()
    FROM deleted;

    -- Xóa nhân viên
    DELETE FROM NHANVIEN WHERE maNV IN (SELECT maNV FROM deleted);
END;
GO

-- Chạy test: 
DELETE FROM NHANVIEN WHERE maNV = 'NV001';

--4. Trigger kiểm tra số lượng dịch vụ âm
--Ngăn cập nhật số lượng dịch vụ trong CHITIETDV thành giá trị âm
CREATE TRIGGER tg_KiemTraSoLuongDichVu
ON CHITIETDV
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE soLuong < 0)
    BEGIN
        RAISERROR ('Số lượng dịch vụ không thể âm.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
-- Chạy test: 
UPDATE CHITIETDV SET soLuong = -1 WHERE maDV = 'DV001' AND maHD = 'HD001'; 

--5. Trigger tự động cập nhật tổng tiền hóa đơn
--Cập nhật tongTien trong HOADON khi thêm dịch vụ mới vào CHITIETDV
CREATE TRIGGER tg_CapNhatTongTien_DichVu
ON CHITIETDV
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @maDV VARCHAR(5), @maHD VARCHAR(5), @soLuong INT;

    DECLARE cur CURSOR FOR 
        SELECT maDV, maHD, soLuong FROM inserted;
    OPEN cur;
    FETCH NEXT FROM cur INTO @maDV, @maHD, @soLuong;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF EXISTS (SELECT 1 FROM CHITIETDV WHERE maDV = @maDV AND maHD = @maHD)
        BEGIN
            UPDATE CHITIETDV
            SET soLuong = soLuong + @soLuong
            WHERE maDV = @maDV AND maHD = @maHD;

            UPDATE HOADON
            SET tongTien = tongTien + (@soLuong * (SELECT giaDV FROM DICHVU WHERE maDV = @maDV))
            WHERE maHD = @maHD;
        END
        ELSE
        BEGIN
            INSERT INTO CHITIETDV (maDV, maHD, soLuong)
            VALUES (@maDV, @maHD, @soLuong);

            UPDATE HOADON
            SET tongTien = tongTien + (@soLuong * (SELECT giaDV FROM DICHVU WHERE maDV = @maDV))
            WHERE maHD = @maHD;
        END

        FETCH NEXT FROM cur INTO @maDV, @maHD, @soLuong;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
GO

-- chạy test: 
INSERT INTO CHITIETDV (maDV, maHD, soLuong) VALUES ('DV001', 'HD001', 1);

--6. Trigger kiểm tra phòng trống trước khi thêm phiếu thuê
--Ngăn thêm phiếu thuê nếu phòng không còn trống
CREATE TRIGGER tg_KiemTraPhongTrong_PhieuThue
ON PHIEUTHUE
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted I
        JOIN PHIEUDAT PD ON PD.maPhong IN (
            SELECT maPhong 
            FROM PHONG 
            WHERE maTT != 'TT001' -- Không trống
        )
        WHERE I.ngayBD <= PD.ngayKT AND I.ngayKT >= PD.ngayBD
    )
    BEGIN
        RAISERROR ('Phòng không trống trong khoảng thời gian yêu cầu.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO PHIEUTHUE (maPT, maKH, maNV, ngayBD, ngayKT, loaiPT)
        SELECT maPT, maKH, maNV, ngayBD, ngayKT, loaiPT
        FROM inserted;
    END
END;

-- Chạy test: 
INSERT INTO PHIEUTHUE (maPT, maKH, maNV, ngayBD, ngayKT, loaiPT) VALUES ('PT021', 'KH001', 'NV001', '2025-03-25', '2025-03-27', N'Trực tiếp');

--7. Trigger tự động thêm tài khoản khi thêm nhân viên
--Tự động tạo tài khoản mặc định cho nhân viên mới trong TAIKHOAN
CREATE TRIGGER tg_TaoTaiKhoanNhanVien
ON NHANVIEN
AFTER INSERT
AS
BEGIN
    INSERT INTO TAIKHOAN (maNV, tenDN, matKhau, maQuyen)
    SELECT 
        maNV,
        LOWER(LEFT(hoNV, 1) + tenNV) + RIGHT(maNV, 2),
        '123456', 
        'Q002' --lễ tân
    FROM inserted;
END;

-- Chạy test: 
INSERT INTO NHANVIEN (maNV, maBP, hoNV, tenNV, gioiTinh, ngaySinh, diaChi, SDT, email) VALUES ('NV022', 'BP002', N'Nguyễn', N'Thị Mai', N'Nữ', '1995-05-10', N'123 Lê Lợi', '0912345678', 'mai@gmail.com');

--8. Trigger ngăn xóa hóa đơn đã thanh toán
--Ngăn xóa hóa đơn nếu trạng thái là "Đã thanh toán"
CREATE TRIGGER tg_NganXoaHoaDonDaThanhToan
ON HOADON
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE maTT = 'TT009') -- Đã thanh toán
    BEGIN
        RAISERROR ('Không thể xóa hóa đơn đã thanh toán.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        DELETE FROM HOADON WHERE maHD IN (SELECT maHD FROM deleted);
    END
END;
-- Chạy test: 
DELETE FROM HOADON WHERE maHD = 'HD001'; --sẽ lỗi nếu HD001 đã thanh toán

--9. Trigger cập nhật trạng thái hóa đơn khi thêm phụ thu
--Đổi trạng thái hóa đơn sang "Chưa thanh toán" khi thêm phụ thu mới
CREATE TRIGGER tg_CapNhatTrangThaiHoaDon_PhuThu
ON CHITIETPHUTHU
AFTER INSERT
AS
BEGIN
    UPDATE HOADON
    SET maTT = 'TT008'
    FROM HOADON HD
    JOIN inserted I ON HD.maHD = I.maHD
    WHERE HD.maTT != 'TT009'; 
END;

-- chạy test: 
INSERT INTO CHITIETPHUTHU (maPT, maHD, soLuong) VALUES ('PT001', 'HD002', 1);

--10. Trigger ghi log khi cập nhật giá dịch vụ
 --Ghi lại lịch sử thay đổi giá dịch vụ vào bảng log (giả định có bảng LogGiaDichVu)
 CREATE TABLE LogGiaDichVu (
    maDV VARCHAR(5),
    giaCu DECIMAL(15,2),
    giaMoi DECIMAL(15,2),
    ngayCapNhat DATETIME
);
GO

CREATE TRIGGER tg_LogCapNhatGiaDichVu
ON DICHVU
AFTER UPDATE
AS
BEGIN
    INSERT INTO LogGiaDichVu (maDV, giaCu, giaMoi, ngayCapNhat)
    SELECT 
        D.maDV,
        D.giaDV AS giaCu,
        I.giaDV AS giaMoi,
        GETDATE()
    FROM deleted D
    JOIN inserted I ON D.maDV = I.maDV
    WHERE D.giaDV != I.giaDV;
END;
-- chạy test: 
UPDATE DICHVU SET giaDV = 200000 WHERE maDV = 'DV001';