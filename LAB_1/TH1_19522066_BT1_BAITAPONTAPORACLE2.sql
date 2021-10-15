CREATE USER C##BAITHIHTTT2 IDENTIFIED BY C##BAITHIHTTT2;
GRANT CONNECT , RESOURCE , DBA TO C##BAITHIHTTT2;
GRANT CREATE ANY TABLE TO C##BAITHIHTTT2;

CREATE TABLE C##BAITHIHTTT2.USER_NEW
(
    U_ID VARCHAR2(3) NOT NULL ,
    USERNAME VARCHAR2(25),
    PASS VARCHAR2(25),
    REGDAY DATE,
    NATIONALITY VARCHAR2(50),
    CONSTRAINT PK_U PRIMARY KEY(U_ID)
);
CREATE TABLE C##BAITHIHTTT2.CHANNEL
(
    CHANNELID VARCHAR2(4) NOT NULL,
    CNAME VARCHAR2(50),
    SUBSCRIBES NUMBER,
    U_ID VARCHAR2(3),
    CREATED DATE,
    CONSTRAINT PK_C PRIMARY KEY(CHANNELID)
);
CREATE TABLE C##BAITHIHTTT2.VIDEO
(
    VIDEOID VARCHAR2(7) NOT NULL,
    TITLE VARCHAR2(100),
    DURATION NUMBER,
    AGE NUMBER,
    CONSTRAINT PK_VI PRIMARY KEY(VIDEOID)
);
CREATE TABLE C##BAITHIHTTT2.SHARE_
(
    VIDEOID VARCHAR2(7) NOT NULL,
    CHANNELID VARCHAR2(4) NOT NULL,
    CONSTRAINT PK_S PRIMARY KEY(VIDEOID, CHANNELID)
);
select * from C##BAITHIHTTT2.USER_NEW;
select * from C##BAITHIHTTT2.CHANNEL;
select * from C##BAITHIHTTT2.VIDEO;
select * from C##BAITHIHTTT2.SHARE_;
ALTER TABLE C##BAITHIHTTT2.CHANNEL
ADD CONSTRAINT FK_CH FOREIGN KEY(U_ID) REFERENCES C##BAITHIHTTT2.USER_NEW(U_ID);
ALTER TABLE C##BAITHIHTTT2.SHARE_
ADD CONSTRAINT FK_S_1 FOREIGN KEY (VIDEOID) REFERENCES C##BAITHIHTTT2.VIDEO (VIDEOID);
ALTER TABLE C##BAITHIHTTT2.SHARE_
ADD CONSTRAINT FK_S_2 FOREIGN KEY (CHANNELID) REFERENCES C##BAITHIHTTT2.CHANNEL (CHANNELID);

INSERT INTO C##BAITHIHTTT2.USER_NEW(U_ID, USERNAME, PASS, REGDAY, NATIONALITY)
VALUES('001', 'faptv', '123456abc', TO_DATE('01/01/2014','DD/MM/YYYY'), 'Vi?t Nam');
INSERT INTO C##BAITHIHTTT2.USER_NEW(U_ID, USERNAME, PASS, REGDAY, NATIONALITY)
VALUES('002', 'kemxoitv', '@147869iii', TO_DATE('05/06/2015', 'DD/MM/YYYY'), 'Campuchia');
INSERT INTO C##BAITHIHTTT2.USER_NEW(U_ID, USERNAME, PASS, REGDAY, NATIONALITY)
VALUES('003', 'openshare', 'qwertyuiop', TO_DATE('12/05/2009', 'DD/MM/YYYY'), 'Vi?t Nam');

INSERT INTO C##BAITHIHTTT2.CHANNEL(CHANNELID, CNAME, SUBSCRIBES, U_ID, CREATED)
VALUES('C120', 'FAP TV', 2343, '001', TO_DATE('02/01/2014', 'DD/MM/YYYY'));
INSERT INTO C##BAITHIHTTT2.CHANNEL(CHANNELID, CNAME, SUBSCRIBES, U_ID, CREATED)
VALUES('C905', 'Kem x�i TV', 1032, '002', TO_DATE('09/07/2015', 'DD/MM/YYYY'));
INSERT INTO C##BAITHIHTTT2.CHANNEL(CHANNELID, CNAME, SUBSCRIBES, U_ID, CREATED)
VALUES('C357', 'OpenShare Cafe', 5064, '003', TO_DATE('10/12/2010', 'DD/MM/YYYY'));

