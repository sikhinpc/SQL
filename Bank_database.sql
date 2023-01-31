create database bank;
use bank;
create table branch(
Branch_name varchar(30) not null,
Branch_city varchar(30),
Asset int,
primary key(Branch_name)
);
create table Customer(
customer_name varchar(30) not null primary key,
customer_street varchar(255),
customer_city varchar(50)
);
create table account(
account_number int not null primary key,
Branch_name varchar(30),
Balance double);
create table loan(
Loan_number int not null primary key,
Branch_name varchar(30),
Amount double);
create table depositor(
customer_name varchar(30) not null,
account_number int primary key);
create table borrower(
customer_name varchar(30) not null,
loan_number int primary key);
create table employee(
employee_name varchar(30) not null,
branch_name varchar(20) not null,
salary double);

insert into account(account_number,branch_name,balance)
values(1001,'ERM',500),
(1002,'PNI',750),
(1003,'MLP',3000),
(1004,'TVM',800),
(1005,'TSR',650),
(1006,'PNI',900),
(1007,'PNI',600),
(1008,'TSR',950),
(1009,'PNI',1000);
insert into borrower(customer_name,loan_number)
values('Luka',100),
('Karim',101),
('Fede',102),
('Vini',103);
insert into branch(branch_name,branch_city,asset)
values('ERM','Maranchery',50000),
('MLP','Malappuram',100000),
('PNI','Tirur',600000),
('TVM','Trivandrum',100000),
('TSR','Thrissur',300000);
insert into customer(customer_name,customer_street,customer_city)
values('Luka','Zagreb','Croatia'),
('Karim','Lyon','France'),
('Fede','Montevideo','Uruguay'),
('Vini','Flamengo','(Brazil'),
('Eden','Brussels','Belgium'),
('Toni','Munich','Germany');
insert into depositor(customer_name,account_number)
values('Eden',1005),
('Toni',1006),
('Cama',1007),
('Karim',1002),
('Luka',1001),
('Fede',1004),
('Vini',1003);
insert into employee(employee_name,branch_name,salary)
values('carlo','ERM',6000),
('pintus','PNI',1000),
('Davide','TVM',3000),
('Flo','MLP',10000),
('Juni','TSR',1200),
('Mark','PNI',1000),
('Edu','TVM',5000),
('Erling','TSR',3200);
insert into loan(loan_number,branch_name,amount)
values(105,'PNI',10000),
(106,'TVM',3000),
(107,'ERM',25000),
(108,'MLP',14000);
select customer_name from customer;
select distinct branch_name from loan;
select * from account;
select * from account where balance>700;
select account_number,balance from account where branch_name="PNI" and balance>800; -- 'PNI' instead of Brighton--
select branch_name,asset as 'assets_in_thousands$' from branch;
select branch_name,asset from branch where asset between 200000 and 700000; -- name of branches where the assets between 200000 and 700000$ --
select d.customer_name,d.account_number,a.balance from depositor d join account a on d.account_number=a.account_number order by account_number;
select d.customer_name,d.account_number,a.balance from depositor d join account a on d.account_number=a.account_number where balance<700 order by balance desc; -- balance less than 700$ --
select * from employee where branch_name <>"PNI" and salary>1400; -- 'PNI' instead of Downtown --