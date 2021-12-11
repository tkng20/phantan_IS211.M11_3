----- Tạo bảng ----
/*==============================================================*/
CREATE TABLE CHINHANH(
    MACN                VARCHAR2(20) NOT NULL,
    TENCN               VARCHAR2(40),
    THANHPHO            VARCHAR2(40),
    CONSTRAINT PK_CHINHANH PRIMARY KEY (MACN)
    );
INSERT INTO CHINHANH(MACN,TENCN,THANHPHO) VALUES('CN0001','CN Hà Nội','Hà Nội');
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
  
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0001','Sử dụng','','CN0001'); 
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0002','Sử dụng','','CN0001');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0003','Sử dụng','','CN0001');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0004','Sử dụng','','CN0001');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0001','Sử dụng','','CN0001');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0001','Trống','','CN0001');
INSERT INTO PHONG(MALOAIPH,TINHTRANG,GHICHU,MACN) values ('LPHONG0002','Trống','','CN0001');
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
    INSERT INTO KHACHHANG_LUUTRU(MAKH, TENKH, NGSINH, DIACHI, SDT, LOAIKH, MACN) VALUES(:new.makh, :new.tenkh, :new.ngsinh, :new.diachi, :new.sdt, :new.loaikh, 'CN0001');
end;
  

INSERT INTO KHACHHANG (MAKH,TENKH, CMND, QUOCTIcH, NGSINH, DIACHI, SDT, LOAIKH, MACN)VALUES('KH0001', 'Trần Ngọc Tuấn Anh','123456789','Việt Nam', TO_DATE('6/5/1995','dd/mm/yyyy'),'TPHCM','123','thanhvien','CN0001');
INSERT INTO KHACHHANG (MAKH,TENKH, CMND, QUOCTIcH, NGSINH, DIACHI, SDT, LOAIKH, MACN)VALUES('KH0002', 'Trần Kim Anh', '568745216','Việt Nam', TO_DATE('1/5/1995','dd/mm/yyyy'),'TPHCM','123','','CN0001');
INSERT INTO KHACHHANG (MAKH,TENKH, CMND, QUOCTIcH, NGSINH, DIACHI, SDT, LOAIKH, MACN)VALUES('KH0003', 'Vũ Duy Hải','984258756','Việt Nam',TO_DATE('1/5/1995','dd/mm/yyyy'),'TPHCM','123','','CN0001');
INSERT INTO KHACHHANG (MAKH,TENKH, CMND, QUOCTIcH, NGSINH, DIACHI, SDT, LOAIKH, MACN)VALUES('KH0004', 'Hứa Thị Kim Duyên ','685421315','Việt Nam',TO_DATE('1/5/1995','dd/mm/yyyy'),'TPHCM','123','','CN0001');
INSERT INTO KHACHHANG (MAKH,TENKH, CMND, QUOCTIcH, NGSINH, DIACHI, SDT, LOAIKH, MACN)VALUES('KH0005', 'Trần Kim Ngọc','254369875','Việt Nam',TO_DATE('1/5/1995','dd/mm/yyyy'),'TPHCM','123','thanhvien','CN0001');

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
  

INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('',' u Thị Hồng Hoa','0779880707',55000000,'CN0001');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0001','Trịnh Thị Thu Hương','0978304543',15000000,'CN0001');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0001','Đặng Thùy Trang','0979604733',15000000,'CN0001');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0001','Bùi Thị Thùy Trang','0918537012',15000000,'CN0001');
INSERT INTO NHANVIEN (MAQL,HOTEN,SODT,LUONG, MACN) VALUES('NV0001','Trần Thị Dung','0967528671',15000000,'CN0001');
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
  
Insert into PHIEUTHUEPHONG (TIENTP) values (13020000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4800000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6900000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9200000);
Insert into PHIEUTHUEPHONG (TIENTP) values (11355000);

Insert into PHIEUTHUEPHONG (TIENTP) values (13020000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4800000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6900000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9200000);
Insert into PHIEUTHUEPHONG (TIENTP) values (11355000);

Insert into PHIEUTHUEPHONG (TIENTP) values (13020000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4800000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6900000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9200000);
Insert into PHIEUTHUEPHONG (TIENTP) values (11355000);

