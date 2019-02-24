drop table product;
drop table pc;
drop table laptop;
drop table printer;

create table Product
(
Maker varchar(1) not null,
Model number(4) primary key,
Type varchar(20) not null
);


create table Pc
(
Model number(4) primary key,
Speed number(5) not null,
Ram number(4) not null,
Hd number(3) not null,
Price number(5) not null
);

create table Laptop
(
Model number(4) primary key,
Speed number(5) not null,
Ram number(4) not null,
Hd number(3) not null,
Screen float(4) not null,
Price number(5) not null
);

create table Printer
(
Model number(4) primary key,
Color varchar(6) not null,
Type varchar(20) not null,
price number(5) not null
);
