USE [delivery]
GO

SET NOCOUNT ON

INSERT INTO [dbo].[shipper] 
([name_shipper], [title_material]) 
VALUES
('Иван', 'бензин'),
('Иван', 'колесо'),
('Максим', 'каркас'),
('Александр', 'аккумулятор'),
('Андрей', 'стекло'),
('Алексей', 'сиденье'),
('Денис', 'бензин')


INSERT INTO [dbo].[material]
([title_material], [id_shipper])
VALUES
('бензин', 1),
('колесо', 2),
('каркас', 3),
('аккумулятор', 4),
('стекло', 5),
('сиденье', 6)


INSERT INTO [dbo].[product]
([title_product])
VALUES
('Седан'),
('Электрокар'),
('Велосипед')


INSERT INTO [dbo].[product_composition]
([id_product], [id_material], [count_material])
VALUES
(1, 1, 1),
(1, 2, 4),
(1, 3, 1),
(1, 4, 1),
(1, 5, 7),
(1, 6, 4),
(2, 2, 4),
(2, 3, 1),
(2, 4, 1),
(2, 5, 7),
(2, 6, 4),
(3, 2, 2),
(3, 3, 1),
(3, 5, 2),
(3, 6, 1)



