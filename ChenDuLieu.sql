USE QuanLyKhachSan;

/*
=========================================================================================
===================Chèn Dữ Liệu Vào Các Bảng (20 dữ liệu cho mỗi bảng)===================
=========================================================================================
*/

--1. Bảng QUYEN
INSERT INTO QUYEN (maQuyen, tenQuyen)
VALUES 
    ('Q001', N'Quản lý'),
    ('Q002', N'Lễ tân');

--2. Bảng BOPHAN
INSERT INTO BOPHAN (maBP, tenBP)
VALUES 
    ('BP001', N'Quản lý'),
    ('BP002', N'Lễ tân'),
    ('BP003', N'Buồng phòng'),
    ('BP004', N'Kế toán');

--3. Bảng NHANVIEN
INSERT INTO NHANVIEN (maNV, maBP, hoNV, tenNV, gioiTinh, ngaySinh, diaChi, SDT, email)
VALUES 
    ('NV001', 'BP001', N'Nguyễn', N'Văn Hùng', N'Nam', '1985-03-15', N'123 Lê Lợi, Hà Nội', '0912345678', 'nguyenvanhung@gmail.com'),
    ('NV002', 'BP001', N'Trần', N'Thị Mai', N'Nữ', '1990-07-22', N'45 Nguyễn Huệ, TP.HCM', '0987654321', 'tranthimai@gmail.com'),
    ('NV003', 'BP002', N'Lê', N'Hoàng Anh', N'Nam', '1995-11-10', N'78 Trần Phú, Đà Nẵng', '0935123456', 'lehoanganh@gmail.com'),
    ('NV004', 'BP002', N'Phạm', N'Thị Ngọc', N'Nữ', '1993-04-18', N'56 Hùng Vương, Huế', '0908765432', 'phamthingoc@gmail.com'),
    ('NV005', 'BP002', N'Hoàng', N'Văn Nam', N'Nam', '1988-09-05', N'12 Pasteur, Nha Trang', '0921345678', 'hoangvannam@gmail.com'),
    ('NV006', 'BP003', N'Ngô', N'Thị Lan', N'Nữ', '1997-12-25', N'34 Bà Triệu, Hà Nội', '0978123456', 'ngothilan@gmail.com'),
    ('NV007', 'BP003', N'Đỗ', N'Văn Bình', N'Nam', '1992-06-30', N'67 Nguyễn Trãi, TP.HCM', '0945678901', 'dovanbinh@gmail.com'),
    ('NV008', 'BP003', N'Bùi', N'Thị Hương', N'Nữ', '1994-08-14', N'89 Lý Thường Kiệt, Đà Nẵng', '0918765432', 'buithihuong@gmail.com'),
    ('NV009', 'BP003', N'Vũ', N'Quốc Tuấn', N'Nam', '1989-02-20', N'23 Lê Đại Hành, Huế', '0932345678', 'vuquoctuan@gmail.com'),
    ('NV010', 'BP004', N'Đặng', N'Thị Thu', N'Nữ', '1991-10-08', N'45 Trần Hưng Đạo, Hà Nội', '0965432109', 'dangthithu@gmail.com'),
    ('NV011', 'BP004', N'Lương', N'Văn Long', N'Nam', '1987-05-12', N'78 Nguyễn Du, TP.HCM', '0901234567', 'luongvanlong@gmail.com'),
    ('NV012', 'BP004', N'Hà', N'Thị Minh', N'Nữ', '1996-03-27', N'12 Hai Bà Trưng, Đà Nẵng', '0923456789', 'hathiminh@gmail.com'),
    ('NV013', 'BP002', N'Tô', N'Văn Khoa', N'Nam', '1990-01-15', N'34 Lê Thánh Tôn, Nha Trang', '0948765432', 'tovankhoa@gmail.com'),
    ('NV014', 'BP003', N'Nguyễn', N'Thị Hồng', N'Nữ', '1993-07-19', N'56 Phạm Ngũ Lão, Huế', '0971234567', 'nguyenthihong@gmail.com'),
    ('NV015', 'BP001', N'Trần', N'Văn Phong', N'Nam', '1986-11-03', N'89 Nguyễn Thị Minh Khai, TP.HCM', '0913456789', 'tranvanphong@gmail.com'),
    ('NV016', 'BP002', N'Phan', N'Thị Yến', N'Nữ', '1995-09-28', N'23 Lê Lai, Hà Nội', '0936789012', 'phanthiyen@gmail.com'),
    ('NV017', 'BP003', N'Lê', N'Văn Đức', N'Nam', '1988-12-12', N'45 Trần Quốc Toản, Đà Nẵng', '0902345678', 'levanduc@gmail.com'),
    ('NV018', 'BP004', N'Võ', N'Thị Thảo', N'Nữ', '1992-02-05', N'67 Hùng Vương, Nha Trang', '0967890123', 'vothithao@gmail.com'),
    ('NV019', 'BP001', N'Nguyễn', N'Văn Tâm', N'Nam', '1989-06-17', N'12 Nguyễn Huệ, Huế', '0925678901', 'nguyenvantam@gmail.com'),
    ('NV020', 'BP002', N'Trần', N'Thị Linh', N'Nữ', '1994-04-23', N'34 Lê Duẩn, TP.HCM', '0941234567', 'tranthilinh@gmail.com');

