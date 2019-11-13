Create database CINEMA
USE CINEMA

create table	STAFF(StaffID char(7) not null primary key, Name varchar(31) not null, Shiftt char(7) not null, PhoneNumber varchar(11))

create table	CUSTOMER(Cno char(5) primary key not null, Name varchar(31) not null, cType char default 'C',
				PhoneNumber varchar(11), SpendMoney float default 0)

create table	MOVIE(MovieID char(3) primary key not null, MovieName varchar(50), Duration int, mType varchar(50))

create table	THEATER(Room char primary key not null, Capacity int not null)

create table	SHOWTIME(ShowTimeID char(4) primary key, MovieID char(3) not null foreign key references MOVIE(MovieID),
				Room char not null foreign key references THEATER(Room), StartTime time(0) not null)

create table	TICKET(TicketNo char(6) primary key not null, ShowTimeID char(4) not null foreign key references SHOWTIME(ShowTimeID),
				StaffID char(7) not null foreign key references STAFF(StaffID), CustomerNo char(5) foreign key references CUSTOMER(Cno), ShowDate date not null)

--Tao procodure input ticket
/*Query:
1. Tìm top 3 khách hàng tích được nhiều điểm nhất
2. Tìm vé xuất chiếu vào buổi tối (TOXX) vào tháng 2 năm 2019
3. Tìm thông tin nhân viên đã bán vé:TIC253
4. Thay đổi MovieID tất cả xuất chiếu phim XX13 Thành JOK
*/
select * from STAFF
select * from CUSTOMER
select * from MOVIE
select * from THEATER
select * from SHOWTIME
select * from TICKET

--Tao trigger cho bang ticket update Customer.spendmoney:
go
create trigger tg_updateMoney_Cus
on Ticket
for insert
as
begin
update CUSTOMER
set SpendMoney += 20*case
when cType = 'A' then 5/100
when cType = 'B' then 3/100
else 2/100
end
from CUSTOMER inner join inserted on Cno = inserted.CustomerNo
end;
--Cập Nhật thuộc tính cType trong bảng Customer sao cho nếu spendMoney >200: B, >500: A
select * from CUSTOMER
UPDATE CUSTOMER 
set cType = case
when SpendMoney<200 then 'C'
when SpendMoney<500 then 'B'
else 'A'
end;
--1. 2 Bộ phim được xem nhiều nhất năm 2018
select top 2 movie.MovieName, Count(*) as T
from MOVIE inner join SHOWTIME 
	on Movie.MovieID= SHOWTIME.MovieID inner join TICKET
	on SHOWTIME.ShowTimeID = TICKET.ShowTimeID
where Year(ShowDate)=2018
group by MOVIE.MovieName
order by T DESC

--2. Đếm số vé bán được theo tên phim năm 2019
Select MovieName, Count(*) as SoVe
from MOVIE	right join SHOWTIME on Movie.MovieID= SHOWTIME.MovieID 
			right join TICKET on SHOWTIME.ShowTimeID = TICKET.ShowTimeID
where YEAR(ShowDate)=2019
group by Movie.MovieName

--5. Tính doanh thu theo quí và năm:$20/vé
go
create procedure DoanhThuTheoQui
@qui int,
@nam int
as
begin
select Count(*)*20 as DoanhThu
from Ticket
where month(showdate)<=(12/4*@qui) and month(showdate)>=(12/4*@qui-2) and YEAR(ShowDate)=@nam
end

execute DoanhThuTheoQui 3, 2018

---------------------GRANT AND REVOKE----------------------------
create role Manager;
create role Staff;

grant create table, create view, update,select
to manager;

grant select, insert, create table
to staff;

revoke create table from staff
