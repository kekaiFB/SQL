--Обновляем количество доступных материалов, от тех поставщиков, услугами которых пользуемся

SET NOCOUNT ON
USE [delivery]
GO

SELECT shipper.title_material 
INTO #MaterialShipperInfo
FROM shipper
RIGHT JOIN material
ON material.id_shipper = shipper.id_shipper


UPDATE
[dbo].[material]
SET
count_material = 1000
WHERE title_material IN (select * from #MaterialShipperInfo)