INSERT INTO C##BAITHIHTTT2.VIDEO(VIDEOID, TITLE, DURATION, AGE)
VALUES('V100229', 'FAPtv C?m Nguoi T?p 41 - ??t Nh?p', 469, 18);
INSERT INTO C##BAITHIHTTT2.VIDEO(VIDEOID, TITLE, DURATION, AGE)
VALUES('V211002', 'Kem x�i: T?p 31 - M?y Kool t�nh y�u c?a anh', 312, 16);
INSERT INTO C##BAITHIHTTT2.VIDEO(VIDEOID, TITLE, DURATION, AGE)
VALUES('V400002', 'N?i t�nh y�u k?t th�c - Ho�ng Tu?n', 378, 0);

INSERT INTO C##BAITHIHTTT2.SHARE_(VIDEOID, CHANNELID)
VALUES('V100229', 'C905');
INSERT INTO C##BAITHIHTTT2.SHARE_(VIDEOID, CHANNELID)
VALUES('V211002', 'C120');
INSERT INTO C##BAITHIHTTT2.SHARE_(VIDEOID, CHANNELID)
VALUES('V400002', 'C357');

---CAU 3 Ng�y ??ng k� ???c m?c ??nh l� ng�y hi?n t?i.
CREATE OR REPLACE TRIGGER TR_USER
BEFORE INSERT OR UPDATE ON C##BAITHIHTTT2.USER_NEW
FOR EACH ROW
BEGIN
    :NEW.REGDAY := SYSDATE;
END;
--CAU 4 Hi?n th?c r�ng bu?c to�n v?n sau: Ng�y t?o k�nh lu�n l?n h?n ho?c b?ng ng�y ??ng k� c?a 
--ng??i d�ng s? h?u k�nh ?�.
CREATE OR REPLACE TRIGGER C##BAITHIHTTT2.TR_CHANNEL
BEFORE INSERT OR UPDATE ON C##BAITHIHTTT2.CHANNEL
FOR EACH ROW
DECLARE
    REG_DAY CHANNEL.REGDAY%TYPE;
BEGIN
    SELECT REGDAY INTO REG_DAY FROM C##BAITHIHTTT2.USER_NEW
    WHERE U_ID  = :NEW.U_ID;
    IF TO_DATE(REG_DAY,'DD/MM/YYYY') > TO_DATE(:NEW.CREATED) 
    THEN 
    BEGIN
        DBMS_OUTPUT.PUT_LINE('ERROR');
    END;
    END IF;
END;

---CAU 5 
SELECT * FROM C##BAITHIHTTT2.VIDEO 
WHERE AGE >= 16;
--CAU 6 
SELECT * FROM C##BAITHIHTTT2.CHANNEL
WHERE SUBSCRIBES IN (SELECT MAX(SUBSCRIBES) 
                    FROM C##BAITHIHTTT2.CHANNEL);
--CAU 7 V?i m?i video c� gi?i h?n ?? tu?i l� 18, th?ng k� s? k�nh ?� chia s?.
SELECT VIDEO.VIDEOID, COUNT(SHARE_.CHANNELID) SL
FROM C##BAITHIHTTT2.SHARE_,C##BAITHIHTTT2.VIDEO  
WHERE C##BAITHIHTTT2.SHARE_.VIDEOID = C##BAITHIHTTT2.VIDEO.VIDEOID AND AGE >=18
GROUP BY VIDEO.VIDEOID;
--CAU 8 T�m video ???c t?t c? c�c k�nh chia s?.
SELECT * FROM C##BAITHIHTTT2.VIDEO 
WHERE NOT EXISTS (SELECT *
                    FROM C##BAITHIHTTT2.CHANNEL 
                    WHERE NOT EXISTS(SELECT *
                                    FROM C##BAITHIHTTT2.SHARE_
                                    WHERE VIDEO.VIDEOID = SHARE_.VIDEOID AND SHARE_.CHANNELID = CHANNEL.CHANNELID));