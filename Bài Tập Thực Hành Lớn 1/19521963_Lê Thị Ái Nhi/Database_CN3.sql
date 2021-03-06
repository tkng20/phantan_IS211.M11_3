----- Tạo bảng ----
/*==============================================================*/
CREATE TABLE CHINHANH(
    MACN                VARCHAR2(20) NOT NULL,
    TENCN               VARCHAR2(40),
    THANHPHO            VARCHAR2(40),
    CONSTRAINT PK_CHINHANH PRIMARY KEY (MACN)
    ); 
INSERT INTO CHINHANH(MACN,TENCN,THANHPHO) VALUES('CN0003','CN Hồ Chí Minh','HCM');
select * from chinhanh;
/* Table: LOAIPHONG                                         */
/*==============================================================*/
CREATE TABLE LOAIPHONG (
   MALOAIPH             VARCHAR2(20)          NOT NULL,
   TENLOAIPH            VARCHAR2(40),
   DONGIA               NUMBER,
   SONGUOI              INTEGER,
   GHICHU               VARCHAR2(40),
   CONSTRAINT PK_LOAIPHONG PRIMARY KEY (MALOAIPH)
);

CREATE SEQUENCE auto_column_maloaiphong
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER auto_maloaiphong
   BEFORE INSERT ON LOAIPHONG
   FOR EACH ROW
  BEGIN  
    :new.MALOAIPH := 'LPHONG' || substr('000000000000000' || TO_CHAR(auto_column_maloaiphong.nextval), -4);
  END;

Insert into LOAIPHONG (TENLOAIPH,DONGIA,SONGUOI) values ('Standard Room',800000,3);
Insert into LOAIPHONG (TENLOAIPH,DONGIA,SONGUOI) values ('Superior Room',1500000,3);
Insert into LOAIPHONG (TENLOAIPH,DONGIA,SONGUOI) values ('Deluxe Room',2000000,3);
Insert into LOAIPHONG (TENLOAIPH,DONGIA,SONGUOI) values ('Suite Room',1700000,3);
Insert into LOAIPHONG (TENLOAIPH,DONGIA,SONGUOI) values ('Connecting Room',3000000,5);
SELECT * FROM LOAIPHONG;
/*==============================================================*/
/* Table: DICHVU                                                */
/*==============================================================*/
CREATE TABLE DICHVU (
   MADV                 VARCHAR2(20)          NOT NULL,
   TENDV                VARCHAR2(40),
   GIADV                NUMBER,
   CONSTRAINT PK_DICHVU PRIMARY KEY (MADV)
);

CREATE SEQUENCE auto_column_madv
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER auto_madv
   BEFORE INSERT ON DICHVU
   FOR EACH ROW
  BEGIN  
    :new.MADV := 'DV' || substr('000000000000000' || TO_CHAR(auto_column_madv.nextval), -4);
  END;

INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Mượn đồ',230000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Giặt là',139000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Mát xa',549000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Xông hơi',439000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Thuê xe ôtô',439000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Thuê xe máy',239000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Thuê xe đạp',59000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Buffet dinner',2500000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Buffet lunch',2000000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Buffet breakfast',1759000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Tổ chức hội thảo',54999000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Tổ chức tiệc cưới',83239000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Fitness centre',0);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Dịch vụ trông trẻ',0);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Quầy bar',34900000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Casino',15439000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Chở khách hàng đi tham quan',0);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Dọn phòng',0);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Đưa đón khách hàng ra sân bay',150000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Đặt vé máy bay',0);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Đổi tiền tệ',0);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Thuê phòng họp',50325000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Đặt vé khu vui chơi',320000);
INSERT INTO DICHVU (TENDV,GIADV) VALUES ('Đặt phòng Karaoke',0);

