--1 ЭТАП СОЗДАНИЕ БД И ТАБЛИЦ --------------------------------------------------------

--create database Hostel
USE	Hostel 
GO

create table hostel
(
id_hostel int not null IDENTITY(1,1) PRIMARY KEY,
location_hostel NCHAR(200) not null,
number_floors int not null,
CHECK (number_floors >= 1)
)

create table room
(
id_room int not null IDENTITY(1,1) PRIMARY KEY,
number_residents int DEFAULT 0,
number_room int not null,
sex CHAR(1) not null,
id_hostel int not null FOREIGN KEY references hostel(id_hostel) ON DELETE CASCADE,
CHECK (sex IN ('М', 'Ж')),
CHECK (number_residents <= 4 AND number_residents >= 0)
)

create table faculty
(
id_faculty int not null IDENTITY(1,1) PRIMARY KEY,
name_faculty NCHAR(5) unique not null,
full_name_faculty NCHAR(100) not null,
)

create table group_faculty
(
id_group int not null IDENTITY(1,1) PRIMARY KEY,
group_number NCHAR(10) unique not null,
name_faculty NCHAR(5) not null FOREIGN KEY references faculty(name_faculty),
)

create table student
(
id_student int not null IDENTITY(1,1) PRIMARY KEY,
last_name NCHAR(50) not null ,
first_name NCHAR(50) not null,
otchestvo NCHAR(50),
sex CHAR(1) not null,
group_number  NCHAR(10) FOREIGN KEY references group_faculty(group_number),
course_study int not null,
CHECK (sex IN ('М', 'Ж')),
CHECK (course_study >= 1)
)

create table occupancy_statement
(
id_occupancy_statement int not null IDENTITY(1,1) PRIMARY KEY,
id_student int not null unique FOREIGN KEY references student(id_student),
datee DATETIME not null DEFAULT getdate()
)

create table occupancy_order
(
id_occupancy_order int not null IDENTITY(1,1) PRIMARY KEY,
id_occupancy_statement int not null unique FOREIGN KEY references occupancy_statement(id_occupancy_statement),
id_room int not null FOREIGN KEY references room(id_room),
date_start DATETIME not null DEFAULT getdate(),
date_end DATETIME DEFAULT null,
)
