
----CAU 2----

SELECT CN.MACN, TENCN, TENLOAIPH, COUNT(P.MAPH)
FROM C##CN02.CHINHANH@BTL1 CN JOIN C##CN02.PHONG@BTL1 P ON CN.MACN = P.MACN
        JOIN C##CN02.LOAIPHONG@BTL1 LP ON LP.MALOAIPH = P.MALOAIPH
WHERE TINHTRANG = 'Trống'
GROUP BY CN.MACN, TENCN, TENLOAIPH
UNION
SELECT CN3.MACN, TENCN, TENLOAIPH, COUNT(P3.MAPH)
FROM C##CN03.CHINHANH CN3 JOIN C##CN03.PHONG P3 ON CN3.MACN = P3.MACN
        JOIN C##CN03.LOAIPHONG LP3 ON LP3.MALOAIPH = P3.MALOAIPH
WHERE TINHTRANG = 'Trống'
GROUP BY CN3.MACN, TENCN, TENLOAIPH


----CAU 4----
SELECT *
FROM C##CN01.KHACHHANG_HIENTHI@BTL KH
WHERE NOT EXISTS (
                        SELECT LP.MALOAIPH
                        FROM C##CN01.LOAIPHONG@BTL LP JOIN C##CN01.PHONG@BTL P ON LP.MALOAIPH = P.MALOAIPH
                                JOIN CT_PHIEUTHUEPHONG CTPTP ON P.MAPH = CTPTP.MAPH
                        WHERE  NOT EXISTS (
                                                        SELECT *
                                                        FROM C##CN01.HOADON@BTL HD 
                                                        WHERE HD.MAKH = KH.MAKH AND HD.MAPTP = CTPTP.MAPTP
                                                        )
                        )
INTERSECT 
(SELECT *
FROM C##CN02.KHACHHANG_HIENTHI@BTL1 KH1
WHERE NOT EXISTS (
                        SELECT LP1.MALOAIPH
                        FROM C##CN02.LOAIPHONG@BTL1 LP1 JOIN C##CN02.PHONG@BTL1 P1 ON LP1.MALOAIPH = P1.MALOAIPH
                                JOIN CT_PHIEUTHUEPHONG CTPTP1 ON P1.MAPH = CTPTP1.MAPH
                        WHERE  NOT EXISTS (
                                                        SELECT *
                                                        FROM C##CN02.HOADON@BTL1 HD1 
                                                        WHERE HD1.MAKH = KH1.MAKH AND HD1.MAPTP = CTPTP1.MAPTP
                                                        )
                        )
)
MINUS
SELECT *
FROM KHACHHANG_HIENTHI
WHERE MAKH IN (SELECT MAKH
                FROM HOADON HD2 
                WHERE MAPTP IS NOT NULL
                GROUP BY MAKH
                HAVING  COUNT(*) > 0
                );


------CAU 6----
SELECT MADV
FROM (
SELECT A.MADV, SUM(SLDV)
FROM (
SELECT MADV, SLDV
FROM CT_PHIEUDICHVU
UNION
SELECT MADV,SLDV
FROM C##CN02.CT_PHIEUDICHVU@BTL1
) A
GROUP BY MADV
ORDER BY SUM(SLDV) DESC
)
WHERE ROWNUM <= 3;

-----CAU 8----
SELECT NV.HOTEN, MAHD, TONGTIEN
FROM C##CN02.NHANVIEN@BTL1 NV JOIN (
                        SELECT HD1.MAHD, HD1.TONGTIEN, HD1.MANV
                        FROM C##CN02.HOADON@BTL1 HD1 JOIN (
                                                SELECT KH.MAKH, COUNT(MAHD)
                                                FROM C##CN02.HOADON@BTL1 HD JOIN C##CN02.KHACHHANG_HIENTHI@BTL1 KH ON HD.MAKH = KH.MAKH
                                                WHERE QUOCTICH <> 'Việt Nam'
                                                GROUP BY KH.MAKH
                                                HAVING COUNT(MAHD) = 1
                                            ) A ON HD1.MAKH = A.MAKH
                        ) B ON B.MANV = NV.MANV
UNION
SELECT NV2.HOTEN, MAHD, TONGTIEN
FROM C##CN03.NHANVIEN NV2 JOIN (
                        SELECT HD2.MAHD, HD2.TONGTIEN, HD2.MANV
                        FROM C##CN03.HOADON HD2 JOIN (
                                                SELECT KH2.MAKH, COUNT(MAHD)
                                                FROM C##CN03.HOADON HD3 JOIN C##CN03.KHACHHANG_HIENTHI KH2 ON HD3.MAKH = KH2.MAKH
                                                WHERE QUOCTICH <> 'Việt Nam'
                                                GROUP BY KH2.MAKH
                                                HAVING COUNT(MAHD) = 1
                                            ) A2 ON HD2.MAKH = A2.MAKH
                        ) B2 ON B2.MANV = NV2.MANV

---CAU 10----
SELECT A.MAPDV, A.TIENDV, B.TONGTIEN
FROM PHIEUDICHVU A, HOADON B, KHACHHANG_HIENTHI C
WHERE A.MAPDV= B.MAPDV AND B.MAKH = C.MAKH AND
A.TIENDV >= B.TONGTIEN*30/100 AND A.TIENDV <= B.TONGTIEN*40/100
AND TO_DATE(B.NGAYTT)='01-DEC-2021' AND C.QUOCTICH ='Việt Nam';

