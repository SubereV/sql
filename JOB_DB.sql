use JOB_DB
select * from EMPS
select * from JOBS
--remove duplicate values
select distinct skill from EMPS
--top n: get top n rows
select top 4 * from EMPS
order by SALARY ASC --ascessing or descending: ASC/DESC
--Where condition on rows
select * from EMPS
where SKILL = 'SQL'
/*Group by: using statistical functions:
Count, max, min, sum, avg
*/
select Skill, count(*) as Skill_Count,
sum(SALARY) as Sum_Sal, MAX(SALARY) as Max_Sal,
MIN(SALARY) as Min_Sal, AVG(SALARY) as Avg_Sal
from EMPS
Group by SKILL
--Having: conditon on Group
select Skill, count(*) as Skill_Count
from EMPS
Group by SKILL
having COUNT(*)>2
--Join types in SQL
--Cross Join
select * from EMPS, JOBS
--inner join
select * 
from EMPS inner join JOBS on EMPS.SKILL = JOBS.Skill
--Our join: left, right, full
select *
from EMPS left join JOBS on EMPS.SKILL = JOBS.Skill

select *
from EMPS right join JOBS on EMPS.SKILL = JOBS.Skill

select *
from EMPS full join JOBS on EMPS.SKILL = JOBS.Skill