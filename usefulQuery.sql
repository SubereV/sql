use JOB_DB

Select * from Emps
select * from Jobs
--subquery
select * from emps
where skill in (select skill from jobs where JobNo=1)
--between..and
select * from emps
where salary between 1200 and 1300
/*like
%: set of character
_: a character
*/
select * from emps
where skill like 'C%'

select * from emps
where salary like '12__'
---Bai Tap-------------------------------
select skill, COUNT(*) as Skill_Count from emps
group by skill
union
select 'Number of employees', COUNT(*) as Skill_Count from emps
group by skill
order by COUNT(*)
--------------------
select * from emps
where skill in (select skill from emps
group by skill
having Count(*)=1)
---------------------
select T1.*
from emps as t1, emps as t2
where day(T1.DateOfBirth)=day(T2.DateOfBirth)
and month(T1.DateOfBirth)=month(T2.DateOfBirth)
and T1.ENO<>T2.ENO
---------------------
select * from EMps

update Emps
set salary = salary*1.1
from (select top 2 * from emps order by Salary ASC) as T
where Emps.eno = T.eno

select top 3 * from CUSTOMER order by SpendMoney DESC

---------------------GRANT AND REVOKE----------------------------
create role admin
def