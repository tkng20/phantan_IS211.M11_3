CREATE TABLE USER_NEW(
U_ID NUMBER NOT NULL,
USERNAME VARCHAR2(40)NOT NULL,
PASS VARCHAR2(40) NOT NULL,
REGDAY DATE NOT NULL,
NATIONALITY VARCHAR2(40) NOT NULL,
CONSTRAINT PK_UI PRIMARY KEY(UID))

----BANG CHANNEL---
CREATE TABLE CHANNEL(
CHANNELID VARCHAR2(5) NOT NULL,
CNAME VARCHAR2(40)NOT NULL,
SUBSCRIBES NUMBER NOT NULL,
U_ID NUMBER NOT NULL,
CREATED DATE NOT NULL,
CONSTRAINT PK_CH PRIMARY KEY(CHANNELID))

-----BANG VIDEO----
CREATE TABLE VIDEO(
VIDEOID VARCHAR2(40) NOT NULL,
TITLE VARCHAR2(100)NOT NULL,
DURATION VARCHAR2(5) NOT NULL,
AGE NUMBER NOT NULL,
CONSTRAINT PK_CH PRIMARY KEY(VIDEOID))
-----BANG SHARE----
CREATE TABLE SHARE1(
VIDEOID VARCHAR2(40) NOT NULL,
CHANNELID VARCHAR2(40)NOT NULL,
CONSTRAINT PK_SH PRIMARY KEY(VIDEOID,CHANNELID))

----khoa ngoai----
ALTER TABLE SHARE1
ADD CONSTRAINT FK_VI FOREIGN KEY(VIDEOID) REFERENCES VIDEO(VIDEOID);
ALTER TABLE SHARE1
ADD CONSTRAINT FK_CH FOREIGN KEY(CHANNELID) REFERENCES CHANNEL(CHANNELID);

ALTER TABLE CHANNEL
ADD CONSTRAINT FK_US FOREIGN KEY(U_ID) REFERENCES USERR(U_ID);

-----THEM DU LIEU---
INSERT INTO USERR VALUES ('001','faptv','123456abc',TO_DATE('01/01/2014','DD/MM/YYYY'),'Việt Nam');
INSERT INTO USERR VALUES ('002','kemxoitv','@147869iii',TO_DATE('05/06/2015','DD/MM/YYYY'),'Campuchia');
INSERT INTO USERR VALUES ('003','openshare','qwertyuiop',TO_DATE('12/05/2009','DD/MM/YYYY'),'Việt Nam');

INSERT INTO CHANNEL VALUES ('C120','FAP TV','2343','001',TO_DATE('02/01/2014','DD/MM/YYYY'));
INSERT INTO CHANNEL VALUES ('C905','Kem xôi TV','1032','002',TO_DATE('09/07/2015','DD/MM/YYYY'));
INSERT INTO CHANNEL VALUES ('C357','OpenShare Cáfe','5064','003',TO_DATE('10/12/2010','DD/MM/YYYY'));


INSERT INTO VIDEO VALUES ('V100229','FAPtv Cơm Nguội Tập 41 - Đột Nhập','469','18');
INSERT INTO VIDEO VALUES ('V211002','Kem xôi: Tập 31 - Mẩy Kool tình yêu của anh','312','16');
INSERT INTO VIDEO VALUES ('V400002','Nơi tình yêu kết thúc - Hoàng Tuấn','378','0');


INSERT INTO SHARE1 VALUES ('V100229','C905');
INSERT INTO SHARE1 VALUES ('V211002','C120');
INSERT INTO SHARE1 VALUES ('V400002','C357');

----CAU 3-----
set serveroutput on;
create or replace trigger ktra_ngdknew
before insert or update of regday ON USERR
for each row 
begin
 :new.regday := sysdate ;
 DBMS_OUTPUT.PUT_LINE('regday updated');
end;
----CAU 4-----
set serveroutput on;
create or replace trigger check_NG before insert OR UPDATE on CHANNEL
for each row
declare 
v_regday userr.regday%type;
begin
select regday into v_regday
from userr
where u_id= :new.u_id ;
if :new.created <v_regday then
RAISE_APPLICATION_ERROR(-20000,'Ngay dang ki kenh be hon ngay tao user');
else 
DBMS_OUTPUT.PUT_LINE('Da them thanh cong');
end if;
end;

INSERT INTO CHANNEL VALUES ('C359','OpenShare Cáfe','5064','003',TO_DATE('17/05/2009','DD/MM/YYYY'));
-----CAU 5----
SELECT *
FROM VIDEO
WHERE AGE >=16

----cau 6-----
SELECT *
FROM CHANNEL
WHERE SUBSCRIBES = (SELECT MAX(SUBSCRIBES) 
                    FROM CHANNEL);
 
 ----CAU 7-----
select video.videoid, count(channelid) Tong
from video,share1
where video.videoid=share1.videoid and age>=18
group by video.videoid

----CAU 8-----
SELECT VIDEOID
FROM VIDEO
WHERE NOT EXISTS
(SELECT *FROM CHANNEL
WHERE  NOT EXISTS
(SELECT *FROM SHARE1
WHERE VIDEO.VIDEOID=SHARE1.VIDEOID AND SHARE1.CHANNELID = CHANNEL.CHANNELID))


