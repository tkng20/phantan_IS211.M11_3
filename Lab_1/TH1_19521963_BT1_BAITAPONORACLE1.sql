CREATE TABLE XE(
MAXE VARCHAR2(5) NOT NULL,
BIENKS VARCHAR2(40)NOT NULL,
MATUYEN VARCHAR2(5) NOT NULL,
SOGHET1 NUMBER NOT NULL,
SOGHET2 NUMBER NOT NULL,
CONSTRAINT PK_MX PRIMARY KEY(MAXE))

----BANG TUYEN-----
CREATE TABLE TUYEN(
MATUYEN VARCHAR2(5) NOT NULL,
BENDAU VARCHAR2(5)NOT NULL,
BENCUOI VARCHAR2(5) NOT NULL,
GIATUYEN NUMBER NOT NULL,
NGXB DATE NOT NULL,
TGDK NUMBER NOT NULL,
CONSTRAINT PK_TU PRIMARY KEY(MATUYEN))

-----BANG KHACH----
CREATE TABLE KHACH(
MAKH VARCHAR2(5) NOT NULL,
HOTEN VARCHAR2(40)NOT NULL,
GIOITINH VARCHAR2(5) NOT NULL,
CMND NUMBER NOT NULL,
CONSTRAINT PK_KH PRIMARY KEY(MAKH))

----BANG VEXE----
CREATE TABLE VEXE(
MATUYEN VARCHAR2(5) NOT NULL,
MAKH VARCHAR2(40)NOT NULL,
NGMUA DATE NOT NULL,
GIAVE NUMBER NOT NULL,
CONSTRAINT PK_VX PRIMARY KEY(MATUYEN,MAKH,NGMUA))

---KHOA NGOAI----
ALTER TABLE XE
ADD CONSTRAINT FK_MT FOREIGN KEY(MATUYEN) REFERENCES TUYEN(MATUYEN);
ALTER TABLE VEXE
ADD CONSTRAINT FK_MTT FOREIGN KEY(MATUYEN) REFERENCES TUYEN(MATUYEN);
ALTER TABLE VEXE
ADD CONSTRAINT FK_KH FOREIGN KEY(MAKH) REFERENCES KHACH(MAKH);


----THEM DU LIEU---
INSERT INTO TUYEN VALUES('T11A','SG','DL',210.000,TO_DATE('26/12/2016','DD/MM/YYYY'),6);
INSERT INTO TUYEN VALUES('T32D','PT','SG',120.000,TO_DATE('30/12/2016','DD/MM/YYYY'),4);
INSERT INTO TUYEN VALUES('T06F','NT','DNG',225.000,TO_DATE('02/01/2017','DD/MM/YYYY'),7);

INSERT INTO KHACH VALUES('KH01','Lâm Văn Bền','Nam',655615896);
INSERT INTO KHACH VALUES('KH02','Dương Thị Lục','Nữ',275648642);
INSERT INTO KHACH VALUES('KH03','Hòang Thanh Tùng','Nam',456889143);


INSERT INTO VEXE VALUES('T11A','KH01',TO_DATE('20/12/2016','DD/MM/YYYY'),210.000);
INSERT INTO VEXE VALUES('T32D','KH02',TO_DATE('25/12/2016','DD/MM/YYYY'),144.000);
INSERT INTO VEXE VALUES('T06F','KH03',TO_DATE('30/12/2016','DD/MM/YYYY'),270.000);

INSERT INTO XE VALUES('X01','52LD-4393','T11A',20,20);
INSERT INTO XE VALUES('X02','59LD-7247','T32D',36,36);
INSERT INTO XE VALUES('X03','55LD-6850','T06F',15,15);

--------cau3----
ALTER TABLE TUYEN
ADD CONSTRAINT check_gia1 CHECK(TGDK>5 AND GIATUYEN>200000 )
ENABLE NOVALIDATE;

----cau4----
create or replace trigger ktra_gia 
before insert or update of GIAVE on VEXE
for each row
declare 
v_matuyen tuyen.matuyen%type;
begin
select ngtl into v_ngtl
from hanghangkhong
where mahang= :new.mahang ;
    if INSERTING THEN
    BEGIN
        IF TO_DATE(:NEW.NGXB, 'DD/MM/YYYY') BETWEEN TO_DATE('29/12/2016', 'DD/MM/YYYY') 
        AND TO_DATE('05/01/2017', 'DD/MM/YYYY') THEN
            BEGIN
                :NEW.GIAVE := :NEW.GIAVE*1.2;
            END;
        END IF;
    END;
    ELSIF UPDATING THEN
        BEGIN
        IF TO_DATE(:NEW.NGXB, 'DD/MM/YYYY') BETWEEN TO_DATE('29/12/2016', 'DD/MM/YYYY') 
        AND TO_DATE('05/01/2017', 'DD/MM/YYYY') THEN
            BEGIN
                :NEW.GIATUYEN := :OLD.GIATUYEN*1.2;
            END;
        END IF;
    END;
    END IF;
    END;
    


INSERT INTO TUYEN VALUES('T11B','SG','DL',220.000,TO_DATE('04/01/2016','DD/MM/YYYY'),6);
INSERT INTO TUYEN VALUES('T11N','SG','DL',210.000,TO_DATE('26/12/2016','DD/MM/YYYY'),6);
-----cau 5----
SELECT MATUYEN,GIAVE
FROM VEXE
WHERE To_number(To_char(NGMUA,'MM')) =12
ORDER BY GIAVE DESC
---cau 6----
select *
   FROM( select vexe.matuyen, count(makh) as SOVE
         from tuyen,vexe
         where vexe.matuyen=tuyen.matuyen AND  EXTRACT(YEAR FROM NGMUA) = 2016
         group by vexe.matuyen
         order by count(makh) asc)
 WHERE ROWNUM <= 1
 
---CACH KHAC---
SELECT MATUYEN
FROM VEXE
WHERE TO_NUMBER(TO_CHAR(NGMUA,'YYYY')) = 2016
GROUP BY MATUYEN
HAVING COUNT(MATUYEN) <= ALL(SELECT COUNT(MATUYEN) 
                             FROM VEXE
                             WHERE TO_NUMBER(TO_CHAR(NGMUA,'YYYY')) = 2016
                             GROUP BY MATUYEN
                            )
----cau 7-----
SELECT MATUYEN
from VEXE, KHACH
WHERE VEXE.MAKH=KHACH.MAKH AND KHACH.GIOITINH='Nam' 
INTERSECT
select matuyen
from VEXE, KHACH
WHERE VEXE.MAKH=KHACH.MAKH AND KHACH.GIOITINH='Nữ' 

----cau 8----
SELECT MAKH
FROM KHACH
WHERE GIOITINH='Nữ' AND NOT EXISTS
(SELECT *FROM TUYEN
WHERE  NOT EXISTS
(SELECT *FROM VEXE
WHERE VEXE.MATUYEN=TUYEN.MATUYEN AND VEXE.MAKH = KHACH.MAKH))