--4, Bảng TAIKHOAN
INSERT INTO TAIKHOAN (tenDN, maQuyen, maNV, matKhau)
VALUES 
    ('hungnv', 'Q001', 'NV001', 'hashed_password_001'),
    ('maitt', 'Q001', 'NV002', 'hashed_password_002'),
    ('anhlh', 'Q002', 'NV003', 'hashed_password_003'),
    ('ngocpt', 'Q002', 'NV004', 'hashed_password_004'),
    ('namhv', 'Q002', 'NV005', 'hashed_password_005'),
    ('lannt', 'Q002', 'NV006', 'hashed_password_006'),
    ('binhdv', 'Q002', 'NV007', 'hashed_password_007'),
    ('huongbt', 'Q002', 'NV008', 'hashed_password_008'),
    ('tuanvq', 'Q002', 'NV009', 'hashed_password_009'),
    ('thudt', 'Q001', 'NV010', 'hashed_password_010'),
    ('longlv', 'Q001', 'NV011', 'hashed_password_011'),
    ('minhht', 'Q001', 'NV012', 'hashed_password_012'),
    ('khoatv', 'Q002', 'NV013', 'hashed_password_013'),
    ('hongnt', 'Q002', 'NV014', 'hashed_password_014'),
    ('phongtv', 'Q001', 'NV015', 'hashed_password_015'),
    ('yenpt', 'Q002', 'NV016', 'hashed_password_016'),
    ('duclv', 'Q002', 'NV017', 'hashed_password_017'),
    ('thaovt', 'Q001', 'NV018', 'hashed_password_018'),
    ('tamnv', 'Q001', 'NV019', 'hashed_password_019'),
    ('linhtt', 'Q002', 'NV020', 'hashed_password_020');

--5. Bảng LOAIPHONE
INSERT INTO LOAIPHONG (maLoai, tenLoai, giaNiemYet)
VALUES 
    ('LP001', N'Standard', 600000),
    ('LP002', N'Superior', 900000),
    ('LP003', N'Deluxe', 1300000),
    ('LP004', N'Premium', 1800000),
    ('LP005', N'Suite', 2500000),
    ('LP006', N'Family', 2000000),
    ('LP007', N'Studio', 1500000),
    ('LP008', N'VIP', 3500000);

--6. Bảng KIEUPHONG
INSERT INTO KIEUPHONG (maKieu, tenKieu, soGiuong)
VALUES 
    ('KP001', N'Phòng đơn', 1),
    ('KP002', N'Phòng đôi', 2),
    ('KP003', N'Phòng twin', 2), -- 2 giường đơn
    ('KP004', N'Phòng gia đình', 3),
    ('KP005', N'Phòng view biển', 2),
    ('KP006', N'Phòng ban công', 2);

--7. Bảng TRANGTHAI
INSERT INTO TRANGTHAI (maTT, tenTT)
VALUES 
    ('TT001', N'Trống'),              
    ('TT002', N'Đã đặt'),             
    ('TT003', N'Đang sử dụng'),       
    ('TT004', N'Bảo trì'),           
    ('TT005', N'Đang dọn dẹp'),       
    ('TT006', N'Đã xác nhận'),       
    ('TT007', N'Hủy'),               
    ('TT008', N'Chưa thanh toán'),   
    ('TT009', N'Đã thanh toán'),      
    ('TT010', N'Quá hạn');            