SELECT * FROM DICHVU;
/*==============================================================*/
/* Table: PHONG                                                 */
/*==============================================================*/
CREATE TABLE PHONG (
   MAPH                 VARCHAR2(20)          NOT NULL,
   MALOAIPH             VARCHAR2(20)          NOT NULL,
   TINHTRANG            VARCHAR2(20),
   GHICHU               VARCHAR2(40),
   MACN                 VARCHAR2(20),
   CONSTRAINT PK_PHONG PRIMARY KEY (MAPH)
);

CREATE SEQUENCE auto_column_maphong
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER auto_maphong
   BEFORE INSERT ON PHONG
   FOR EACH ROW
  BEGIN  
    :new.MAPH := 'MP' || substr('000000000000000' || TO_CHAR(auto_column_maphong.nextval), -4);
  END;
  
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0004','Sử dụng','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0003','Sử dụng','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0001','Sử dụng','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0003','Trống','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0005','Trống','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0004','Trống','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0005','Trống','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0001','Trống','','CN0003');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0005','Sử dụng','','CN0003');
SELECT * FROM PHONG;
/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
CREATE TABLE KHACHHANG (
   MAKH                 VARCHAR2(20)          NOT NULL,
   TENKH                VARCHAR2(40),
   CMND                 VARCHAR2(20),
   QUOCTICH             VARCHAR2(40),
   NGSINH               DATE,
   DIACHI               VARCHAR2(40),
   SDT                  VARCHAR2(20),
   LOAIKH               VARCHAR2(20),
   MACN                 VARCHAR2(20),
   CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
);

CREATE TABLE KHACHHANG_HIENTHI (
   MAKH                 VARCHAR2(20)          NOT NULL,
   TENKH                VARCHAR2(40),
   CMND                 VARCHAR2(20),
   QUOCTICH             VARCHAR2(40),
   CONSTRAINT PK_KHACHHANG_1 PRIMARY KEY (MAKH)
);

CREATE TABLE KHACHHANG_LUUTRU (
   MAKH                 VARCHAR2(20)          NOT NULL,
   TENKH                VARCHAR2(40),
   NGSINH               DATE,
   DIACHI               VARCHAR2(40),
   SDT                  VARCHAR2(20),
   LOAIKH               VARCHAR2(20),
   MACN                 VARCHAR2(20),
   CONSTRAINT PK_KHACHHANG_2 PRIMARY KEY (MAKH)
);
  
create or replace trigger phanManhDocKhachHang
after insert on KhachHang
for each row
begin
    INSERT INTO KHACHHANG_HIENTHI (MAKH, TENKH, CMND, QUOCTIcH)VALUES(:new.makh, :new.tenkh, :new.cmnd, :new.quoctich);
    INSERT INTO KHACHHANG_LUUTRU(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN) VALUES(:new.makh, :new.tenkh, :new.ngsinh, :new.diachi, :new.sdt, :new.loaikh, 'CN0003');
end;

INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0011','Phạm Thị Ngọc Nam',TO_DATE('1/3/1995','dd/mm/yyyy'),'TPHCM','123','','CN0003','254687598','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0012','Nguyễn Hoàng Tú',TO_DATE('1/8/1995','dd/mm/yyyy'),'TPHCM','123','thanhvien','CN0003','251367899','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0013','Lê Minh Tuyết',TO_DATE('1/9/1995','dd/mm/yyyy'),'TPHCM','123','','CN0003','251567896','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0014','Hoàng Thanh Tuấn',TO_DATE('11/5/1995','dd/mm/yyyy'),'TPHCM','123','thanhvien','CN0003','251684562','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0015','Trần Minh Trung',TO_DATE('1/1/1995','dd/mm/yyyy'),'TPHCM','123','','CN0003','259853012','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0016','Phạm Thị Ngọc Nhi',TO_DATE('19/5/1995','dd/mm/yyyy'),'TPHCM','123','','CN0003','254687598','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0017','Nguyễn Hoàng Tú',TO_DATE('11/11/1998','dd/mm/yyyy'),'TPHCM','123','thanhvien','CN0003','251237899','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0018','Lê Thu Tuyết',TO_DATE('13/6/1997','dd/mm/yyyy'),'TPHCM','123','','CN0003','251587696','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0019','Hoàng Minh Hùng',TO_DATE('12/12/1996','dd/mm/yyyy'),'TPHCM','123','thanhvien','CN0003','251454562','Việt Nam');
INSERT INTO KHACHHANG(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN, CMND, QUOCTIcH) VALUES('KH0020','Hoàng Tấn Trung',TO_DATE('13/3/1996','dd/mm/yyyy'),'TPHCM','123','','CN0003','123853012','Việt Nam');


