declare 

           trans_id Varchar2(100);

        begin

           trans_id := dbms_transaction.local_transaction_id( TRUE );

        end; SELECT s.sid, s.serial#,

       CASE BITAND(t.flag, POWER(2, 28))

          WHEN 0 THEN 'READ COMMITTED'

          ELSE 'SERIALIZABLE'

       END AS isolation_level

    FROM v$transaction t 

    JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');

commit

ALTER SESSION SET ISOLATION_LEVEL=serializable; 

CREATE OR REPLACE PROCEDURE sleep (in_time number) AS  v_now date; BEGIN  SELECT SYSDATE  INTO v_now  FROM DUAL;

 LOOP

 EXIT WHEN v_now + (in_time * (1/86400)) <= SYSDATE;

 END LOOP; end; 



SELECT * 

FROM C##CN03.NHANVIEN@BTL1

where MANV= 'NV0001' 


UPDATE C##CN03.NHANVIEN@BTL1

SET LUONG=8000000

WHERE MANV='NV0001' Commit; 

---Sua lost update---

SELECT * 

FROM C##CN03.NHANVIEN@BTL1

WHERE MANV='NV0001';

-----Deadlock----

UPDATE C##CN03.LOAIPHONG@BTL1

SET DONGIA = 280000

WHERE TENLOAIPH = 'Standard Room' commit; 


UPDATE C##CN03.LOAIPHONG@BTL1

SET DONGIA = 320000

WHERE TENLOAIPH ='Superior Room' 



