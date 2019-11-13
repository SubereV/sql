use ATM
select * from ACCOUNTS
begin transaction
	update ACCOUNTS set balance = 100
	where AccNo = 'acc01'
	waitfor delay '00:00:10'
rollback transaction