SELECT * FROM KHACHHANG;
SELECT * FROM KHACHHANG_HIENTHI;
SELECT * FROM KHACHHANG_LUUTRU;
/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
CREATE TABLE NHANVIEN(
   MANV                 VARCHAR2(20)          NOT NULL,
   MAQL                 VARCHAR2(20),
   HOTEN                VARCHAR2(40),
   SODT                 VARCHAR(20),
   LUONG                NUMBER,
   MACN                 VARCHAR2(20),
   CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
);

CREATE SEQUENCE auto_column_manv
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER auto_manv
   BEFORE INSERT ON NHANVIEN
   FOR EACH ROW
  BEGIN  
    :new.MANV := 'NV' || substr('000000000000000' || TO_CHAR(auto_column_manv.nextval), -4);
  END;

INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0005','Ngô Thị Khánh Chi','0978604733',15000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0005','Lê Thị Mai','0978604733',15000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0005','Trần Thị Thùy Nhung','0941927520',15000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('','Nguyễn Huỳnh Khánh An','0969482744',55000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('','Huỳnh Thị Khánh Trang','0998780706',55000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0004','Nguyễn Bảo Lộc','0972304733',15000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0004','Phạm Đoàn Minh Hiếu','0908604733',15000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0004','Lai Như Quỳnh','0987690045',15000000,'CN0003');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0004','Trần Kim Ngọc','0978604744',15000000,'CN0003');
SELECT * FROM NHANVIEN;

/*==============================================================*/
/* Table: PHIEUTHUEPHONG                                        */
/*==============================================================*/
CREATE TABLE PHIEUTHUEPHONG (
   MAPTP            VARCHAR2(20)          NOT NULL,
   TIENTP               NUMBER,
   CONSTRAINT PK_PHIEUTHUEPHONG PRIMARY KEY (MAPTP)
);

CREATE SEQUENCE auto_column_maphieutp
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER column_maphieutp
   BEFORE INSERT ON PHIEUTHUEPHONG
   FOR EACH ROW
  BEGIN  
    :new.MAPTP := 'MPTP' || substr('000000000000000' || TO_CHAR(auto_column_maphieutp.nextval), -4);
  END;
  