--8, Bảng PHONG
INSERT INTO PHONG (maPhong, maLoai, maKieu, maTT, tang, soPhong)
VALUES 
    ('P001', 'LP001', 'KP001', 'TT001', 1, '101'),
    ('P002', 'LP001', 'KP002', 'TT002', 1, '102'), 
    ('P003', 'LP002', 'KP003', 'TT003', 1, '103'), 
    ('P004', 'LP002', 'KP001', 'TT005', 1, '104'), 
    ('P005', 'LP003', 'KP005', 'TT001', 2, '201'), 
    ('P006', 'LP003', 'KP006', 'TT003', 2, '202'), 
    ('P007', 'LP004', 'KP002', 'TT002', 2, '203'),
    ('P008', 'LP004', 'KP003', 'TT004', 2, '204'), 
    ('P009', 'LP005', 'KP002', 'TT001', 3, '301'), 
    ('P010', 'LP005', 'KP005', 'TT003', 3, '302'), 
    ('P011', 'LP006', 'KP004', 'TT002', 3, '303'), 
    ('P012', 'LP006', 'KP004', 'TT001', 3, '304'), 
    ('P013', 'LP007', 'KP001', 'TT005', 4, '401'), 
    ('P014', 'LP007', 'KP002', 'TT003', 4, '402'), 
    ('P015', 'LP008', 'KP005', 'TT001', 4, '403'), 
    ('P016', 'LP008', 'KP006', 'TT002', 4, '404'), 
    ('P017', 'LP001', 'KP003', 'TT001', 5, '501'), 
    ('P018', 'LP002', 'KP002', 'TT003', 5, '502'), 
    ('P019', 'LP003', 'KP001', 'TT004', 5, '503'), 
    ('P020', 'LP004', 'KP006', 'TT001', 5, '504'); 

--9. Bảng KHACHHANg
INSERT INTO KHACHHANG (maKH, CCCD, hoKH, tenKH, SDT, gioiTinh, email, DC, tenCongTy)
VALUES 
    ('KH001', '012345678901', N'Nguyễn', N'Văn An', '0912345678', N'Nam', 'nguyenvanan@gmail.com', N'123 Lê Lợi, Hà Nội', N'Công ty ABC'),
    ('KH002', '012345678902', N'Trần', N'Thị Bình', '0987654321', N'Nữ', 'tranthibinh@gmail.com', N'45 Nguyễn Huệ, TP.HCM', NULL),
    ('KH003', '012345678903', N'Lê', N'Hoàng Cường', '0935123456', N'Nam', 'lehoangcuong@gmail.com', N'78 Trần Phú, Đà Nẵng', N'Công ty XYZ'),
    ('KH004', '012345678904', N'Phạm', N'Thị Dung', '0908765432', N'Nữ', 'phamthidung@gmail.com', N'56 Hùng Vương, Huế', NULL),
    ('KH005', '012345678905', N'Hoàng', N'Văn Em', '0921345678', N'Nam', 'hoangvanem@gmail.com', N'12 Pasteur, Nha Trang', N'Công ty DEF'),
    ('KH006', '012345678906', N'Ngô', N'Thị Fleur', '0978123456', N'Nữ', 'ngothifleur@gmail.com', N'34 Bà Triệu, Hà Nội', NULL),
    ('KH007', '012345678907', N'Đỗ', N'Văn Giang', '0945678901', N'Nam', 'dovangiang@gmail.com', N'67 Nguyễn Trãi, TP.HCM', N'Công ty GHI'),
    ('KH008', '012345678908', N'Bùi', N'Thị Hoa', '0918765432', N'Nữ', 'buithihoa@gmail.com', N'89 Lý Thường Kiệt, Đà Nẵng', NULL),
    ('KH009', '012345678909', N'Vũ', N'Quốc Hùng', '0932345678', N'Nam', 'vuquochung@gmail.com', N'23 Lê Đại Hành, Huế', N'Công ty JKL'),
    ('KH010', '012345678910', N'Đặng', N'Thị In', '0965432109', N'Nữ', 'dangthiin@gmail.com', N'45 Trần Hưng Đạo, Hà Nội', NULL),
    ('KH011', '012345678911', N'Lương', N'Văn Khánh', '0901234567', N'Nam', 'luongvankhanh@gmail.com', N'78 Nguyễn Du, TP.HCM', N'Công ty MNO'),
    ('KH012', '012345678912', N'Hà', N'Thị Lan', '0923456789', N'Nữ', 'hathilan@gmail.com', N'12 Hai Bà Trưng, Đà Nẵng', NULL),
    ('KH013', '012345678913', N'Tô', N'Văn Minh', '0948765432', N'Nam', 'tovanminh@gmail.com', N'34 Lê Thánh Tôn, Nha Trang', N'Công ty PQR'),
    ('KH014', '012345678914', N'Nguyễn', N'Thị Ngọc', '0971234567', N'Nữ', 'nguyenthingoc@gmail.com', N'56 Phạm Ngũ Lão, Huế', NULL),
    ('KH015', '012345678915', N'Trần', N'Văn Phong', '0913456789', N'Nam', 'tranvanphong@gmail.com', N'89 Nguyễn Thị Minh Khai, TP.HCM', N'Công ty STU'),
    ('KH016', '012345678916', N'Phan', N'Thị Quỳnh', '0936789012', N'Nữ', 'phanthiquynh@gmail.com', N'23 Lê Lai, Hà Nội', NULL),
    ('KH017', '012345678917', N'Lê', N'Văn Rớt', '0902345678', N'Nam', 'levanrot@gmail.com', N'45 Trần Quốc Toản, Đà Nẵng', N'Công ty VWX'),
    ('KH018', '012345678918', N'Võ', N'Thị Sen', '0967890123', N'Nữ', 'vothisen@gmail.com', N'67 Hùng Vương, Nha Trang', NULL),
    ('KH019', '012345678919', N'Nguyễn', N'Văn Tèo', '0925678901', N'Nam', 'nguyenvanteo@gmail.com', N'12 Nguyễn Huệ, Huế', N'Công ty YZA'),
    ('KH020', '012345678920', N'Trần', N'Thị Út', '0941234567', N'Nữ', 'tranthiut@gmail.com', N'34 Lê Duẩn, TP.HCM', NULL);

