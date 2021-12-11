----Function--
----Câu 1----
---In ra tổng các hóa đơn của một khách hàng sử dụng tại tất cả chi nhánh với khách hàng có MAKH được truyền vào-

create or replace type t_record as object (
    V_MACN varchar2(20),
    V_MAKH varchar2(20),
     V_NGAYTT date,
    V_TONGTIEN number
);
create or replace type t_table as table of t_record;

create or replace function SUM_DOANHTHU ( V_MACN in VARCHAR2)
return t_table as v_ret   t_table;
begin
    select t_record(MACN, SUM(TONGTIEN) AS DOANHTHU) bulk collect into v_ret
    FROM (
IF(V_MACN='CN02') THEN
            SELECT MACN, SUM(TONGTIEN) AS DOANHTHU
            from C##CN02.HOADON@BTL1,C##CN02.CT_PHIEUTHUEPHONG@BTL1, C##CN02.PHONG@BTL1
            WHERE HOADON.MAPTP = CT_PHIEUTHUEPHONG.MAPTP and CT_PHIEUTHUEPHONG.MAPH
            ELSE 
	
            SELECT MACN, MAKH, NGAYTT, TONGTIEN
            from C##CN03.HOADON,C##CN03.CT_PHIEUTHUEPHONG, C##CN03.PHONG
            WHERE HOADON.MAPTP = CT_PHIEUTHUEPHONG.MAPTP and CT_PHIEUTHUEPHONG.MAPH
           

END IF;
        )
    where MAKH = V_MAKH
    return v_ret;
end;


-----Câu 2------
---Tính doanh thu của chi nhánh được nhập vào thông qua mã chi nhánh-----
create or replace type t_record as object (
    V_MACN varchar2(20),
    V_MAKH varchar2(20),
     V_NGAYTT date,
    V_TONGTIEN number
);
create or replace type t_table as table of t_record;

create or replace function SUM_DOANHTHU ( V_MACN in VARCHAR2)
return t_table as v_ret   t_table;
begin
    select t_record(MACN, SUM(TONGTIEN) AS DOANHTHU) bulk collect into v_ret
    FROM (
IF(V_MACN='CN02') THEN
            SELECT MACN, SUM(TONGTIEN) AS DOANHTHU
            from C##CN02.HOADON@BTL1,C##CN02.CT_PHIEUTHUEPHONG@BTL1, C##CN02.PHONG@BTL1
            WHERE HOADON.MAPTP = CT_PHIEUTHUEPHONG.MAPTP and CT_PHIEUTHUEPHONG.MAPH
            ELSE 
            SELECT MACN, MAKH, NGAYTT, TONGTIEN
            from C##CN03.HOADON,C##CN03.CT_PHIEUTHUEPHONG, C##CN03.PHONG
            WHERE HOADON.MAPTP = CT_PHIEUTHUEPHONG.MAPTP and CT_PHIEUTHUEPHONG.MAPH
           
END IF;
        )
    where MAKH = V_MAKH
    return v_ret;
end;
