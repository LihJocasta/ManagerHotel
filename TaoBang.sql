﻿CREATE DATABASE QuanLyKhachSan;
GO

USE QuanLyKhachSan;

/*
=============================================
=================TẠO CÁC BẢNG================
=============================================
*/

-- 1. QUYEN
CREATE TABLE QUYEN (
    maQuyen NVARCHAR(20) PRIMARY KEY,
    tenQuyen NVARCHAR(50)
);

-- 2. BOPHAN
CREATE TABLE BOPHAN (
    maBP NVARCHAR(20) PRIMARY KEY,
    tenBP NVARCHAR(50)
);

-- 3. NHANVIEN
CREATE TABLE NHANVIEN (
    maNV NVARCHAR(20) PRIMARY KEY,
    maBP NVARCHAR(20),
    hoNV NVARCHAR(50),
    tenNV NVARCHAR(50),
    gioiTinh NVARCHAR(10),
    ngaySinh DATE,
    diaChi NVARCHAR(100),
    SDT NVARCHAR(15),
    email NVARCHAR(100),
    CONSTRAINT FK_NHANVIEN_BOPHAN FOREIGN KEY (maBP) REFERENCES BOPHAN(maBP)
);

-- 4. TAIKHOAN
CREATE TABLE TAIKHOAN (
    tenDN NVARCHAR(50) PRIMARY KEY,
    maQuyen NVARCHAR(20),
    maNV NVARCHAR(20),
    matKhau NVARCHAR(255),
    CONSTRAINT FK_TAIKHOAN_QUYEN FOREIGN KEY (maQuyen) REFERENCES QUYEN(maQuyen),
    CONSTRAINT FK_TAIKHOAN_NHANVIEN FOREIGN KEY (maNV) REFERENCES NHANVIEN(maNV)
);

-- 5. LOAIPHONG
CREATE TABLE LOAIPHONG (
    maLoai NVARCHAR(20) PRIMARY KEY,
    tenLoai NVARCHAR(50),
    giaNiemYet INT
);

-- 6. KIEUPHONG
CREATE TABLE KIEUPHONG (
    maKieu NVARCHAR(20) PRIMARY KEY,
    tenKieu NVARCHAR(50),
    soGiuong TINYINT
);

-- 7. TRANGTHAI
CREATE TABLE TRANGTHAI (
    maTT NVARCHAR(20) PRIMARY KEY,
    tenTT NVARCHAR(50)
);

-- 8. PHONG
CREATE TABLE PHONG (
    maPhong NVARCHAR(20) PRIMARY KEY,
    maLoai NVARCHAR(20),
    maKieu NVARCHAR(20),
    maTT NVARCHAR(20),
    tang INT,
    soPhong NVARCHAR(10),
    CONSTRAINT FK_PHONG_LOAIPHONG FOREIGN KEY (maLoai) REFERENCES LOAIPHONG(maLoai),
    CONSTRAINT FK_PHONG_KIEUPHONG FOREIGN KEY (maKieu) REFERENCES KIEUPHONG(maKieu),
    CONSTRAINT FK_PHONG_TRANGTHAI FOREIGN KEY (maTT) REFERENCES TRANGTHAI(maTT)
);

-- 9. KHACHHANG
CREATE TABLE KHACHHANG (
    maKH NVARCHAR(20) PRIMARY KEY,
    CCCD NVARCHAR(20),
    hoKH NVARCHAR(50),
    tenKH NVARCHAR(50),
    SDT NVARCHAR(15),
    gioiTinh NVARCHAR(10),
    email NVARCHAR(100),
    DC NVARCHAR(100),
    tenCongTy NVARCHAR(100)
);

-- 10. PHIEUDAT
CREATE TABLE PHIEUDAT (
    maPD NVARCHAR(20) PRIMARY KEY,
    maKH NVARCHAR(20),
    maPhong NVARCHAR(20),
    maTT NVARCHAR(20),
    ngayBD DATE,
    ngayKT DATE,
    CONSTRAINT FK_PHIEUDAT_KHACHHANG FOREIGN KEY (maKH) REFERENCES KHACHHANG(maKH),
    CONSTRAINT FK_PHIEUDAT_PHONG FOREIGN KEY (maPhong) REFERENCES PHONG(maPhong),
    CONSTRAINT FK_PHIEUDAT_TRANGTHAI FOREIGN KEY (maTT) REFERENCES TRANGTHAI(maTT)
);