--10. Bảng PHIEUDAT
INSERT INTO PHIEUDAT (maPD, maKH, maPhong, maTT, ngayBD, ngayKT)
VALUES 
    ('PD001', 'KH001', 'P001', 'TT006', '2025-03-20', '2025-03-22'), 
    ('PD002', 'KH002', 'P002', 'TT002', '2025-03-21', '2025-03-23'), 
    ('PD003', 'KH003', 'P003', 'TT007', '2025-03-19', '2025-03-20'), 
    ('PD004', 'KH004', 'P005', 'TT006', '2025-03-22', '2025-03-25'), 
    ('PD005', 'KH005', 'P007', 'TT002', '2025-03-23', '2025-03-26'), 
    ('PD006', 'KH006', 'P009', 'TT006', '2025-03-20', '2025-03-24'),
    ('PD007', 'KH007', 'P011', 'TT002', '2025-03-21', '2025-03-23'), 
    ('PD008', 'KH008', 'P012', 'TT006', '2025-03-22', '2025-03-25'), 
    ('PD009', 'KH009', 'P015', 'TT007', '2025-03-19', '2025-03-21'), 
    ('PD010', 'KH010', 'P016', 'TT002', '2025-03-23', '2025-03-27'), 
    ('PD011', 'KH011', 'P017', 'TT006', '2025-03-20', '2025-03-22'), 
    ('PD012', 'KH012', 'P020', 'TT002', '2025-03-21', '2025-03-24'), 
    ('PD013', 'KH013', 'P001', 'TT007', '2025-03-22', '2025-03-23'), 
    ('PD014', 'KH014', 'P005', 'TT006', '2025-03-23', '2025-03-26'), 
    ('PD015', 'KH015', 'P009', 'TT002', '2025-03-24', '2025-03-27'), 
    ('PD016', 'KH016', 'P012', 'TT006', '2025-03-20', '2025-03-23'),
    ('PD017', 'KH017', 'P015', 'TT002', '2025-03-21', '2025-03-25'), 
    ('PD018', 'KH018', 'P017', 'TT007', '2025-03-22', '2025-03-24'),
    ('PD019', 'KH019', 'P020', 'TT006', '2025-03-23', '2025-03-26'), 
    ('PD020', 'KH020', 'P002', 'TT002', '2025-03-24', '2025-03-27'); 

