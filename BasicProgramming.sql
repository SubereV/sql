/*Basic Programming in SQL
Declare Varialbe in SQL
Granted Value
Control structue in SQL (if, case,while)
block of code i SQL
-------


*/
/*
declare @name varchar(50), @age int = 30, @gender bit
set @name = 'John'
select @gender =1
if (@gender=1)
print 'Hello mr' + @name
else print	'Hello ms' + @name
*/
-------------------------------------------------
--block of code: begin..end
--sum 1+2+3+..+n
/*
declare @n int = 10 , @i int = 1, @result int=0
while(@i<=@n)
begin
	set @result+=@i
	set @i+=1
end
print str(@result)
*/
-----------------------------------------
/*
declare @n int = 10 , @i int = 1
while (@i<=@n)
begin
	if (@i<8) print 'Tap trung hoc tap!'
	else print 'Da nho!'
	set @i+=1
end
*/
-----------------------------------------------
/*
declare @n int = 12 , @i int = 2, @check int=1;
while (@i<@n or @check =0)
begin
	if(@n%@i=0) begin set @check=0 break end
	set @i+=1
end
if (@check=0) print str(@n) + ' khong la so nguyen to'
else print str(@n) + ' la so nguyen to'
*/
declare @P int = 1147 ,	@money1 float = 1.678, @money2 float = 1.734, @money3 float = 2.014, 
						@money4 float = 2.536, @money5 float = 2.834, @money6 float = 2.927,
						@value float = 0;
set @value = 1.0*case
when @P <=50 then	@P*@money1
when @P <=100 then	(@P-50)*@money2+50*@money1
when @P <=200 then	(@P-100)*@money3+50*(@money2+@money1)
when @P <=300 then	(@P-200)*@money4+100*@money3+50*(@money1+@money2)
when @P <=400 then	(@P-300)*@money5+100*(@money4+@money3)+50*(@money1+@money2)
else				(@P-400)*@money6+100*(@money5+@money4+@money3)+50*(@money1+@money2)
end
print 'Money spend for ' + str(@P)+ 'kwh'+ str(@value)
