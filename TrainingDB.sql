-- create database named: traningDB
Create database TrainingDB
use TrainingDB -- change the current datbase
--create Tables syntax: Create table <tablena5e>(attribute1 Data type[not null|Primary Key...], attribute Datatype) 
Create table DEPARTMENTS(DNO CHAR(2) not null primary key, Dname varchar(50) not null, Location varchar(120))
--append data into Table
insert into DEPARTMENTS(Dno, Dname, Location)
Values ('IT', 'Information Technology', 'Room 204, floor 2, Building A'),
('CS', 'Computer Science', 'Room 205, floor 2, Building A'),
('MR', 'Marketing', 'Room 104, floor 1, Building A')
--show data
Select *from DEPARTMENTS

insert into DEPARTMENTS(Dno, Dname, Location)
Values ('IT', 'Computer Technology', 'Room 244, floor 2, Building A')

create table COURSES(Cno char(6) not null primary key, Cname varchar(50) not null, 
Credit int not null, Ctype bit not null)

select *from COURSES
Insert into COURSES(Cno, Cname, Credit, Ctype)
Values ('CSI101', 'Computer Science', 3, 1), 
('DBI202', 'Data Base Science', 2, 1), 
('LAB192', 'C LAB', 3, 0)

--foreign key: constraint <name of relation> foreign key (<Column>) References <Table>(<column>)