--Bảng 11. Bảng PHIEUTHUE
INSERT INTO PHIEUTHUE (maPT, maKH, maNV, ngayBD, ngayKT, loaiPT)
VALUES 
    ('PT001', 'KH001', 'NV003', '2025-03-20', '2025-03-22', N'Trực tiếp'), 
    ('PT002', 'KH002', 'NV004', '2025-03-21', '2025-03-23', N'Đặt trước'), 
    ('PT003', 'KH003', 'NV005', '2025-03-19', '2025-03-20', N'Trực tiếp'),
    ('PT004', 'KH004', 'NV016', '2025-03-22', '2025-03-25', N'Đặt trước'), 
    ('PT005', 'KH005', 'NV013', '2025-03-23', '2025-03-26', N'Trực tiếp'),
    ('PT006', 'KH006', 'NV006', '2025-03-20', '2025-03-24', N'Đặt trước'), 
    ('PT007', 'KH007', 'NV007', '2025-03-21', '2025-03-23', N'Trực tiếp'),
    ('PT008', 'KH008', 'NV008', '2025-03-22', '2025-03-25', N'Đặt trước'), 
    ('PT009', 'KH009', 'NV009', '2025-03-19', '2025-03-21', N'Trực tiếp'),
    ('PT010', 'KH010', 'NV020', '2025-03-23', '2025-03-27', N'Đặt trước'), 
    ('PT011', 'KH011', 'NV017', '2025-03-20', '2025-03-22', N'Trực tiếp'),
    ('PT012', 'KH012', 'NV013', '2025-03-21', '2025-03-24', N'Đặt trước'), 
    ('PT013', 'KH013', 'NV004', '2025-03-22', '2025-03-23', N'Trực tiếp'),
    ('PT014', 'KH014', 'NV016', '2025-03-23', '2025-03-26', N'Đặt trước'),
    ('PT015', 'KH015', 'NV005', '2025-03-24', '2025-03-27', N'Trực tiếp'),
    ('PT016', 'KH016', 'NV006', '2025-03-20', '2025-03-23', N'Đặt trước'), 
    ('PT017', 'KH017', 'NV007', '2025-03-21', '2025-03-25', N'Trực tiếp'),
    ('PT018', 'KH018', 'NV008', '2025-03-22', '2025-03-24', N'Đặt trước'), 
    ('PT019', 'KH019', 'NV009', '2025-03-23', '2025-03-26', N'Trực tiếp'),
    ('PT020', 'KH020', 'NV020', '2025-03-24', '2025-03-27', N'Đặt trước'); 

--12. Bảng DICHVU
INSERT INTO DICHVU (maDV, tenDV, giaDV)
VALUES 
    ('DV001', N'Ăn sáng buffet', 150000),
    ('DV002', N'Giặt ủi quần áo', 50000),
    ('DV003', N'Mini bar', 100000),
    ('DV004', N'Đưa đón sân bay', 300000),
    ('DV005', N'Thuê xe máy', 120000),
    ('DV006', N'Thuê xe ô tô', 500000),
    ('DV007', N'Massage thư giãn', 400000),
    ('DV008', N'Spa toàn thân', 800000),
    ('DV009', N'Phục vụ đồ ăn tại phòng', 200000),
    ('DV010', N'Nước uống đóng chai', 20000),
    ('DV011', N'Đặt tour tham quan', 600000),
    ('DV012', N'Vé bơi hồ bơi', 100000),
    ('DV013', N'Phòng gym', 150000),
    ('DV014', N'Sauna', 200000),
    ('DV015', N'Internet tốc độ cao', 50000),
    ('DV016', N'In ấn tài liệu', 10000),
    ('DV017', N'Đặt vé máy bay', 100000),
    ('DV018', N'Đặt vé tàu', 80000),
    ('DV019', N'Giường phụ', 300000),
    ('DV020', N'Check-out muộn', 200000);

