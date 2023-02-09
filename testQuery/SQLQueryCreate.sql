create database test

use test
go
create table Empolyee (
id INT primary key identity(1, 1),
salary int
)

insert into test.dbo.Empolyee (salary) values
(100),
(200),
(300)


select * from Empolyee



use test
go
create table Person (
id INT primary key identity(1, 1),
email varchar(50) not null,
)


set nocount on
insert into test.dbo.Person (email) values
('b@b.com'),
('h@h.com'),
('b@b.com')



use test
go
create table Weather (
id INT primary key identity(1, 1),
recordDate Date,
temperature int 
)


set nocount on
insert into test.dbo.Weather (recordDate, temperature) values
('2015-01-01', 10),
('2015-01-02', 25),
('2015-01-03', 20),
('2015-01-04', 30)



use test
go
create table Department (
id INT primary key identity(1, 1),
Name char(30)
)

set nocount on
insert into test.dbo.Department (Name) values
('IT'),
('Sales')


use test
go
create table Salary (
id INT primary key identity(1, 1),
Name char(30),
Salary int,
DepartmentId int Foreign key references test.dbo.Department(id)
)

set nocount on
insert into test.dbo.Salary (Name, Salary, DepartmentId) values
('Joe', 70000, 1),
('Jim', 90000, 1),
('Henry', 80000, 2),
('Sam', 60000, 2),
('Max', 90000, 1)
