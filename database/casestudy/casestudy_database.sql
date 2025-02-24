CREATE DATABASE IF NOT EXISTS FuramaResort;
USE FuramaResort;

CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45) NOT NULL
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45) NOT NULL
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45) NOT NULL
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    ma_trinh_do INT,
    ma_vi_tri INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(50) NOT NULL
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45) NOT NULL
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT NOT NULL,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- câu 1
INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES (1, 'Lễ tân'), (2, 'Phục vụ'), (3, 'Chuyên viên'), (4, 'Giám sát'), (5, 'Quản lý'), (6, 'Giám đốc');

INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (1, 'Trung cấp'), (2, 'Cao đẳng'), (3, 'Đại học'), (4, 'Sau đại học');

INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (1, 'Sale – Marketing'), (2, 'Hành Chính'), (3, 'Phục vụ'), (4, 'Quản lý');

INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, dia_chi, luong, ma_trinh_do, ma_vi_tri, ma_bo_phan) VALUES 
(1, 'Dương Khánh Ngọc', '2000-11-01', '89759342534', '0914376521', 'khanhngoc@gmail.com', 'Hà Tĩnh', 15000000, 1, 3, 2),
(2, 'Hoàng Trung Kiên', '1997-07-07', '14124324234', '0912542352', 'trungkien@gmail.com', 'Nghệ An', 18000000, 2, 3, 4),
(3, 'Lê Khánh Linh', '1998-12-12', '14124324234', '0914376521', 'khanhlinh@gmail.com', 'Quảng Trị', 20000000, 2, 3, 4),
(4, 'Nguyễn Hoàng Long', '2003-09-07', '89759342534', '0912542352', 'hoanglong@gmail.com', 'Quảng Bình', 20000000, 2, 3, 4),
(5, 'Lê Ngọc Linh', '1998-08-05', '89759342534', '0912542352', 'khanhlinh@gmail.com', 'Sài Gòn', 20000000, 4, 3, 1),
(6, 'Nguyễn Anh Đức', '2003-12-07', '89759342534', '0914376521', 'anhduc@gmail.com', 'Hà Giang', 20000000, 2, 3, 4),
(7, 'Hoàng Trung Quân', '1997-09-16', '14124324234', '0914376521', 'trungquan@gmail.com', 'Bắc Ninh', 20000000, 2, 2, 4),
(8, 'Trần Quang Hiếu', '2003-08-07', '89759342534', '0912542352', 'quanghieu@gmail.com', 'Đà Nẵng', 20000000, 2, 3, 4),
(9, 'Đặng Trúc Anh', '1998-12-23', '14124324234', '0914376521', 'trucanh@gmail.com', 'Cao Bằng', 20000000, 2, 1, 4),
(10, 'Trần Diệu Linh', '1998-08-23', '89759342534', '0914376521', 'dieulinh@gmail.com', 'Phú Thọ', 7000000, 2, 3, 4),
(11, 'Nguyễn Quang Trung', '2000-02-07', '14124324234', '0912542352', 'quangtrung@gmail.com', 'Yên Bái', 7000000, 1, 3, 4),
(12, 'Trần Đức Anh', '1998-06-23', '89759342534', '0914376521', 'ducanh@gmail.com', 'Thái Nguyên', 7000000, 1, 3, 4),
(13, 'Lê Ngọc Anh', '1997-02-07', '89759342534', '0912542352', 'ngocanh@gmail.com', 'Đồng Nai', 7000000, 4, 3, 4),
(14, 'Nguyễn Khánh Huyền', '1998-01-23', '14124324234', '0912542352', 'khanhhuyen@gmail.com', 'Huế', 7000000, 4, 3, 4);

INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUES (1, 'Diamond'), (2, 'Platinium'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');

INSERT INTO khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) VALUES 
(1, 'Dương Khánh Ngọc', '2000-11-01', 0, '89759342534', '0914376521', 'khanhngoc@gmail.com', 'Hà Tĩnh', 1),
(2, 'Hoàng Trung Kiên', '1997-07-07', 1, '14124324234', '0912542352', 'trungkien@gmail.com', 'Nghệ An', 2),
(3, 'Lê Khánh Linh', '1998-12-12', 0, '14124324234', '0914376521', 'khanhlinh@gmail.com', 'Quảng Trị', 2),
(4, 'Nguyễn Hoàng Long', '2003-09-07', 1, '89759342534', '0912542352', 'hoanglong@gmail.com', 'Quảng Bình', 3),
(5, 'Lê Ngọc Linh', '1998-08-05', 0, '89759342534', '0912542352', 'khanhlinh@gmail.com', 'Sài Gòn', 4),
(6, 'Nguyễn Anh Đức', '2003-12-07', 1, '89759342534', '0914376521', 'anhduc@gmail.com', 'Hà Giang', 3),
(7, 'Hoàng Trung Quân', '1997-09-16', 1, '14124324234', '0914376521', 'trungquan@gmail.com', 'Bắc Ninh', 2),
(8, 'Trần Quang Hiếu', '2003-08-07', 1, '89759342534', '0912542352', 'quanghieu@gmail.com', 'Đà Nẵng', 1),
(9, 'Đặng Trúc Anh', '1998-12-23', 0, '14124324234', '0914376521', 'trucanh@gmail.com', 'Cao Bằng', 2),
(10, 'Trần Diệu Linh', '1998-08-23', 0, '89759342534', '0914376521', 'dieulinh@gmail.com', 'Phú Thọ', 2),
(11, 'Nguyễn Quang Trung', '2000-02-07', 1, '14124324234', '0912542352', 'quangtrung@gmail.com', 'Yên Bái', 1),
(12, 'Trần Đức Anh', '1998-06-23', 1, '89759342534', '0914376521', 'ducanh@gmail.com', 'Thái Nguyên', 3),
(13, 'Lê Ngọc Anh', '1997-02-07', 0, '89759342534', '0912542352', 'ngocanh@gmail.com', 'Đồng Nai', 4),
(14, 'Nguyễn Khánh Huyền', '1998-01-23', 0, '14124324234', '0912542352', 'khanhhuyen@gmail.com', 'Huế', 4);

INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue) values 
(1, 'year'),
(2, 'month'),
(3, 'day');

INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu) values
(1, 'Room'),
(2, 'Villa'),
(3, 'House');

INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu) values 
(1, 'Room Twin 01', 150000, 7000000, 12, 'luxury', 'Có quầy rượu, bể bơi', 700, 5, 3, 1),
(2, 'Room Twin 02', 35000, 7000000, 10, 'luxury', 'Có quầy rượu, bể bơi', 700, 5, 3, 1),
(3, 'Room Twin 03', 35000, 7000000, 10, 'luxury', 'Có quầy rượu', null, 4, 2, 2),
(4, 'Villa Beach Front', 35000, 7000000, 10, 'luxury', 'Có quầy rượu', null, 4, 2, 2),
(5, 'Villa Beach No Front', 35000, 7000000, 10, 'luxury', 'Có quầy rượu, bể bơi', 300, 4, 2, 2),
(6, 'House Princess 01', 35000, 7000000, 5, 'luxury', 'Có bể bơi', 200, 2, 2, 2),
(7, 'House Princess 02', 35000, 7000000, 5, 'luxury', 'Có bể bơi', 200, 3, 2, 2),
(8, 'House Princess 03', 35000, 7000000, 3, 'luxury', 'Có bể bơi', 200, null, 2, 2);

INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai) values 
(1, 'Buffet buổi sáng', 7000, 'suất', 'đầy đủ'),
(2, 'Buffet buổi trưa', 6500, 'suất', 'đầy đủ'),
(3, 'Buffet buổi tối', 8000, 'suất', 'đầy đủ');