--Bảng 13. Bảng KHUYENMAI 
INSERT INTO KHUYENMAI (maKM, tenKM, moTa, tgBD, tgKT, phanTramGiam)
VALUES 
    ('KM001', N'Khuyến mãi mùa xuân', N'Giảm giá cho đặt phòng sớm', '2025-02-01', '2025-03-31', 10.00),
    ('KM002', N'Ưu đãi lễ 30/4', N'Giảm giá dịp lễ', '2025-04-25', '2025-05-05', 15.00),
    ('KM003', N'Hè rực rỡ', N'Giảm giá mùa hè', '2025-06-01', '2025-08-31', 20.00),
    ('KM004', N'Khách hàng thân thiết', N'Ưu đãi cho khách cũ', '2025-01-01', '2025-12-31', 5.00),
    ('KM005', N'Tết Nguyên Đán', N'Giảm giá dịp Tết', '2025-01-25', '2025-02-10', 25.00),
    ('KM006', N'Ngày Quốc khánh', N'Ưu đãi 2/9', '2025-08-30', '2025-09-05', 15.00),
    ('KM007', N'Đặt phòng dài ngày', N'Giảm giá cho ở trên 5 ngày', '2025-03-01', '2025-12-31', 10.00),
    ('KM008', N'Khuyến mãi cuối tuần', N'Giảm giá cuối tuần', '2025-01-01', '2025-12-31', 8.00),
    ('KM009', N'Mùa thu vàng', N'Ưu đãi mùa thu', '2025-09-01', '2025-11-30', 12.00),
    ('KM010', N'Giáng sinh ấm áp', N'Giảm giá dịp Giáng sinh', '2025-12-20', '2025-12-25', 20.00),
    ('KM011', N'Năm mới rộn ràng', N'Ưu đãi đầu năm', '2025-12-30', '2026-01-05', 15.00),
    ('KM012', N'Khuyến mãi nhóm', N'Giảm giá cho nhóm từ 3 người', '2025-03-01', '2025-12-31', 10.00),
    ('KM013', N'Mùa đông ấm áp', N'Ưu đãi mùa đông', '2025-12-01', '2026-02-28', 18.00),
    ('KM014', N'Khách hàng mới', N'Giảm giá lần đầu đặt phòng', '2025-01-01', '2025-12-31', 5.00),
    ('KM015', N'Ưu đãi đặt online', N'Giảm giá khi đặt qua web', '2025-03-01', '2025-12-31', 7.00),
    ('KM016', N'Sinh nhật khách sạn', N'Kỷ niệm 5 năm thành lập', '2025-07-15', '2025-07-20', 25.00),
    ('KM017', N'Khuyến mãi thấp điểm', N'Giảm giá tháng thấp điểm', '2025-10-01', '2025-11-15', 15.00),
    ('KM018', N'Combo nghỉ dưỡng', N'Giảm giá khi đặt kèm dịch vụ', '2025-04-01', '2025-12-31', 12.00),
    ('KM019', N'Ưu đãi công ty', N'Giảm giá cho khách công ty', '2025-01-01', '2025-12-31', 10.00),
    ('KM020', N'Khuyến mãi đặc biệt', N'Ưu đãi ngẫu nhiên', '2025-05-01', '2025-06-30', 20.00);

--14. Bảng HOADON
INSERT INTO HOADON (maHD, maPT, maKH, maTT, ngayLap, tongTien)
VALUES 
    ('HD001', 'PT001', 'KH001', 'TT009', '2025-03-22', 1200000), 
    ('HD002', 'PT002', 'KH002', 'TT008', '2025-03-23', 1400000), 
    ('HD003', 'PT003', 'KH003', 'TT009', '2025-03-20', 600000),  
    ('HD004', 'PT004', 'KH004', 'TT008', '2025-03-25', 3900000),
    ('HD005', 'PT005', 'KH005', 'TT010', '2025-03-26', 5400000), 
    ('HD006', 'PT006', 'KH006', 'TT009', '2025-03-24', 5000000), 
    ('HD007', 'PT007', 'KH007', 'TT008', '2025-03-23', 1200000), 
    ('HD008', 'PT008', 'KH008', 'TT009', '2025-03-25', 3900000), 
    ('HD009', 'PT009', 'KH009', 'TT008', '2025-03-21', 1800000), 
    ('HD010', 'PT010', 'KH010', 'TT009', '2025-03-27', 7200000),
    ('HD011', 'PT011', 'KH011', 'TT008', '2025-03-22', 1200000),
    ('HD012', 'PT012', 'KH012', 'TT009', '2025-03-24', 3600000), 
    ('HD013', 'PT013', 'KH013', 'TT010', '2025-03-23', 600000),  
    ('HD014', 'PT014', 'KH014', 'TT008', '2025-03-26', 5400000), 
    ('HD015', 'PT015', 'KH015', 'TT009', '2025-03-27', 5400000), 
    ('HD016', 'PT016', 'KH016', 'TT008', '2025-03-23', 3000000), 
    ('HD017', 'PT017', 'KH017', 'TT009', '2025-03-25', 7200000), 
    ('HD018', 'PT018', 'KH018', 'TT008', '2025-03-24', 2400000), 
    ('HD019', 'PT019', 'KH019', 'TT009', '2025-03-26', 5400000), 
    ('HD020', 'PT020', 'KH020', 'TT010', '2025-03-27', 5400000); 

