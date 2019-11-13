
Create database SaleDB
use SaleDB

create table Items(Ino char(5) not null primary key, Iname varchar(20) not null, TaxRate int not null, UnitPrice float, AmountAvailable int)
create table Customers(Cno char(5) not null primary key, Cname varchar(31)  not null, Caddress varchar(50), Email varchar(50))
create table Orders(Ono char(4) primary key not null, Odate date not null, Cno char(5) not null foreign key references Customers(Cno),
Ino char(5) foreign key references Items(Ino), Amount float, Tax float, Total float)

--Q2
select *
from Items
insert Items
values ('item1','Harry Potter', 15,20.5, 10), ('item2','Connan', 10,5.25, 20), ('item3','Gene Atlantic', 15,20.25, 30),
 ('item4','Doraemon', 10,2, 50), ('item5','Sherlock Homes',20,100.75, 15)

select *
from Customers
insert Customers
values ('cus01', 'Vo Nhu Khang', '133 Le Dinh Duong','khangvnde140179@fpt.edu.vn'), ('cus23', 'Ngo Le Hong Nhan', '23 Tran Quoc Toan',''), 
('cus41', 'Tran Trung Quan', '62 Hoang Hoa Tham','caubengocnghech@gmail.com'), ('cus07', 'Vo Ai Nghia', '128 Hung Vuong',''),
('cus11', 'Pham Nguyen Phuong Nhu', '145 Bui Cong Trung','nhupnpds140095@fpt.edu.vn'), ('cus34', 'Phan Anh Tuan','','')

select * 
from Orders
insert Orders(Ono,Odate, Cno, Ino, Amount)
values ('1100', '2018/09/7', 'cus41','item4',10), ('1101', '2018/10/21', 'cus34','item3',2), ('1361', '2018/12/2', 'cus23','item2',8),
('1363', '2018/12/23', 'cus11','item4',6), ('1313', '2019/05/17', 'cus01','item1',2), ('1354', '2019/04/19', 'cus07','item5',3),
('1621', '2019/01/20', 'cus23','item1',4),('1562','2018/06/27', 'cus34','item2',7),('1541', '2018/06/23', 'cus01','item1',3)

update Orders
set Tax = case
when Ino = 'item2' or Ino = 'item4' then 2
when Ino = 'item1' then 5
else 10
end;

--Q3
select * 
from Orders
update Orders
set Total = Amount * UnitPrice
from Orders inner join Items on Orders.Ino = Items.Ino

--Q4
select * 
from Orders
update Orders
set Tax = Total * TaxRate/100
from Orders inner join Items on Orders.Ino = Items.Ino

--Q5
select top 2 *
from Orders
where YEAR(Odate)=2018
order by Total Desc

--Q6
select Customers.*
from Customers inner join Orders on Customers.Cno = Orders.Cno
where Ono='1101'

--Q7
go
create Trigger trg_Insert_Order
on Orders 
for insert
as
begin
update Items
set AmountAvailable -= inserted.Amount
from Items inner join inserted on Items.Ino = inserted.Ino
end;

--Q8
select *
from Items

create procedure sp_Insert_Order
as
begin
insert Orders(Ono,Odate, Cno, Ino, Amount)
values ('1323', '2018/11/3', 'cus01','item2',2)
end

EXECUTE sp_Insert_Order

