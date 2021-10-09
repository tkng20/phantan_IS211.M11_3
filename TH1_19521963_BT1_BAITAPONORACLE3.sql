CREATE TABLE C##BAITHI3.HANGHANGKHONG(
MAHANG VARCHAR2(5) NOT NULL,
TENHANG VARCHAR2(100)NOT NULL,
NGTL DATE NOT NULL,
DUONGBAY NUMBER NOT NULL,
CONSTRAINT PK_MH PRIMARY KEY(MAHANG))

----BANG CHUYENBAY----

CREATE TABLE C##BAITHI3.CHUYENBAY(
MACB VARCHAR2(5) NOT NULL,
MAHANG VARCHAR2(5)NOT NULL,
XUATPHAT VARCHAR2(40) NOT NULL,
DIEMDEN VARCHAR2(40) NOT NULL,
BATDAU date NOT NULL,
TGBAY FLOAT NOT NULL,
CONSTRAINT PK_CB PRIMARY KEY(MACB))

----BANG NHANVIEN----
CREATE TABLE C##BAITHI3.NHANVIEN(
MANV VARCHAR2(5) NOT NULL,
HOTEN VARCHAR2(100)NOT NULL,
GIOITINH VARCHAR2(20) NOT NULL,
NGSINH DATE NOT NULL,
NGVL DATE NOT NULL,
CHUYENMON VARCHAR2(100) NOT NULL,
CONSTRAINT PK_NVV PRIMARY KEY(MANV))

----BANG PHAN CONG-----
CREATE TABLE C##BAITHI3.PHANCONG(
MACB VARCHAR2(5) NOT NULL,
MANV VARCHAR2(5)NOT NULL,
NHIEMVU VARCHAR2(100) NOT NULL,
CONSTRAINT PK_PC PRIMARY KEY(MACB,MANV))

----KHOANGOAI-----
ALTER TABLE C##BAITHI3.CHUYENBAY
ADD CONSTRAINT FK_MH FOREIGN KEY(MAHANG) REFERENCES C##BAITHI3.HANGHANGKHONG(MAHANG);

ALTER TABLE C##BAITHI3.PHANCONG
ADD CONSTRAINT FK_CB FOREIGN KEY(MACB) REFERENCES C##BAITHI3.CHUYENBAY(MACB);

ALTER TABLE C##BAITHI3.PHANCONG
ADD CONSTRAINT FK_NVV FOREIGN KEY(MANV) REFERENCES C##BAITHI3.NHANVIEN(MANV);

----THEM DU LIEU------
INSERT INTO C##BAITHI3.HANGHANGKHONG VALUES ('VN','Vietnam Airlines',TO_DATE('15/01/1956','DD/MM/YYYY'),52);
INSERT INTO C##BAITHI3.HANGHANGKHONG VALUES ('VJ','Vietnam Air',TO_DATE('25/12/2011','DD/MM/YYYY'),33);
INSERT INTO C##BAITHI3.HANGHANGKHONG VALUES ('BL','Jetstar Pacific Airlines',TO_DATE('01/12/1990','DD/MM/YYYY'),13);

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
INSERT INTO C##BAITHI3.CHUYENBAY VALUES ('VN550','VN','TP.HCM','Singapore',TO_DATE('13:15 20/12/2015','HH24:MI DD/MM/YYYY'),2);
INSERT INTO C##BAITHI3.CHUYENBAY VALUES ('VJ331','VJ','Đà Nẵng','Vinh',TO_DATE('22:30 28/12/2015','HH24:MI DD/MM/YYYY'),1);
INSERT INTO C##BAITHI3.CHUYENBAY VALUES ('BL696','BL','TP.HCM','Đà Lạt',TO_DATE('06:00 24/12/2015','HH24:MI DD/MM/YYYY'),0.5);


INSERT INTO C##BAITHI3.NHANVIEN VALUES ('NV01','Lâm Văn Bền','Nam',TO_DATE('10/09/1978','DD/MM/YYYY'),TO_DATE('05/06/2000','DD/MM/YYYY'),'Phi công');
INSERT INTO C##BAITHI3.NHANVIEN VALUES ('NV02','Dương Thị Lục','Nữ',TO_DATE('22/03/1989','DD/MM/YYYY'),TO_DATE('12/11/2013','DD/MM/YYYY'),'Tiếp viên');
INSERT INTO C##BAITHI3.NHANVIEN VALUES ('NV03','Lâm Văn Bền','Nam',TO_DATE('29/07/1983','DD/MM/YYYY'),TO_DATE('11/04/2007','DD/MM/YYYY'),'Tiếp viên');

INSERT INTO C##BAITHI3.PHANCONG VALUES ('VN550','NV01','Cơ trưởng');
INSERT INTO C##BAITHI3.PHANCONG VALUES ('VN550','NV02','Tiếp viên');
INSERT INTO C##BAITHI3.PHANCONG VALUES ('VN550','NV03','Tiếp viên trưởng');

----CAU3----
ALTER TABLE C##BAITHI3.NHANVIEN
ADD CONSTRAINT check_chuyenmon CHECK(CHUYENMON IN('Phi công','Tiếp viên'));

----cau 4----
set serveroutput on;
create or replace trigger check_bay before insert or update on C##BAITHI3.CHUYENBAY
for each row
declare 
v_ngtl hanghangkhong.ngtl%type;
begin
select ngtl into v_ngtl
from C##BAITHI3.hanghangkhong
where mahang= :new.mahang ;
if :new.batdau <v_ngtl then
RAISE_APPLICATION_ERROR(-20000,'Ngay chuyen bay phai lon hon ngay thanh lap');
else 
DBMS_OUTPUT.PUT_LINE('Da them thanh cong');
end if;
end;

INSERT INTO C##BAITHI3.CHUYENBAY VALUES ('VN551','VN','TP.HCM','Singapore',TO_DATE('13:15 20/12/3015','HH24:MI DD/MM/YYYY'),2);

----CAU 5----
select *
from C##BAITHI3.nhanvien
where To_number(To_char(ngsinh,'MM')) =07

-----cau 6---
SELECT MACB
FROM C##BAITHI3.PHANCONG
GROUP BY MACB
HAVING COUNT(MACB) >= ALL(  SELECT COUNT(MANV)
                            FROM C##BAITHI3.PHANCONG
                            GROUP BY MACB
                         )
 
 ----cau 7----
select phancong.macb
from C##BAITHI3.hanghangkhong, C##BAITHI3.chuyenbay, C##BAITHI3.phancong
where hanghangkhong.mahang=chuyenbay.mahang and chuyenbay.macb= phancong.macb and xuatphat= 'Đà Nẵng' 
group by phancong.macb
having count(manv)<2

----cau 8-----
SELECT MANV,HOTEN
FROM C##BAITHI3.NHANVIEN
WHERE NOT EXISTS
(SELECT *FROM C##BAITHI3.CHUYENBAY
WHERE  NOT EXISTS
(SELECT *FROM C##BAITHI3.PHANCONG
WHERE NHANVIEN.MANV=PHANCONG.MANV AND CHUYENBAY.MACB=PHANCONG.MACB))
