use OTO
--Q1
select *
from XE
where HangSX = 'Toyota'
order by DonGia  DESC
--Q2
select top 2 * from XE
WHERE SOCHO=4
order by DonGia ASC
--Q3
select Socho, COUNT(*) as SoLuong 
from XE
group by Socho
--Q4
Select HangSX,count(*) as SoLuong
from XE
group by HangSX
having count(*) >= 3
--Q5
select KHACH.*
from KHACH inner join HOPDONG on KHACH.CMND = HOPDONG.CMND
where MONTH(NgayKy) > 9
--Q6
select Bienso, COUNT(*) as SoLanThue,SUM(ThoiGianThue) as TONG_ThoiGian
from HOPDONG
where YEAR(NgayKy)=2018
group by Bienso
--Q7
select * 
from HOPDONG
where MONTH(NgayKy)=10
order by GiaTriHD DESC