--15. Bảng PHUTHU
INSERT INTO PHUTHU (maPT, tenPT, donGia)
VALUES 
    ('PT001', N'Phụ thu cuối tuần', 200000.00),
    ('PT002', N'Phụ thu lễ Tết', 300000.00),
    ('PT003', N'Phụ thu người thứ 3', 150000.00),
    ('PT004', N'Phụ thu trẻ em trên 6 tuổi', 100000.00),
    ('PT005', N'Phụ thu giờ cao điểm', 250000.00),
    ('PT006', N'Phụ thu check-in sớm', 150000.00),
    ('PT007', N'Phụ thu check-out muộn', 200000.00),
    ('PT008', N'Phụ thu giặt là ngoài giờ', 50000.00),
    ('PT009', N'Phụ thu ăn sáng thêm', 100000.00),
    ('PT010', N'Phụ thu hủy phòng muộn', 300000.00),
    ('PT011', N'Phụ thu đổi phòng', 100000.00),
    ('PT012', N'Phụ thu thú cưng', 200000.00),
    ('PT013', N'Phụ thu sử dụng mini bar', 150000.00),
    ('PT014', N'Phụ thu tổ chức tiệc', 500000.00),
    ('PT015', N'Phụ thu hút thuốc trong phòng', 300000.00),
    ('PT016', N'Phụ thu làm hỏng đồ', 200000.00),
    ('PT017', N'Phụ thu thêm giường', 250000.00),
    ('PT018', N'Phụ thu sử dụng điện thoại', 50000.00),
    ('PT019', N'Phụ thu thêm giờ massage', 200000.00),
    ('PT020', N'Phụ thu dịch vụ VIP', 400000.00);

--16. Bảng TIENICH
INSERT INTO TIENICH (maTI, tenTI)
VALUES 
    ('TI001', N'Wifi miễn phí'),
    ('TI002', N'Máy lạnh'),
    ('TI003', N'Tivi màn hình phẳng'),
    ('TI004', N'Mini bar'),
    ('TI005', N'Két sắt'),
    ('TI006', N'Máy sấy tóc'),
    ('TI007', N'Bàn làm việc'),
    ('TI008', N'Bồn tắm'),
    ('TI009', N'Vòi sen'),
    ('TI010', N'Ban công'),
    ('TI011', N'View biển'),
    ('TI012', N'View thành phố'),
    ('TI013', N'Đèn ngủ'),
    ('TI014', N'Điện thoại bàn'),
    ('TI015', N'Nước uống miễn phí'),
    ('TI016', N'Dép đi trong phòng'),
    ('TI017', N'Áo choàng tắm'),
    ('TI018', N'Bình đun nước'),
    ('TI019', N'Cửa sổ cách âm'),
    ('TI020', N'Hệ thống báo cháy');

--17. Bảng PHONG_TIENICH
INSERT INTO PHONG_TIENICH (maTI, maPhong)
VALUES 
    ('TI001', 'P001'), 
    ('TI002', 'P001'), 
    ('TI003', 'P002'), 
    ('TI004', 'P002'), 
    ('TI001', 'P005'), 
    ('TI002', 'P005'), 
    ('TI008', 'P005'),
    ('TI011', 'P005'), 
    ('TI003', 'P007'), 
    ('TI005', 'P007'), 
    ('TI001', 'P009'), 
    ('TI002', 'P009'), 
    ('TI008', 'P009'), 
    ('TI010', 'P009'),
    ('TI001', 'P015'), 
    ('TI002', 'P015'), 
    ('TI008', 'P015'), 
    ('TI011', 'P015'), 
    ('TI017', 'P015'), 
    ('TI020', 'P020'); 

