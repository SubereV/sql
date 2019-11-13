create database ATM
use ATM

create table ACCOUNTS(AccNo char(5) not null primary key, Cno int, Cname varchar(21), DateExprired date, PIN int, balance float)
create table ACCOUNT_TRANSFER(TransferID int not null primary key, TranferTime time, AccnoSend char(5) not null foreign key references ACCOUNTS(AccNo), AccnoReceive char(5)not null foreign key references ACCOUNTS(AccNo), Amount float, fee float)
create table TRANSACTIONS(TranID int not null primary key, TranTime time, Withdraw float, Fee float, AccNo char(5) foreign key references ACCOUNTS(AccNo), MachineNo char(3))

SELECT * FROM Accounts
insert ACCOUNTS
values('acc01',123, 'Vo Nhu Khang', '2020-10-20', 1234, 2000),('acc02',234, 'Tran Trung Quan', '2019-1-20', 1234, 1230),
('acc03',123, 'Tran Quynh Ly', '2022-12-6', 1234, 1000), ('acc04',123, 'Phuong Nhu', '2025-2-12', 1234, 6000),
('acc05',123, 'Anh Tuan', '2020-2-10', 1234, 400)
update ACCOUnts
set Cno = case
when AccNo='acc01' then 325
when AccNo='acc02' then 234
when AccNo='acc03' then 543
when AccNo='acc04' then 527
when AccNo='acc05' then 637

SELECT * FROM Accounts
SELECT * FROM TRANSACTIONS

create trigger trigger_Withdraw
on TRANSACTIONS
for insert
as
begin
update ACCOUNTS
set balance-=inserted.WithDraw
from ACCOUNTS inner join inserted on ACCOUNTS.AccNo= inserted.AccNo
end

INSERT INTO TRANSACTIONS
VALUES (001,GETDATE(), 1800, 10, 'acc01','m01')

--//////////////////////////////////////////////
SELECT * FROM Accounts
SELECT * FROM ACCOUNT_TRANSFER

create trigger trigger_Transfer
on ACCOUNT_TRANSFER
for insert
as
begin
update ACCOUNTS
set balance= balance + -inserted.Amount-inserted.fee
from ACCOUNTS inner join inserted on ACCOUNTS.AccNo= inserted.AccnoSend
update ACCOUNTS
set balance = balance + inserted.Amount
from ACCOUNTS inner join inserted on ACCOUNTS.AccNo= inserted.AccnoReceive
end
--///////////////////////////
select * from ACCOUNTS
select * from ACCOUNT_TRANSFER
create trigger trigger_delete_Account
on ACCOUNT_TRANSFER
for insert
as
begin
update ACCOUNTS
set balance= balance + -inserted.Amount-inserted.fee
from ACCOUNTS inner join inserted on ACCOUNTS.AccNo= inserted.AccnoSend
update ACCOUNTS
set balance = balance + inserted.Amount
from ACCOUNTS inner join inserted on ACCOUNTS.AccNo= inserted.AccnoReceive
end

insert ACCOUNT_TRANSFER
values (123, GETDATE(), 'acc04', 'acc01', 3000, 20)

