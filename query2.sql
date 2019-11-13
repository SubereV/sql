use ATM
set transaction isolation level read uncommitted
select AccNo, balance from ACCOUNTS
where AccNo = 'acc01'