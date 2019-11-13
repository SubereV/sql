create database UNARY
use UNARY

create table EMPS(Eno char(3) primary key not null, Ename varchar(20) not null, managerID char(3) foreign key references EMPS(Eno))
select *from EMPS
insert EMPS
values ('E01','Nam',null), ('E02','Khoa','E01'), ('E03','Ngoc','E01'), ('E04','Chung',null), ('E05','Nga','E04')

Select b.Ename, a.Ename as Reportfor
from EMPS A inner join EMPS B on a.Eno = b.managerID