--18. Bang CHITIETDV
INSERT INTO CHITIETDV (maDV, maHD, soLuong)
VALUES 
    ('DV001', 'HD001', 2), 
    ('DV002', 'HD002', 3), 
    ('DV003', 'HD003', 1),  
    ('DV004', 'HD004', 1),  
    ('DV005', 'HD005', 2), 
    ('DV006', 'HD006', 1),  
    ('DV007', 'HD007', 1),  
    ('DV008', 'HD008', 1),  
    ('DV009', 'HD009', 2), 
    ('DV010', 'HD010', 4),  
    ('DV011', 'HD011', 1),  
    ('DV012', 'HD012', 3),  
    ('DV013', 'HD013', 2), 
    ('DV014', 'HD014', 1),  
    ('DV015', 'HD015', 5),  
    ('DV016', 'HD016', 10), 
    ('DV017', 'HD017', 1),  
    ('DV018', 'HD018', 2), 
    ('DV019', 'HD019', 1),  
    ('DV020', 'HD020', 1); 

--19. CHITIETPHUTHU
INSERT INTO CHITIETPHUTHU (maPT, maHD, soLuong)
VALUES 
    ('PT001', 'HD001', 1),  
    ('PT002', 'HD002', 1),  
    ('PT003', 'HD003', 1), 
    ('PT004', 'HD004', 2), 
    ('PT005', 'HD005', 1),  
    ('PT006', 'HD006', 1),  
    ('PT007', 'HD007', 1),  
    ('PT008', 'HD008', 3),  
    ('PT009', 'HD009', 1), 
    ('PT010', 'HD010', 1),  
    ('PT011', 'HD011', 1),
    ('PT012', 'HD012', 1),  
    ('PT013', 'HD013', 2),  
    ('PT014', 'HD014', 1),  
    ('PT015', 'HD015', 1), 
    ('PT016', 'HD016', 1), 
    ('PT017', 'HD017', 1),  
    ('PT018', 'HD018', 2),  
    ('PT019', 'HD019', 1), 
    ('PT020', 'HD020', 1);  

--20. CHITIETKHUYENMAI
INSERT INTO CHITIETKHUYENMAI (maKM, maHD)
VALUES 
    ('KM001', 'HD001'), 
    ('KM001', 'HD002'), 
    ('KM001', 'HD006'), 
    ('KM001', 'HD011'), 
    ('KM007', 'HD004'),
    ('KM007', 'HD008'), 
    ('KM007', 'HD010'), 
    ('KM007', 'HD014'), 
    ('KM015', 'HD005'), 
    ('KM015', 'HD012'),
    ('KM015', 'HD015'), 
    ('KM015', 'HD017'), 
    ('KM004', 'HD003'),
    ('KM004', 'HD007'), 
    ('KM004', 'HD009'), 
    ('KM004', 'HD013'), 
    ('KM014', 'HD016'), 
    ('KM014', 'HD018'), 
    ('KM014', 'HD019'),
    ('KM014', 'HD020');

/*
===============================================================
======================IN BẢNG DỮ LIỆU==========================
===============================================================
*/
USE QuanLyKhachSan;
GO

PRINT '1. QUYEN';
SELECT * FROM QUYEN;
PRINT '2. BOPHAN';
SELECT * FROM BOPHAN;
PRINT '3. NHANVIEN';
SELECT * FROM NHANVIEN;
PRINT '4. TAIKHOAN';
SELECT * FROM TAIKHOAN;
PRINT '5. LOAIPHONG';
SELECT * FROM LOAIPHONG;
PRINT '6. KIEUPHONG';
SELECT * FROM KIEUPHONG;
PRINT '7. TRANGTHAI';
SELECT * FROM TRANGTHAI;
PRINT '8. PHONG';
SELECT * FROM PHONG;
PRINT '9. KHACHHANG';
SELECT * FROM KHACHHANG;
PRINT '10. PHIEUDAT';
SELECT * FROM PHIEUDAT;
PRINT '11. PHIEUTHUE';
SELECT * FROM PHIEUTHUE;
PRINT '12. DICHVU';
SELECT * FROM DICHVU;
PRINT '13. KHUYENMAI';
SELECT * FROM KHUYENMAI;
PRINT '14. HOADON';
SELECT * FROM HOADON;
PRINT '15. PHUTHU';
SELECT * FROM PHUTHU;
PRINT '16. TIENICH';
SELECT * FROM TIENICH;
PRINT '17. PHONG_TIENICH';
SELECT * FROM PHONG_TIENICH;
PRINT '18. CHITIETDV';
SELECT * FROM CHITIETDV;
PRINT '19. CHITIETPHUTHU';
SELECT * FROM CHITIETPHUTHU;
PRINT '20. CHITIETKHUYENMAI';
SELECT * FROM CHITIETKHUYENMAI;