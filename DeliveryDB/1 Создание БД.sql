/*
1. Какую бы Вы создали таблицу для описания поставщика материалов для производства
2. Спроектируйте структуру описывающую материал для производства
3. Спроектируйте структуру для описания готовой продукции
4. Спроектируйте структуру для хранения информации о использованных материалах для производства продукции
*/
--create database delivery

USE	delivery 
GO

create table shipper
(
id_shipper int not null IDENTITY(1,1) PRIMARY KEY,
name_shipper NCHAR(100) not null,
title_material NCHAR(100) not null
)

create table material
(
id_material int not null IDENTITY(1,1) PRIMARY KEY,
title_material NCHAR(100) not null unique,
count_material int DEFAULT 0,
id_shipper int not null FOREIGN KEY REFERENCES shipper (id_shipper),
CHECK (count_material >= 0)
)

create table product
(
id_product int not null IDENTITY(1,1) PRIMARY KEY,
title_product NCHAR(100) not null unique,
count_product int DEFAULT 0,
last_date_manufacture DATETIME DEFAULT NULL
)

create table product_composition
(
id_product_composition int not null IDENTITY(1,1) PRIMARY KEY,
id_product INT not null FOREIGN KEY REFERENCES product(id_product),
id_material INT not null FOREIGN KEY REFERENCES material(id_material),
count_material int not null
)

