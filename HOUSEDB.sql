create database HOUSEDB
use HOUSEDB
CREATE TABLE EMPLOYEES(EmpID char(5) not null primary key, Ename varchar(50) not null, Email char, salary int not null, gender bit not null)
CREATE TABLE HOUSES(HouseID char(3) not null primary key, Area_m2 int not null, Price int, bedroom int not null) 
CREATE TABLE CUSTOMERS(CustomerID char(7) not null primary key, gender bit not null, Cname varchar(50) not null, Caddress varchar(50),
Email char)
CREATE TABLE CONTRACTS(ContractNo int not null primary key, HouseID char(3) not null constraint FK_HouseID 
foreign key references HOUSES(HouseID), EmpID char(5) not null constraint FK_EmpID foreign key references EMPLOYEES(EmpID), 
CustomerID char(7) not null constraint FK_CustomerID foreign key references CUSTOMERS(CustomerID), StartDate date not null, 
EndDate date not null, Duration int, ContractValue int, PrePaid int, OutstandingAmount int)

select * from EMPLOYEES
select * from HOUSES
select * from CUSTOMERS
select * from CONTRACTS
--Q1
insert HOUSES(HouseID, Area_m2, Price, bedroom)
values ('101', 50, null, 2), ('102', 45, null, 2), ('103', 80, null, 4), ('104', 120, null, 8) 

update HOUSES
set Price = case
when Area_m2<=70 then 163
when Area_m2<=90 then 300
when Area_m2<=100 then 400
else 500
end
select * from HOUSES

--Q2
update HOUSES
set Price = Price*iif(Area_m2>70 and Area_m2 <90, 1, 1.2)
select * from HOUSES

--Q3
insert EMPLOYEES
values ('Emp01','Nguyen Quang Hieu', null, 200, 0), ('Emp02','Vo Nhu Khang', null, 200, 0), ('Emp03','Dang Thuy Tram', null, 200, 1)
select * from EMPLOYEES
insert CUSTOMERS
values ('Custom1', 1, 'Tring Quang Hien', '145 Tran Binh Trong', null), ('Custom2', 0, 'Huynh Long', '79 Ngo Gia Tu', null), 
('Custom3', 0, 'Son Tung MTP', '193 Nguyen Luong Bang', null), ('Custom4', 0, 'La Ngoc Phuc', '104 Tran Binh Trong', null), ('Custom5', 0, 'Nguyen Phuc Long', '20 Ngo Gia Tu', null) 
select * from CUSTOMERS
insert into CONTRACTS(ContractNo, HouseID, EmpID, CustomerID, StartDate, EndDate)
values	(1, '102', 'Emp01', 'Custom1', '2000-11-8', '2002-12-8'),
		(2, '104', 'Emp02', 'Custom3', '2000-7-12', '2001-1-6'),
		(3, '101', 'Emp03', 'Custom2', '2000-5-1', '2000-12-5'),
		(4, '101', 'Emp01', 'Custom5', '2002-12-9', '2004-12-9'),
		(5, '104', 'Emp03', 'Custom3', '2000-6-8', '2000-12-5')
Select * from CONTRACTS

update CONTRACTS
set Duration = datediff(MONTH,StartDate, EndDate)
select * from CONTRACTS
--Q4
update CONTRACTS
set ContractValue = Duration * Price
from CONTRACTS inner join HOUSES on CONTRACTS.HouseID = HOUSES.HouseID
select * from CONTRACTS
--Q5
update CONTRACTS 
set PrePaid = ContractValue * case
when Duration>12 then 0.5
when Duration>=6 then 0.7
else 0.85
end
select * from CONTRACTS
--Q6
update CONTRACTS
set OutstandingAmount = ContractValue*1.1-PrePaid