Insert into PHIEUTHUEPHONG (TIENTP) values (13020000);
Insert into PHIEUTHUEPHONG (TIENTP) values (4800000);
Insert into PHIEUTHUEPHONG (TIENTP) values (6900000);
Insert into PHIEUTHUEPHONG (TIENTP) values (9200000);
Insert into PHIEUTHUEPHONG (TIENTP) values (11355000);

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
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0001','MP0001',to_date('04-JAN-21','DD-MON-RR'),to_date('06-JAN-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0001','MP0002',to_date('04-JAN-21','DD-MON-RR'),to_date('06-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0001','MP0003',to_date('04-JAN-21','DD-MON-RR'),to_date('06-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0002','MP0005',to_date('06-JAN-21','DD-MON-RR'),to_date('08-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0002','MP0006',to_date('06-JAN-21','DD-MON-RR'),to_date('08-JAN-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0003','MP0001',to_date('15-FEB-21','DD-MON-RR'),to_date('17-FEB-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0003','MP0002',to_date('15-FEB-21','DD-MON-RR'),to_date('17-FEB-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0004','MP0006',to_date('20-FEB-21','DD-MON-RR'),to_date('23-MAR-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0004','MP0007',to_date('20-FEB-21','DD-MON-RR'),to_date('23-MAR-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0005','MP0003',to_date('25-FEB-21','DD-MON-RR'),to_date('27-MAR-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0005','MP0004',to_date('25-FEB-21','DD-MON-RR'),to_date('27-MAR-21','DD-MON-RR'),0.05,3);

