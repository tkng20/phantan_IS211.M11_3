CREATE USER BAITHI1 IDENTIFIED BY BAITHI1;
GRANT CREATE SYNONYM, CREATE ANY TABLE TO BAITHI1;
GRANT CONNECT, RESOURCE TO BAITHI1;
GRANT OEM_MONITOR TO BAITHI1;
GRANT DBA TO BAITHI;
GRANT CREATE VIEW TO BAITHI1;

-- Q1 --
CREATE TABLE BAITHI1.xe (
        maxe varchar(3) NOT NULL Primary key,
        bienks VARCHAR2(10) NOT NULL, 
        matuyen VARCHAR2(4), 
        soghet1 number,
        soghet2 number
);
alter table xe
add constraint fk_tuyen foreign key (matuyen) references tuyen(matuyen);

CREATE TABLE BAITHI1.tuyen(
        matuyen VARCHAR(4) NOT NULL PRIMARY KEY, 
        bendau VARCHAR2(3) NOT NULL, 
        bencuoi VARCHAR2(3) NOT NULL, 
        giatuyen decimal, 
        ngxb DATE,
        tgdk float
);

CREATE TABLE BAITHI1.khach (
        mahk varchar2(4) NOT NULL PRIMARY KEY, 
        hoten VARCHAR2(20), 
        gioitinh varchar2(3) , 
        cmnd number
);

CREATE TABLE BAITHI1.vexe (
        matuyen varchar2(4) NOT NULl,
        mahk varchar2(4) NOT NULL,
        ngmua date NOT NULL,
        giave decimal,
        CONSTRAINT pk1 PRIMARY KEY (matuyen,mahk,ngmua)
);

ALTER TABLE vexe
ADD CONSTRAINT fk1 FOREIGN KEY (matuyen) REFERENCES tuyen(matuyen);
ALTER TABLE vexe
ADD CONSTRAINT fk2 FOREIGN KEY (mahk) REFERENCES khach(mahk);

--- Q2 ---
ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';

INSERT INTO BAITHI1.xe VALUES
('X01', '52LD-4393','T11A',20,20);
INSERT INTO BAITHI1.xe VALUES
('X02', '59LD-7247','T32D',36,36);
INSERT INTO BAITHI1.xe VALUES
('X03', '55LD-6850','T06F',15,15);

INSERT INTO BAITHI1.tuyen VALUES
('T11A','SG','DL',210000,TO_DATE('26/12/2016','DD/MM/YYYY'),6);
INSERT INTO BAITHI1.tuyen VALUES
('T32D','PT','SG',120000,TO_DATE('30/12/2016','DD/MM/YYYY'),4);
INSERT INTO BAITHI1.tuyen VALUES
('T06F','NT','DNG',225000,TO_DATE('02/01/2017','DD/MM/YYYY'),7);

INSERT INTO BAITHI1.khach VALUES
('KH01','Lam Van Ben','Nam',655615896);
INSERT INTO BAITHI1.khach VALUES
('KH02','Duong Thi Luc','Nu',275648642);
INSERT INTO BAITHI1.khach VALUES
('KH03','Hoang Thanh Tung','Nam',456889143);

INSERT INTO BAITHI1.vexe VALUES
('T11A','KH01',TO_DATE('20/12/2016','DD/MM/YYYY'),210000);
INSERT INTO BAITHI1.vexe VALUES
('T32D','KH02',TO_DATE('25/12/2016','DD/MM/YYYY'),144000);
INSERT INTO BAITHI1.vexe VALUES
('T06F','KH03',TO_DATE('30/12/2016','DD/MM/YYYY'),270000);

-- Q5 --
SELECT * 
FROM vexe
WHERE extract(month from ngmua)=12
order by giave desc;

-- Q6 --
SELECT matuyen
from vexe
where extract(year from ngmua)=2016
group by matuyen
having count(matuyen) <= all
                (
                select count(matuyen)
                from vexe
                where extract(year from ngmua)=2016
                group by matuyen
                );    
-- Q8 --
select mahk
from khach
where gioitinh ='Nu' and NOT EXISTS 
(
    select *
    from tuyen
    where NOT EXISTS 
            (
            select *
            from vexe
            where vexe.mahk= khach.mahk and vexe.matuyen=tuyen.matuyen
            )
)




