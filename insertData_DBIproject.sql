use CINEMA

insert CUSTOMER
values	('Cus01','Tuan Huy','C','0123745623',300), ('Cus02','Quang Hai','B','0783132543',100),
		('Cus03','Quynh Tan','C','0635253411',420), ('Cus04','Xuan Linh','A','0736253421',500),
		('Cus05','Quynh Huong','B',null,180), ('Cus06','Anh Thy','A',null,610),
		('Cus07','Anh Hoai','B','0122545212',140), ('Cus08','Anh Dung','B','0873563619',200),
		('Cus09','Duc Huy','C',null,50), ('Cus10','Lan Nhi','A','0936456251',700),
		('Cus11','Phuong Nhu','A',null,720), ('Cus12','Nhu Khang','C','0123624621',40),
		('Cus13','Anh Tai','B',null,320), ('Cus14','Hoai Anh','A','0122745235',620),
		('Cus15','Thi Dao','C',null,100)	
select * from CUSTOMER
--------------------------------------------------------------------------------------------------------------------
insert STAFF
values	('Staff01','Do Anh Tuan', 'Shift01','01203923231'), ('Staff02','Tran Thao Ly', 'Shift01','09823772346'),
		('Staff03','Duong Anh Tai', 'Shift02','09371719422'), ('Staff04','Nguyen Thi Kieu', 'Shift03','01249821753'),
		('Staff05','Dinh Manh Hai', 'Shift03','09337563521')
select * from STAFF
--------------------------------------------------------------------------------------------------------------------
insert THEATER
values	('A',40), ('B',50), ('C',30)
select * from THEATER
--------------------------------------------------------------------------------------------------------------------
insert MOVIE
values	('SUP','Superman: Dark World',72,'Action, Hero, Gaint'), ('AVE','Avenger: End Game',132,'Action, Hero, Gaint'),
		('TIK','Tinker bell',93,'Cartoon, fairytail'), ('HPT','Harry Potter: Struggle Blood',70,'Magic, Mistery'),
		('JOK','Joker',154,'Drama, Stragedy, Absolutism')
select * from MOVIE
--------------------------------------------------------------------------------------------------------------------
insert SHOWTIME
values	('SA10','TIK','B','7:05'), ('SA11','HPT','C','8:10'), ('SA12','SUP','A','9:15'), ('SA13','AVE','A','10:25'),('SA14','JOK','B','11:00'),
		('CH10','HPT','A','12:05'), ('CH11','AVE','C','12:10'), ('CH12','TIK','B','14:05'), ('CH13','JOK','B','16:20'),('CH14','SUP','A','17:45'),
		('TO10','JOK','C','18:10'), ('TO11','AVE','A','19:10'), ('TO12','TIK','B','20:35'), ('TO13','HPT','B','21:20'),('TO14','JOK','A','21:45')
select * FROM SHOWTIME
--------------------------------------------------------------------------------------------------------------------
insert TICKET
values	('TKT264','SA10','Staff01','Cus09','2/14/2019'), ('TKT253','SA11','Staff01','Cus09','10/13/2019'), ('TKT265','SA13','Staff01','Cus05','5/18/2018'),
		('TKT841','CH11','Staff03','Cus10','6/02/2019'), ('TKT735','CH12','Staff03','Cus02','2/22/2019'), ('TKT642','CH12','Staff03','Cus09','6/27/2018'),
		('TKT573','TO12','Staff05','Cus11','10/05/2019'), ('TKT247','TO13','Staff04','Cus05','2/08/2019'), ('TKT524','TO11','Staff05','Cus11','7/15/2018'),
		('TKT572','SA13','Staff02','Cus12','9/17/2019'), ('TKT853','CH12','Staff03','Cus06','12/24/2018'), ('TKT571','SA13','Staff02','Cus12','3/13/2018'),
		('TKT463','CH11','Staff03','Cus13','11/06/2019'), ('TKT603','SA10','Staff02','Cus07','10/23/2018'), ('TKT823','TO10','Staff04','Cus09','2/14/2018'),
		('TKT252','CH12','Staff03','Cus14','7/22/2018'), ('TKT046','TO11','Staff04','Cus06','11/05/2018'), ('TKT364','SA14','Staff01','Cus07','4/05/2018'),
		('TKT214','TO14','Staff04','Cus15','1/18/2018'), ('TKT204','TO11','Staff05','Cus02','12/30/2018'), ('TKT262','CH11','Staff03','Cus03','5/12/2018')
SELECT * FROM TICKET