Insert into PHIEUTHUEPHONG (TIENTP) values (11850000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (5100000);
Insert into PHIEUTHUEPHONG (TIENTP) values (16755000);
Insert into PHIEUTHUEPHONG (TIENTP) values (20000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (7500000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9000000);

Insert into PHIEUTHUEPHONG (TIENTP) values (11850000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (5100000);
Insert into PHIEUTHUEPHONG (TIENTP) values (16755000);
Insert into PHIEUTHUEPHONG (TIENTP) values (20000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (7500000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9000000);

Insert into PHIEUTHUEPHONG (TIENTP) values (11850000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (5100000);
Insert into PHIEUTHUEPHONG (TIENTP) values (16755000);
Insert into PHIEUTHUEPHONG (TIENTP) values (20000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (7500000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6000000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9000000);

SELECT * FROM PHIEUTHUEPHONG;
/*==============================================================*/
/* Table: CT_PHIEUTHUEPHONG                                            */
/*==============================================================*/
CREATE TABLE CT_PHIEUTHUEPHONG (
    MAPTP                 VARCHAR2(20)          NOT NULL,
    MAPH                  VARCHAR2(20)          NOT NULL,
    NGAYNP                 DATE,
    NGAYTPTT                 DATE,
    PHUTHU               FLOAT,
    SLNGUOI          NUMBER,
   CONSTRAINT PK_CT_PHIEUTHUEPHONG PRIMARY KEY (MAPTP, MAPH)
);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0001','MP0008',to_date('09-JAN-21','DD-MON-RR'),to_date('11-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0001','MP0009',to_date('09-JAN-21','DD-MON-RR'),to_date('11-JAN-21','DD-MON-RR'),0.05,5);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0002','MP0002',to_date('19-JAN-21','DD-MON-RR'),to_date('20-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0003','MP0001',to_date('26-JAN-21','DD-MON-RR'),to_date('28-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0004','MP0006',to_date('29-JAN-21','DD-MON-RR'),to_date('31-JAN-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0004','MP0007',to_date('29-JAN-21','DD-MON-RR'),to_date('31-JAN-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0004','MP0008',to_date('29-JAN-21','DD-MON-RR'),to_date('31-JAN-21','DD-MON-RR'),0,1);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0005','MP0004',to_date('02-FEB-21','DD-MON-RR'),to_date('05-FEB-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0005','MP0005',to_date('02-FEB-21','DD-MON-RR'),to_date('05-FEB-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0006','MP0001',to_date('12-FEB-21','DD-MON-RR'),to_date('14-FEB-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0006','MP0003',to_date('12-FEB-21','DD-MON-RR'),to_date('14-FEB-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0007','MP0005',to_date('27-FEB-21','DD-MON-RR'),to_date('28-FEB-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0008','MP0007',to_date('24-MAR-21','DD-MON-RR'),to_date('26-MAR-21','DD-MON-RR'),0,4);

Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0009','MP0008',to_date('09-JUN-21','DD-MON-RR'),to_date('11-JUN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0009','MP0009',to_date('09-JUN-21','DD-MON-RR'),to_date('11-JUN-21','DD-MON-RR'),0.05,5);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0010','MP0002',to_date('19-JUN-21','DD-MON-RR'),to_date('20-JUN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0011','MP0001',to_date('26-JUN-21','DD-MON-RR'),to_date('28-JUN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0006',to_date('29-JUN-21','DD-MON-RR'),to_date('31-JUN-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0007',to_date('29-JUN-21','DD-MON-RR'),to_date('31-JUN-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0008',to_date('29-JUN-21','DD-MON-RR'),to_date('31-JUN-21','DD-MON-RR'),0,1);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0013','MP0004',to_date('02-AUG-21','DD-MON-RR'),to_date('05-AUG-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0013','MP0005',to_date('02-AUG-21','DD-MON-RR'),to_date('05-AUG-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0014','MP0001',to_date('12-AUG-21','DD-MON-RR'),to_date('14-AUG-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0014','MP0003',to_date('12-AUG-21','DD-MON-RR'),to_date('14-AUG-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0015','MP0005',to_date('27-AUG-21','DD-MON-RR'),to_date('28-AUG-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0016','MP0007',to_date('24-OCT-21','DD-MON-RR'),to_date('26-OCT-21','DD-MON-RR'),0,4);


Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0009','MP0008',to_date('09-JUN-21','DD-MON-RR'),to_date('11-JUN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0009','MP0009',to_date('09-JUN-21','DD-MON-RR'),to_date('11-JUN-21','DD-MON-RR'),0.05,5);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0010','MP0002',to_date('19-JUN-21','DD-MON-RR'),to_date('20-JUN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0011','MP0001',to_date('26-JUN-21','DD-MON-RR'),to_date('28-JUN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0006',to_date('29-JUN-21','DD-MON-RR'),to_date('31-JUN-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0007',to_date('29-JUN-21','DD-MON-RR'),to_date('31-JUN-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0008',to_date('29-JUN-21','DD-MON-RR'),to_date('31-JUN-21','DD-MON-RR'),0,1);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0013','MP0004',to_date('02-AUG-21','DD-MON-RR'),to_date('05-AUG-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0013','MP0005',to_date('02-AUG-21','DD-MON-RR'),to_date('05-AUG-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0014','MP0001',to_date('12-AUG-21','DD-MON-RR'),to_date('14-AUG-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0014','MP0003',to_date('12-AUG-21','DD-MON-RR'),to_date('14-AUG-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0015','MP0005',to_date('27-AUG-21','DD-MON-RR'),to_date('28-AUG-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0016','MP0007',to_date('24-OCT-21','DD-MON-RR'),to_date('26-OCT-21','DD-MON-RR'),0,4);


Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0017','MP0008',to_date('09-NOV-21','DD-MON-RR'),to_date('11-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0017','MP0009',to_date('09-NOV-21','DD-MON-RR'),to_date('11-NOV-21','DD-MON-RR'),0.05,5);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0018','MP0002',to_date('19-NOV-21','DD-MON-RR'),to_date('20-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0019','MP0001',to_date('26-NOV-21','DD-MON-RR'),to_date('28-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0020','MP0006',to_date('29-NOV-21','DD-MON-RR'),to_date('31-NOV-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0021','MP0007',to_date('29-NOV-21','DD-MON-RR'),to_date('31-NOV-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0021','MP0008',to_date('29-NOV-21','DD-MON-RR'),to_date('31-NOV-21','DD-MON-RR'),0,1);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0022','MP0004',to_date('01-DEC-21','DD-MON-RR'),to_date('02-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0022','MP0005',to_date('01-DEC-21','DD-MON-RR'),to_date('02-DEC-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0023','MP0001',to_date('01-DEC-21','DD-MON-RR'),to_date('02-DEC-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0023','MP0003',to_date('02-DEC-21','DD-MON-RR'),to_date('04-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0024','MP0005',to_date('07-DEC-21','DD-MON-RR'),to_date('07-DEC-21','DD-MON-RR'),0,4);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0025','MP0007',to_date('07-DEC-21','DD-MON-RR'),to_date('07-DEC-21','DD-MON-RR'),0,4);
SELECT * FROM CT_PHIEUTHUEPHONG;
/*==============================================================*/
/* Table: PHIEUTHUEDICHVU                                       */
/*==============================================================*/
CREATE TABLE PHIEUDICHVU (
   MAPDV          VARCHAR2(20)          NOT NULL,
   TIENDV              NUMBER,
   CONSTRAINT PK_PHIEUDICHVU PRIMARY KEY (MAPDV)
);

CREATE SEQUENCE auto_column_maphieuTDV
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER column_maphieuTDV
   BEFORE INSERT ON PHIEUDICHVU
   FOR EACH ROW
  BEGIN  
    :new.MAPDV := 'MPDV' || substr('000000000000000' || TO_CHAR(auto_column_maphieuTDV.nextval), -4);
  END;
Insert into PHIEUDICHVU (TIENDV) values (17500000);
Insert into PHIEUDICHVU (TIENDV) values (150000);
Insert into PHIEUDICHVU (TIENDV) values (640000);
Insert into PHIEUDICHVU (TIENDV) values (0);
Insert into PHIEUDICHVU (TIENDV) values (8000000);
Insert into PHIEUDICHVU (TIENDV) values (5000000);
Insert into PHIEUDICHVU (TIENDV) values (7883000);
Insert into PHIEUDICHVU (TIENDV) values (956000);

SELECT * FROM PHIEUDICHVU;

/*==============================================================*/
/* Table: CT_PHIEUTHUEDICHVU                                          */
/*==============================================================*/
CREATE TABLE CT_PHIEUDICHVU (
   MAPDV                 VARCHAR2(20)          NOT NULL,
   MADV                  VARCHAR2(20)          NOT NULL,
   SLDV                  NUMBER NOT NULL,
   NGAYSD              DATE,
   CONSTRAINT PK_CT_PHIEUDICHVU PRIMARY KEY (MAPDV, MADV)
);

Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0001','DV0008',7,to_date('09-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0001','DV0017',2,to_date('10-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0002','DV0020',1,to_date('19-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0002','DV0018',1,to_date('20-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0003','DV0023',2,to_date('27-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0004','DV0013',1,to_date('25-MAR-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0004','DV0019',1,to_date('25-MAR-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0005','DV0009',4,to_date('11-APR-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0006','DV0008',2,to_date('14-APR-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0007','DV0001',24,to_date('23-APR-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0007','DV0002',17,to_date('24-APR-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0008','DV0006',4,to_date('26-APR-21','DD-MON-RR'));

Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0009','DV0008',7,to_date('09-JUN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0009','DV0017',2,to_date('10-JUN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0010','DV0020',1,to_date('19-JUN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0010','DV0018',1,to_date('20-JUN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0011','DV0023',2,to_date('27-JUN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0012','DV0013',1,to_date('25-AUG-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0012','DV0019',1,to_date('25-AUG-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0013','DV0009',4,to_date('02-SEP-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0014','DV0008',2,to_date('02-SEP-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0015','DV0001',24,to_date('02-SEP-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0015','DV0002',17,to_date('05-SEP-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0016','DV0006',4,to_date('07-SEP-21','DD-MON-RR'));

Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0017','DV0008',7,to_date('09-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0017','DV0017',2,to_date('10-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0018','DV0020',1,to_date('19-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0018','DV0018',1,to_date('20-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0019','DV0023',2,to_date('27-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0020','DV0013',1,to_date('25-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0020','DV0019',1,to_date('25-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0021','DV0009',4,to_date('02-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0022','DV0008',2,to_date('07-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0023','DV0001',24,to_date('07-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0023','DV0002',17,to_date('07-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0024','DV0006',4,to_date('07-DEC-21','DD-MON-RR'));




SELECT * FROM CT_PHIEUDICHVU;
/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
CREATE TABLE HOADON (
   MAHD                 VARCHAR2(20)          NOT NULL,
   TONGTIEN             NUMBER,
   NGAYTT               DATE,
   MANV                 VARCHAR2(20)          NOT NULL, 
   MAKH                 VARCHAR2(20),
   MAPTP                VARCHAR2(20),
   MAPDV                VARCHAR2(20),

   CONSTRAINT PK_HOADON PRIMARY KEY (MAHD)
);

CREATE SEQUENCE auto_column_mahd
 START WITH 1
 INCREMENT BY 1 
 MAXVALUE 999999
 NOCACHE
 NOORDER
 NOCYCLE;

CREATE OR REPLACE TRIGGER auto_mahd
   BEFORE INSERT ON HOADON
   FOR EACH ROW
  BEGIN  
    :new.MAHD := 'HD' || substr('000000000000000' || TO_CHAR(auto_column_mahd.nextval), -4);
  END;
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (29350000,to_date('11-JAN-21','DD-MON-RR'),'NV0004','KH0003','MPTP0001','MPDV0001');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4150000,to_date('20-JAN-21','DD-MON-RR'),'NV0008','KH0007','MPTP0002','MPDV0002');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (5740000,to_date('28-JAN-21','DD-MON-RR'),'NV0010','KH0009','MPTP0003','MPDV0003');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (16755000,to_date('31-JAN-21','DD-MON-RR'),'NV0011','KH0010','MPTP0004',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (20000000,to_date('05-FEB-21','DD-MON-RR'),'NV0014','KH0012','MPTP0005',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (7500000,to_date('14-FEB-21','DD-MON-RR'),'NV0017','KH0014','MPTP0006',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6000000,to_date('28-FEB-21','DD-MON-RR'),'NV0003','KH0003','MPTP0007',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9000000,to_date('26-MAR-21','DD-MON-RR'),'NV0005','KH0011','MPTP0008', 'MPDV0004');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (8000000,to_date('11-APR-21','DD-MON-RR'),'NV0009','KH0004',null,'MPDV0005');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (5000000,to_date('14-APR-21','DD-MON-RR'),'NV0010','KH0010',null,'MPDV0006');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (7883000,to_date('24-APR-21','DD-MON-RR'),'NV0011','KH0004',null,'MPDV0007');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (956000,to_date('26-APR-21','DD-MON-RR'),'NV0012','KH0006',null,'MPDV0008');

Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (29350000,to_date('11-JUN-21','DD-MON-RR'),'NV0004','KH0003','MPTP0009','MPDV0009');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4150000,to_date('20-JUN-21','DD-MON-RR'),'NV0008','KH0007','MPTP0010','MPDV0010');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (5740000,to_date('28-JUN-21','DD-MON-RR'),'NV0010','KH0009','MPTP0011','MPDV0011');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (16755000,to_date('31-JUN-21','DD-MON-RR'),'NV0011','KH0010','MPTP0011',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (20000000,to_date('05-AUG-21','DD-MON-RR'),'NV0014','KH0012','MPTP0012',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (7500000,to_date('14-AUG-21','DD-MON-RR'),'NV0017','KH0014','MPTP0013',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6000000,to_date('28-AUG-21','DD-MON-RR'),'NV0003','KH0003','MPTP0014',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9000000,to_date('26-AUG-21','DD-MON-RR'),'NV0005','KH0011','MPTP0015', 'MPDV0012');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (8000000,to_date('02-DEC-21','DD-MON-RR'),'NV0009','KH0004',null,'MPDV0013');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (5000000,to_date('02-DEC-21','DD-MON-RR'),'NV0010','KH0010',null,'MPDV0014');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (7883000,to_date('05-DEC-21','DD-MON-RR'),'NV0011','KH0004',null,'MPDV0015');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (956000,to_date('07-DEC-21','DD-MON-RR'),'NV0012','KH0006',null,'MPDV0016');

Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (29350000,to_date('09-NOV-21','DD-MON-RR'),'NV0004','KH0003','MPTP0016','MPDV0017');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4150000,to_date('09-NOV-21','DD-MON-RR'),'NV0008','KH0007','MPTP0017','MPDV0018');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (5740000,to_date('19-NOV-21','DD-MON-RR'),'NV0010','KH0009','MPTP0018','MPDV0019');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (16755000,to_date('26-NOV-21','DD-MON-RR'),'NV0011','KH0010','MPTP0019',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (20000000,to_date('29-NOV-21','DD-MON-RR'),'NV0014','KH0012','MPTP0020',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (7500000,to_date('29-NOV-21','DD-MON-RR'),'NV0017','KH0014','MPTP0021',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6000000,to_date('01-DEC-21','DD-MON-RR'),'NV0003','KH0003','MPTP0022',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9000000,to_date('02-DEC-21','DD-MON-RR'),'NV0005','KH0011','MPTP0023', 'MPDV0020');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (8000000,to_date('02-DEC-21','DD-MON-RR'),'NV0009','KH0004',null,'MPDV0021');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (5000000,to_date('07-DEC-21','DD-MON-RR'),'NV0010','KH0010',null,'MPDV0022');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (7883000,to_date('07-DEC-21','DD-MON-RR'),'NV0011','KH0004',null,'MPDV0023');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (956000,to_date('07-DEC-21','DD-MON-RR'),'NV0012','KH0006',null,'MPDV0024');

SELECT * FROM HOADON;