—-------------------------------------------------


Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0006','MP0001',to_date('04-DEC-21','DD-MON-RR'),to_date('06-DEC-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0006','MP0002',to_date('04-DEC-21','DD-MON-RR'),to_date('06-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0006','MP0003',to_date('04-DEC-21','DD-MON-RR'),to_date('06-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0007','MP0005',to_date('06-DEC-21','DD-MON-RR'),to_date('08-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0007','MP0006',to_date('06-DEC-21','DD-MON-RR'),to_date('08-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0008','MP0001',to_date('15-DEC-21','DD-MON-RR'),to_date('17-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) 
values ('MPTP0008','MP0002',to_date('15-DEC-21','DD-MON-RR'),to_date('17-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0009','MP0006',to_date('20-DEC-21','DD-MON-RR'),to_date('23-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0009','MP0007',to_date('20-DEC-21','DD-MON-RR'),to_date('23-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values 0('MPTP0010','MP0003',to_date('25-DEC-21','DD-MON-RR'),to_date('27-DEC-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0010','MP0004',to_date('25-DEC-21','DD-MON-RR'),to_date('27-DEC-21','DD-MON-RR'),0.05,3);

—-------------------------------------------------------------------------------------------

Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0011','MP0001',to_date('04-NOV-21','DD-MON-RR'),to_date('06-NOV-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0011','MP0002',to_date('04-NOV-21','DD-MON-RR'),to_date('06-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0011','MP0003',to_date('04-NOV-21','DD-MON-RR'),to_date('06-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0005',to_date('06-NOV-21','DD-MON-RR'),to_date('08-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0012','MP0006',to_date('06-NOV-21','DD-MON-RR'),to_date('08-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0013','MP0001',to_date('15-NOV-21','DD-MON-RR'),to_date('17-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) 
values ('MPTP0013','MP0002',to_date('15-NOV-21','DD-MON-RR'),to_date('17-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0014','MP0006',to_date('20-NOV-21','DD-MON-RR'),to_date('23-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0014','MP0007',to_date('20-NOV-21','DD-MON-RR'),to_date('23-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values 0('MPTP0015','MP0003',to_date('25-NOV-21','DD-MON-RR'),to_date('27-NOV-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0015','MP0004',to_date('25-NOV-21','DD-MON-RR'),to_date('27-NOV-21','DD-MON-RR'),0.05,3);

—----------------------------------------------------

Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0016','MP0001',to_date('04-OCT-21','DD-MON-RR'),to_date('06-OCT-21','DD-MON-RR'),0.05,3);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0016','MP0002',to_date('04-OCT-21','DD-MON-RR'),to_date('06-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0016','MP0003',to_date('04-OCT-21','DD-MON-RR'),to_date('06-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0017','MP0005',to_date('06-OCT-21','DD-MON-RR'),to_date('08-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0017','MP0006',to_date('06-OCT-21','DD-MON-RR'),to_date('08-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0018','MP0001',to_date('15-OCT-21','DD-MON-RR'),to_date('17-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) 
values ('MPTP0018','MP0002',to_date('15-OCT-21','DD-MON-RR'),to_date('17-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0019','MP0006',to_date('20-OCT-21','DD-MON-RR'),to_date('23-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0019','MP0007',to_date('20-OCT-21','DD-MON-RR'),to_date('23-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values 0('MPTP0020','MP0003',to_date('25-OCT-21','DD-MON-RR'),to_date('27-OCT-21','DD-MON-RR'),0,2);
Insert into CT_PHIEUTHUEPHONG (MAPTP,MAPH,NGAYNP,NGAYTPTT,PHUTHU,SLNGUOI) values ('MPTP0020','MP0004',to_date('25-OCT-21','DD-MON-RR'),to_date('27-OCT-21','DD-MON-RR'),0.05,3);


—----------------------------------------------------














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

Insert into PHIEUDICHVU (TIENDV) values (86984755);
Insert into PHIEUDICHVU (TIENDV) values (14717000);
Insert into PHIEUDICHVU (TIENDV) values (1759000);
Insert into PHIEUDICHVU (TIENDV) values (54999000);
Insert into PHIEUDICHVU (TIENDV) values (139600000);
Insert into PHIEUDICHVU (TIENDV) values (10000000);

Insert into PHIEUDICHVU (TIENDV) values (86984755);
Insert into PHIEUDICHVU (TIENDV) values (14717000);
Insert into PHIEUDICHVU (TIENDV) values (1759000);
Insert into PHIEUDICHVU (TIENDV) values (54999000);
Insert into PHIEUDICHVU (TIENDV) values (139600000);
Insert into PHIEUDICHVU (TIENDV) values (10000000);

Insert into PHIEUDICHVU (TIENDV) values (86984755);
Insert into PHIEUDICHVU (TIENDV) values (14717000);
Insert into PHIEUDICHVU (TIENDV) values (1759000);
Insert into PHIEUDICHVU (TIENDV) values (54999000);
Insert into PHIEUDICHVU (TIENDV) values (139600000);
Insert into PHIEUDICHVU (TIENDV) values (10000000);


Insert into PHIEUDICHVU (TIENDV) values (139600000);
Insert into PHIEUDICHVU (TIENDV) values (10000000);

Insert into PHIEUDICHVU (TIENDV) values (86984755);
Insert into PHIEUDICHVU (TIENDV) values (14717000);
Insert into PHIEUDICHVU (TIENDV) values (1759000);
Insert into PHIEUDICHVU (TIENDV) values (54999000);



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

Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0001','DV0012',1,to_date('01-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0002','DV0006',3,to_date('04-JAN-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0002','DV0009',7,to_date('06-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0003','DV0010',1,to_date('02-FEB-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0004','DV0011',1,to_date('11-FEB-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0005','DV0014',1,to_date('25-FEB-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0005','DV0015',4,to_date('25-FEB-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0006','DV0008',4,to_date('01-MAR-21','DD-MON-RR'));
SELECT * FROM CT_PHIEUDICHVU;
—---------------------------------------------------------------
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0007','DV0012',1,to_date('01-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0008','DV0006',3,to_date('04-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0008','DV0009',7,to_date('06-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0009','DV0010',1,to_date('02-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0010','DV0011',1,to_date('11-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0011','DV0014',1,to_date('25-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0011','DV0015',4,to_date('25-DEC-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0012','DV0016',4,to_date('01-DEC-21','DD-MON-RR'));
SELECT * FROM CT_PHIEUDICHVU;

—----------------------------------------------------------------
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0013','DV0012',1,to_date('01-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV00014','DV0006',3,to_date('04-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0014','DV0009',7,to_date('06-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0015','DV0010',1,to_date('02-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0016','DV0011',1,to_date('11-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0016','DV0014',1,to_date('25-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0017','DV0015',4,to_date('25-NOV-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV00018','DV0008',4,to_date('01-NOV-21','DD-MON-RR'));
SELECT * FROM CT_PHIEUDICHVU;

—-------------------------------------------------------------------

Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV00019','DV0012',1,to_date('01-OCT-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0020','DV0006',3,to_date('04-OCT-21','DD-MON-RR'));
Insert into CT_PHIEUDICHVU (MAPDV,MADV,SLDV,NGAYSD) values ('MPDV0020','DV0009',7,to_date('06-OCT-21','DD-MON-RR'));






—---------------------------------------------------------------------

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







Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (86984755,to_date('01-JAN-21','DD-MON-RR'),'NV0001', 'KH0007',null,'MPDV0001');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (27737000,to_date('06-JAN-21','DD-MON-RR'),'NV0002','KH0001','MPTP0001','MPDV0002');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4800000,to_date('08-JAN-21','DD-MON-RR'),'NV0003','KH0002','MPTP0002',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (1759000,to_date('02-FEB-21','DD-MON-RR'),'NV0013','KH0017',null,'MPDV0003');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (54999000,to_date('11-FEB-21','DD-MON-RR'),'NV0016','KH0009',null,'MPDV0004');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6900000,to_date('17-FEB-21','DD-MON-RR'),'NV0018','KH0015','MPTP0003',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (10000000,to_date('02-MAR-21','DD-MON-RR'),'NV0001','KH0005',null,'MPDV005');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9200000,to_date('23-MAR-21','DD-MON-RR'),'NV0020','KH0017','MPTP0004',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (150955000,to_date('27-MAR-21','DD-MON-RR'),'NV0002','KH0002','MPTP0005','MPDV006');


—------------------------------------------------------------------------------------------------------------

Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (86984755,to_date('01-JAN-21','DD-MON-RR'),'NV0001', 'KH0007',null,'MPDV0007');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (27737000,to_date('06-JAN-21','DD-MON-RR'),'NV0002','KH0001','MPTP0006','MPDV0008');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4800000,to_date('08-JAN-21','DD-MON-RR'),'NV0003','KH0002','MPTP0007',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (1759000,to_date('02-FEB-21','DD-MON-RR'),'NV0013','KH0017',null,'MPDV0009');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (54999000,to_date('11-FEB-21','DD-MON-RR'),'NV0016','KH0009',null,'MPDV0010');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6900000,to_date('17-FEB-21','DD-MON-RR'),'NV0018','KH0015','MPTP0008',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (10000000,to_date('02-MAR-21','DD-MON-RR'),'NV0001','KH0005',null,'MPDV0011');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9200000,to_date('23-MAR-21','DD-MON-RR'),'NV0020','KH0017','MPTP0009',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (150955000,to_date('27-MAR-21','DD-MON-RR'),'NV0002','KH0002','MPTP0010','MPDV0012');

—----------------------------------------------------------------------
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (86984755,to_date('01-JAN-21','DD-MON-RR'),'NV0001', 'KH0007',null,'MPDV0013');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (27737000,to_date('06-JAN-21','DD-MON-RR'),'NV0002','KH0001','MPTP0011','MPDV0014');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4800000,to_date('08-JAN-21','DD-MON-RR'),'NV0003','KH0002','MPTP0012',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (1759000,to_date('02-FEB-21','DD-MON-RR'),'NV0013','KH0017',null,'MPDV0015');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (54999000,to_date('11-FEB-21','DD-MON-RR'),'NV0016','KH0009',null,'MPDV0016');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6900000,to_date('17-FEB-21','DD-MON-RR'),'NV0018','KH0015','MPTP0013',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (10000000,to_date('02-MAR-21','DD-MON-RR'),'NV0001','KH0005',null,'MPDV0017');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9200000,to_date('23-MAR-21','DD-MON-RR'),'NV0020','KH0017','MPTP0014',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (150955000,to_date('27-MAR-21','DD-MON-RR'),'NV0002','KH0002','MPTP0015','MPDV0018');

—----------------------------------------------------------------------------------------------------------
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (86984755,to_date('01-JAN-21','DD-MON-RR'),'NV0001', 'KH0007',null,'MPDV0019');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (27737000,to_date('06-JAN-21','DD-MON-RR'),'NV0002','KH0001','MPTP00016','MPDV0020');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (4800000,to_date('08-JAN-21','DD-MON-RR'),'NV0003','KH0002','MPTP0017',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (1759000,to_date('02-FEB-21','DD-MON-RR'),'NV0013','KH0017',null,'MPDV0021');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (54999000,to_date('11-FEB-21','DD-MON-RR'),'NV0016','KH0009',null,'MPDV0022');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (6900000,to_date('17-FEB-21','DD-MON-RR'),'NV0018','KH0015','MPTP0018',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (10000000,to_date('02-MAR-21','DD-MON-RR'),'NV0001','KH0005',null,'MPDV0023');
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (9200000,to_date('23-MAR-21','DD-MON-RR'),'NV0020','KH0017','MPTP0019',null);
Insert into HOADON (TONGTIEN,NGAYTT,MANV,MAKH,MAPTP,MAPDV) values (150955000,to_date('27-MAR-21','DD-MON-RR'),'NV0002','KH0002','MPTP0020','MPDV0024');
—------------------------------------------------------------------------------------------------------------------
SELECT * FROM HOADON;
