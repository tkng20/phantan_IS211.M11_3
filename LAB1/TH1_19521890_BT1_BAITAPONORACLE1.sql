-- Q1 --
CREATE TABLE LAB1.HANGHANGKHONG(
        MAHANG CHAR(2) NOT NULL Primary key,
        TENHANG VARCHAR2(128) NOT NULL, 
        NGTL DATE, 
        DUONGBAY NUMBER
);

CREATE TABLE LAB1.CHUYENBAY(
        MACB CHAR(5) NOT NULL PRIMARY KEY, 
        MAHANG CHAR(2) NOT NULL, 
        XUATPHAT VARCHAR(128), 
        DIEMDEN VARCHAR(128), 
        BATDAU date, 
        TGBAY float,
);

CREATE TABLE LAB1.NHANVIEN (
        MANV CHAR(4) NOT NULL PRIMARY KEY, 
        HOTEN VARCHAR2(128), 
        GIOITINH VARCHAR2(128) , 
        NGSINH DATE, 
        NGVL DATE, 
        CHUYENMON VARCHAR2(128)
);

CREATE TABLE LAB1.PHANCONG (
        MACB CHAR(5) NOT NULL, 
        MANV CHAR(4) NOT NULL, 
        NHIEMVU VARCHAR2(128),
        CONSTRAINT pk_macb_manv PRIMARY KEY (MACB,MANV),
)

-- Q2 --
-- INSERT TABLE HANGHANGKHONG ---
INSERT INTO LAB1.hanghangkhong VALUES
('VN', 'Vietnam Airlines',TO_DATE('15/01/1956','DD/MM/YYYY'),52);
INSERT INTO LAB1.hanghangkhong VALUES
('VJ', 'Vietjet Air',TO_DATE('25/12/2011','DD/MM/YYYY'),33);
INSERT INTO LAB1.hanghangkhong VALUES
('BL','Jetstar Pacific Airlines',TO_DATE('01/12/1990','DD/MM/YYYY'),13);

-- INSERT TABLE CHUYENBAY ---
INSERT INTO LAB1.chuyenbay  VALUES
('VN550', 'VN','TP.HCM', 'Singapore', TO_DATE('20/12/2015 13:15','dd/mm/yyyy hh24:mi'),2);
INSERT INTO LAB1.chuyenbay  VALUES
('VJ331', 'VJ', 'Da Nang', 'Vinh', TO_DATE('28/12/2015 22:30','dd/mm/yyyy hh24:mi'),1);
INSERT INTO LAB1.chuyenbay  VALUES
('BL696', 'BL', 'TP.HCM', 'Da Lat,TO_DATE('24/12/2015 6:00','dd/mm/yyyy hh24:mi'),0.5);


-- INSERT TABLE NHANVIEN ---
INSERT INTO LAB1.nhanvien VALUES
('NV01','Lam Van Ban', 'Nam',TO_DATE('10/09/1978','DD/MM/YYYY'),TO_DATE('05/06/2000','DD/MM/YYYY'),'Phi cong');
INSERT INTO LAB1.nhanvien VALUES 
('NV02','Duong The Loc','Nu',TO_DATE('22/03/1989','DD/MM/YYYY'), TO_DATE('12/11/2013','DD/MM/YYYY'),'Tiep vien');
INSERT INTO LAB1.nhanvien VALUES 
('NV03','Hoang Thanh Tung','Nam',TO_DATE('29/07/1983','DD/MM/YYYY'),TO_DATE('11/04/2007','DD/MM/YYYY'),'Tiep vien');

-- INSERT TABLE PHANCONG ---
INSERT INTO LAB1.phancong VALUES
('VN550','NV01','Co truong');
INSERT INTO LAB1.phancong VALUES
('VN550','NV02','Tiep vien');
INSERT INTO LAB1.phancong VALUES
('BL696','NV03','Tiep viên truong');

-- Q3 ---
ALTER TABLE nhanvien
ADD CONSTRAINT check_chuyenmon CHECK( CHUYENMON = 'Phi cong' OR CHUYENMON ='Tiep vien');

-- Q5 --
SELECT * 
FROM nhanvien
WHERE extract(month from ngsinh)=7;

-- Q6 --
SELECT macb
from phancong
group by macb
having count(manv)>= ALL
                (
                select count(manv)
                from phancong
                group by macb
                );
-- Q7 --
SELECT chuyenbay.macb
FROM chuyenbay JOIN phancong ON chuyenbay.macb = phancong.macb
WHERE chuyenbay.xuatphat='Da Nang'
GROUP BY chuyenbay.macb
HAVING COUNT(manv)< 2;

-- Q8 --
select manv
from nhanvien
where NOT EXISTS 
(
    select macb 
    from chuyenbay
    where NOT EXISTS 
            (
            select manv 
            from phancong
            where phancong.macb= chuyenbay.macb and phancong.manv = nhanvien.manv)
)
                








