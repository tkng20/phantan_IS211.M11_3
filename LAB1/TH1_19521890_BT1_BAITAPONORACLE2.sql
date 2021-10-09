CREATE USER BAITHI IDENTIFIED BY BAITHI;
GRANT CREATE SYNONYM, CREATE ANY TABLE TO BAITHI;
GRANT CONNECT, RESOURCE TO BAITHI;
GRANT OEM_MONITOR TO BAITHI;
GRANT DBA TO BAITHI;
GRANT CREATE VIEW TO BAITHI;

-- Q1 --
CREATE TABLE BAITHI.users (
        id INT NOT NULL Primary key,
        username VARCHAR2(128) NOT NULL, 
        pass VARCHAR2(128), 
        regday DATE,
        nationality VARCHAR2(128)
);

CREATE TABLE BAITHI.channel(
        channelid CHAR(4) NOT NULL PRIMARY KEY, 
        cname VARCHAR2(128) NOT NULL, 
        subcribes NUMBER, 
        owner INT, 
        created DATE,
        CONSTRAINT fk_owner foreign key (owner) REFERENCES users(id)
);

CREATE TABLE BAITHI.video (
        videoid CHAR(7) NOT NULL PRIMARY KEY, 
        title VARCHAR2(128), 
        duration number , 
        age number
);

CREATE TABLE BAITHI.shares (
        videoid CHAR(7) NOT NULL, 
        channelid CHAR(4),
        CONSTRAINT pk_vd_cn PRIMARY KEY (videoid,channelid),
        CONSTRAINT fk1 FOREIGN KEY (videoid) REFERENCES video(videoid),
        CONSTRAINT fk2 FOREIGN KEY (channelid) REFERENCES channel(channelid)
);

--- Q2 ---
INSERT INTO BAITHI.users VALUES
('001', 'faptv','123456abc',TO_DATE('01/01/2014','DD/MM/YYYY'),'VN');
INSERT INTO BAITHI.users VALUES
('002', 'kemxoitv','@147869iii',TO_DATE('05/06/2015','DD/MM/YYYY'),'Campuchia');
INSERT INTO BAITHI.users VALUES
('003', 'openshare','qwertyuiop',TO_DATE('12/05/2009','DD/MM/YYYY'),'VN');

INSERT INTO BAITHI.channel VALUES
('C120','FAP TV',2343,001,TO_DATE('02/01/2014','DD/MM/YYYY'));
INSERT INTO BAITHI.channel VALUES
('C905','Kem xoi TV',1032,002,TO_DATE('09/07/2015','DD/MM/YYYY'));
INSERT INTO BAITHI.channel VALUES
('C357','OpenShare Cafe',5064,003,TO_DATE('10/12/2010','DD/MM/YYYY'));

INSERT INTO BAITHI.video VALUES
('V100229','FAPtv Com nguoi tap 41 -Dot nhap',469,18);
INSERT INTO BAITHI.video VALUES
('V211002','Kem xoi: Tap 31 - May kool tinh yeu cua kem xoi',312,16);
INSERT INTO BAITHI.video VALUES
('V400002','Noi tinh yeu ket thuc- Hoang Tuan',378,0);

INSERT INTO BAITHI.shares VALUES
('V100229','C905');
INSERT INTO BAITHI.shares VALUES
('V211002','C120');
INSERT INTO BAITHI.shares VALUES
('V400002','C357');

-- Q3 ---
ALTER TABLE users
MODIFY regday DEFAULT current_date;

-- Q5 --
SELECT * 
FROM video
WHERE age >= 18;

-- Q6 --
SELECT channel.channelid
FROM channel
WHERE subcribes IN (
                    SELECT max(channel.subcribes)
                    FROM channel
                    );
                    
-- Q7 --
SELECT video.videoid, count(shares.channelid) sl
FROM video JOIN shares ON video.videoid = shares.videoid
WHERE video.age=18
GROUP BY video.videoid;

-- Q8 --
select videoid
from video
where NOT EXISTS 
(
    select channelid
    from channel
    where NOT EXISTS 
            (
            select videoid
            from shares
            where video.videoid = shares.videoid and channel.channelid= shares.channelid)
)




