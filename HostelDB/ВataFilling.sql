-------3 ЭТАП Наполнение данных с учетом триггеров--------------------------------

USE [Hostel]
GO
INSERT INTO [dbo].[hostel] ([location_hostel], [number_floors]) VALUES ('Ф. Лыткина 8', 9)
INSERT INTO [dbo].[hostel] ([location_hostel], [number_floors]) VALUES ('Ф. Лыткина 18', 9)
INSERT INTO [dbo].[hostel] ([location_hostel], [number_floors]) VALUES ('Кирова 54', 6)



USE [Hostel]
GO
INSERT INTO [dbo].[faculty]
([full_name_faculty], [name_faculty])
VALUES
('Факультет безопасности', 'ФБ'),
('Экономический факультет', 'ЭФ'),
('Гуманитарный факультет', 'ГФ')



USE [Hostel]
GO
INSERT INTO [dbo].[group_faculty]
([group_number], [name_faculty])
VALUES
('708-2', 'ФБ'),
('758', 'ФБ'),
('44-М', 'ЭФ'),
('111', 'ЭФ'),
('103', 'ГФ'),
('101', 'ГФ')

USE [Hostel]
GO
INSERT INTO [dbo].[student]
			([last_name]
           ,[first_name]
           ,[otchestvo]
           ,[sex]
           ,[group_number]
           ,[course_study])
     VALUES
('Karlov','Petya','Ivanovich', 'М', '708-2',3),
('Petrov','Ivan','Petrovich', 'М', '708-2',3),
('Kolishev','Maksim','Maksimovich', 'М', '758',2),
('Kuzmin','Ivan','Ivanov', 'М', '758',2),
('Lesnova','Masha','Ivanova', 'Ж', '44-М',1),
('Gaborenko','Darya','Nikitichna', 'Ж', '44-М',1), 
('Parlov','Petya','Ivanovich', 'М', '708-2',3),
('Ketrov','Aleksey','Naturov', 'М', '708-2',3),
('Rolishev','Maksim','Ruslanovich', 'М', '758',2),
('Vuzmin','Ivan','Maksimovich', 'М', '758',2),
('Kesnova','Sasha','Ivanova', 'Ж', '44-М',1),
('Baborenko','Marya','Nikitichna', 'Ж', '44-М',1)
GO



USE [Hostel]
GO
INSERT INTO [dbo].[occupancy_statement]
([id_student])
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)
    

USE [Hostel]
GO
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (1, 1)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (2, 1)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (3, 1)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (4, 1)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (5, 5)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (6, 5)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (7, 2)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (8, 2)
INSERT INTO [dbo].[occupancy_order] ([id_occupancy_statement], [id_room]) VALUES (9, 3)
GO
