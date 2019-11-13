select * from KHACH
select * from XE
select * from HOPDONG

select HangSX, DonGia
from XE	
where Socho='4'
--natural join
select HoTen, DienThoai
from KHACH inner join HOPDONG on KHACH.CMND=HOPDONG.CMND
where SoHD = 'HD001'
--subquery
select HoTen, DienThoai
from KHACH 
where CMND in (select CMND from HOPDONG where SoHD='HD001') 