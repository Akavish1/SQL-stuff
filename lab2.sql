create table Students
(
Id NUMBER(6) primary key,
LastName VARCHAR2(20) not null,
FirstName VARCHAR2(10) not null,
Address VARCHAR2(10),
BirthDay DATE not null,
GroupId NUMBER(3)
); --1

insert into students values(101, 'Solin', 'Dan', 'BeerSheva', '01-FEB-85', 11); --2

alter table students add AvgMark number(5,2) default 0.00; --3

insert into students values(102, 'Tal', 'Ruti', 'Tel-Aviv', '10-JUL-88', 12, 70);
insert into students values(103, 'Kohen', 'Yosi', 'Dimona', '01-AUG-87', 11, 80);
insert into students values(104, 'Toys', 'Vered', 'Tel-Aviv', '15-SEP-88', 12, 90); --4

alter table students modify address varchar2(15); --5

create table students2
as select id, lastname, firstname, address, birthday, groupid
from students; --6

delete from students where birthday like to_date('10-JUL-88', 'DD-MON-YY'); --7

update students2 set groupid = 10 where groupid = 11; --8

rename students2 to students_new; --9

drop table students_new; --10