INSERT INTO hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) values
(1, '2020-02-13', '2020-03-05', 3000000, 3, 1, 5),
(2, '2020-02-13', '2020-03-05', 3000000, 2, 4, 4),
(3, '2020-02-13', '2020-03-05', 3000000, 6, 11, 3),
(4, '2020-02-13', '2020-03-05', 3000000, 4, 3, 6),
(5, '2020-02-13', '2020-03-05', 3000000, 7, 4, 2),
(6, '2021-02-13', '2021-03-05', 3000000, 2, 2, 7),
(7, '2021-02-13', '2021-03-05', 3000000, 5, 8, 3),
(8, '2021-02-13', '2021-03-05', 3000000, 11, 1, 6),
(9, '2021-02-13', '2021-03-05', 3000000, 10, 2, 2),
(10, '2021-02-13', '2021-03-05', 3000000, 8, 1, 1),
(11, '2021-02-13', '2021-03-05', 3000000, 9, 8, 8);

INSERT INTO hop_dong_chi_tiet (ma_hop_dong_chi_tiet, so_luong, ma_hop_dong, ma_dich_vu_di_kem) values
(1, 2, 3, 1),
(2, 2, 4, 2),
(3, 3, 10, 3),
(4, 2, 7, 1),
(5, 2, 9, 2),
(6, 5, 11, 2),
(7, 2, 3, 3),
(8, 1, 6, 1),
(9, 8, 1, 2),
(10, 2, 8, 3),
(11, 1, 7, 1);

-- câu 2
SELECT * 
FROM nhan_vien 
WHERE (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%') 
AND CHAR_LENGTH(ho_ten) <= 18;

-- câu 3
SELECT *, YEAR(CURDATE()) - YEAR(ngay_sinh) AS tuoi
FROM khach_hang
WHERE YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50
AND dia_chi IN ('Đà Nẵng', 'Quảng Trị');

-- câu 4
USE FuramaResort;
SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach
ORDER BY so_lan_dat_phong ASC;

-- câu 5
SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, 
       dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
       (dv.chi_phi_thue + SUM(hdct.so_luong * dvdk.gia)) AS tong_tien
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang, hd.ma_hop_dong;

-- câu 6
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
LEFT JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu 
      AND YEAR(hd.ngay_lam_hop_dong) = 2021 AND MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 3
WHERE hd.ma_hop_dong IS NULL;

-- câu 7
SELECT DISTINCT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN hop_dong hd2020 ON dv.ma_dich_vu = hd2020.ma_dich_vu AND YEAR(hd2020.ngay_lam_hop_dong) = 2020
LEFT JOIN hop_dong hd2021 ON dv.ma_dich_vu = hd2021.ma_dich_vu AND YEAR(hd2021.ngay_lam_hop_dong) = 2021
WHERE hd2021.ma_hop_dong IS NULL;

-- câu 8
-- Cách 1
SELECT DISTINCT ho_ten FROM khach_hang;
-- Cách 2
SELECT ho_ten FROM khach_hang GROUP BY ho_ten;
-- Cách 3
SELECT ho_ten 
FROM khach_hang kh1
WHERE NOT EXISTS (
    SELECT 1 FROM khach_hang kh2 
    WHERE kh1.ho_ten = kh2.ho_ten AND kh1.ma_khach_hang > kh2.ma_khach_hang
);
-- câu 9
SELECT MONTH(ngay_lam_hop_dong) AS thang, COUNT(DISTINCT ma_khach_hang) AS so_luong_khach_hang
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;

-- câu 10
SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
       COALESCE(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc;

-- câu 11
-- câu 12
-- câu 13
-- câu 14
-- câu 15
-- câu 16
-- câu 17
-- câu 18
-- câu 19
-- câu 20
-- câu 21
-- câu 22
-- câu 23
-- câu 24
-- câu 25
-- câu 26
-- câu 27
-- câu 28