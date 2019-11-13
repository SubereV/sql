create database SQL_TEST
use SQL_TEST
--Cau 1a:
create table CANHO(MaCanHo char(5) primary key not null, LoaiCanHo char not null, DienTich float not null, DonGiaThue float not null)
create table KHACHTHUE(MaKhach char(5) primary key not null, HoTen varchar(30) not null, DiaChi varchar(50) not null, DienThoai char(10), GioiTinh varchar(8) not null)
create table HOPDONG(SoHopDong char(6) primary key, MaCanHo char(5) not null foreign key references CANHO(MaCanHo), 
MaKhach char(5) not null foreign key references KHACHTHUE(MaKhach),NgayThue date not null, NgayTra date not null, ThoiGianThue int, GiaTriHopDong float, ChietKhau int)

--Cau 1b:
insert CANHO
values ('can11', 'A', 100, 100), ('can12', 'B', 50, 150), ('can13', 'C', 70, 100),('can14', 'B', 80, 100),
('can01', 'A', 75, 300), ('can02', 'C', 65, 400), ('can03', 'A', 75, 100)
select * from CANHO

insert KHACHTHUE
values ('Cus01', 'Vo Anh Khoi', '120 Le Huu Trac', '0120382462','Male'), ('Cus02', 'Phan Tuan Kiet', '20 Ong Ich Khiem', '0927326321','Male'), 
('Cus03', 'Dang Thuy Tram', '87 Ngo Quyen', null,'Female'), ('Cus11', 'Pham Nguyen Phuong Nhu', '72 Nguyen Dinh Duongw', '0638137413','Female'),
('Cus12', 'Nguyen Minh Hieu', '182 Nguyen Luong Bang', null,'Male'), ('Cus13', 'Vo Nhu Khang', '145 Bui Cong Chu', '0120237465','Male')
select * from KHACHTHUE

insert HOPDONG(SoHopDong,MaCanHo,MaKhach,NgayThue,NgayTra)
values ('HD0001', 'can03', 'Cus11', '11/11/2018','7/6/2019'), ('HD0010', 'can13', 'Cus13', '10/1/2018','4/3/2019'),
('HD0011', 'can02', 'Cus12', '11/11/2018','7/6/2019'), ('HD0101', 'can14', 'Cus03', '10/9/2018','7/3/2019'),
('HD1031', 'can02', 'Cus12', '1/1/2018','7/10/2018'), ('HD1421', 'can01', 'Cus01', '11/11/2018','7/6/2019')
select * from HOPDONG

--Cau 1c:
select * from CANHO
update CANHO
set DonGiaThue = case
when LoaiCanHo = 'A' then 700
when LoaiCanHo = 'B' then 500
else 400
end;

--Cau 1d:
select * from HOPDONG
update HOPDONG
set ThoiGianThue = DATEDIFF(MM,NgayThue,NgayTra)

--Cau 1e:
UPDATE HOPDONG
set GiaTriHopDong = ThoiGianThue*DonGiaThue
from HOPDONG inner join CANHO on HOPDONG.MaCanHo=CANHO.MaCanHo

--cau 1f
select KHACHTHUE.*
from KHACHTHUE inner join HOPDONG on KHACHTHUE.MaKhach=HOPDONG.MaKhach
where SoHopDong='HD0011'

--cau 1g
select LoaiCanHo, count(*) SoCanHo
from CANHO
group by LoaiCanHo

--cau 1h
select *
from HOPDONG
where MONTH(NgayThue) between 1 and 3 and YEAR(NgayThue)=2018

--cau 2:
go
create function TinhChietKhau(@thoigianthue int, @giatrihd float)
returns float
as
begin
declare @chietkhau float
if @thoigianthue <= 3
	set @chietkhau = 0
	else if @thoigianthue between 4 and 6 set @chietkhau= @giatrihd * 5/100
		else if @thoiGianThue between 7 and 12 set @chietkhau= @giatrihd * 7/100
			else set @chietkhau =@giatrihd*0.1
return @chietkhau
end

--cau3
go
create procedure insert_HopDong
@sohd char(6) = null,
@macanho char(5) = null,
@makhac  char(5) = null,
@ngayt date,
@ngayra date
as
begin
IF not EXISTS(SELECT * FROM HOPDONG where HOPDONG.SoHopDong = @sohd) and EXISTS(SELECT * FROM CANHO where CANHO.MaCanHo = @macanho)
and EXISTS(SELECT * FROM KHACHTHUE where KHACHTHUE.MaKhach = @makhac)
insert HOPDONG(SoHopDong,MaCanHo,MaKhach,NgayThue,NgayTra)
values (@sohd, @macanho,@makhac,@ngayt, @ngayra)
end
