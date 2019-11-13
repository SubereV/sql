USE HOUSEDB
Select * from CONTRACTS
Select * from CUSTOMERS
Select * from EMPLOYEES
Select * from HOUSES
--Q1
select * from HOUSES
where Price>=600 and Price<=800
order by Area_m2 DESC
--Q2 
select CUSTOMERS.* 
from CUSTOMERS inner join CONTRACTS on CUSTOMERS.CustomerID = CONTRACTS.CustomerID
WHERE ContractNo =  'CT001'
--Q3
select HOUSES.*
from HOUSES inner join CONTRACTS on HOUSES.HouseID = CONTRACTS.HouseID
where not(MONTH(CONTRACTS.StartDate) > 9)
--Q4
select BedRoom, COUNT(*) as Number_of_houses 
from HOUSES
group by BedRoom
--Q5
select CONTRACTS.EmpID, Count(*) as So_luong 
from CONTRACTS inner join EMPLOYEES on CONTRACTS.EmpID = EMPLOYEES.EmpID
group by CONTRACTS.EmpID
having Count(*)>=3
--Q6
select CUSTOMERS.Cname, CUSTOMERS.Gender, Houses.HouseID,HOUSES.Area_m2,
CONTRACTS.StartDate,CONTRACTS.Duration
from (CONTRACTS inner join CUSTOMERS on CONTRACTS.CustomerID = CUSTOMERS.CustomerID) inner join HOUSES on CONTRACTS.HouseID = HOUSES.HouseID
where month(CONTRACTS.EndDate)= 6 and YEAR(CONTRACTS.EndDate)=2018
--Q7
SELECT HOUSES.BedRoom, count(*) NumberOfHouses 
from HOUSES inner join CONTRACTS on HOUSES.HouseID = CONTRACTS.HouseID
where month(CONTRACTS.StartDate) > 6 and month(CONTRACTS.StartDate) < 10 and BedRoom = 1 and YEAR(Contracts.StartDate)=2018
Group by BedRoom
--Q8
Select HouseID,Count(*) as SoLanThue, sum(Duration) as TongTgThue, sum(ContractValue) as TongGiaTriHD
from CONTRACTS
where YEAR(StartDate)=2018
Group by HouseID
--Q9
select top 1 *
from CONTRACTS
Order By Duration DESC
--Q10
Select * 
from HOUSES
where Price<500 and BedRoom = 3