-- 11. PHIEUTHUE
CREATE TABLE PHIEUTHUE (
    maPT NVARCHAR(20) PRIMARY KEY,
    maKH NVARCHAR(20),
    maNV NVARCHAR(20),
    ngayBD DATE,
    ngayKT DATE,
    loaiPT NVARCHAR(20),
    CONSTRAINT FK_PHIEUTHUE_KHACHHANG FOREIGN KEY (maKH) REFERENCES KHACHHANG(maKH),
    CONSTRAINT FK_PHIEUTHUE_NHANVIEN FOREIGN KEY (maNV) REFERENCES NHANVIEN(maNV)
);

-- 12. DICHVU
CREATE TABLE DICHVU (
    maDV NVARCHAR(20) PRIMARY KEY,
    tenDV NVARCHAR(50),
    giaDV INT
);

-- 13. KHUYENMAI
CREATE TABLE KHUYENMAI (
    maKM NVARCHAR(20) PRIMARY KEY, -- Sửa từ maKH thành maKM để tránh nhầm lẫn
    tenKM NVARCHAR(50),
    moTa NVARCHAR(MAX),
    tgBD DATE,
    tgKT DATE,
    phanTramGiam DECIMAL(5,2)
);

-- 14. HOADON
CREATE TABLE HOADON (
    maHD NVARCHAR(20) PRIMARY KEY,
    maPT NVARCHAR(20),
    maKH NVARCHAR(20),
    maTT NVARCHAR(20),
    ngayLap DATE,
    tongTien DECIMAL(18, 2),
    CONSTRAINT FK_HOADON_PHIEUTHUE FOREIGN KEY (maPT) REFERENCES PHIEUTHUE(maPT),
    CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (maKH) REFERENCES KHACHHANG(maKH),
    CONSTRAINT FK_HOADON_TRANGTHAI FOREIGN KEY (maTT) REFERENCES TRANGTHAI(maTT)
);

-- 15. PHUTHU
CREATE TABLE PHUTHU (
    maPT NVARCHAR(20) PRIMARY KEY, 
    tenPT NVARCHAR(50),
    donGia DECIMAL(10, 2)
);

-- 16. TIENICH
CREATE TABLE TIENICH (
    maTI NVARCHAR(20) PRIMARY KEY,
    tenTI NVARCHAR(50)
);

-- 17. PHONG_TIENICH
CREATE TABLE PHONG_TIENICH (
    maTI NVARCHAR(20),
    maPhong NVARCHAR(20),
    PRIMARY KEY (maTI, maPhong),
    CONSTRAINT FK_PHONGTIENICH_TIENICH FOREIGN KEY (maTI) REFERENCES TIENICH(maTI),
    CONSTRAINT FK_PHONGTIENICH_PHONG FOREIGN KEY (maPhong) REFERENCES PHONG(maPhong)
);

-- 18. CHITIETDV
CREATE TABLE CHITIETDV (
    maDV NVARCHAR(20),
    maHD NVARCHAR(20),
    soLuong INT,
    PRIMARY KEY (maDV, maHD),
    CONSTRAINT FK_CHITIETDV_DICHVU FOREIGN KEY (maDV) REFERENCES DICHVU(maDV),
    CONSTRAINT FK_CHITIETDV_HOADON FOREIGN KEY (maHD) REFERENCES HOADON(maHD)
);

-- 19. CHITIETPHUTHU
CREATE TABLE CHITIETPHUTHU (
    maPT NVARCHAR(20),
    maHD NVARCHAR(20),
    soLuong INT,
    PRIMARY KEY (maPT, maHD),
    CONSTRAINT FK_CHITIETPHUTHU_PHUTHU FOREIGN KEY (maPT) REFERENCES PHUTHU(maPT),
    CONSTRAINT FK_CHITIETPHUTHU_HOADON FOREIGN KEY (maHD) REFERENCES HOADON(maHD)
);

-- 20. CHITIETKHUYENMAI
CREATE TABLE CHITIETKHUYENMAI (
    maKM NVARCHAR(20), 
    maHD NVARCHAR(20),
    PRIMARY KEY (maKM, maHD),
    CONSTRAINT FK_CHITIETKHUYENMAI_KHUYENMAI FOREIGN KEY (maKM) REFERENCES KHUYENMAI(maKM),
    CONSTRAINT FK_CHITIETKHUYENMAI_HOADON FOREIGN KEY (maHD) REFERENCES HOADON(maHD)
);



