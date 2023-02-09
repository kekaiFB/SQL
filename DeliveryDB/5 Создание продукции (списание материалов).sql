--Создание продукции, соответственно списание материалов

SET NOCOUNT ON
USE [delivery]
GO
select id_material, count_material from [dbo].[material]


DECLARE @max_iter AS INT = 8, @this_iter AS INT = 1
DECLARE @max_product INT, @this_product AS INT = 1

SET NOCOUNT ON
set @max_product = (SELECT count(*) FROM [delivery].[dbo].[product]) + 1


BEGIN TRY  
	WHILE @this_product < @max_product
		BEGIN
	
			WHILE @this_iter < @max_iter
				BEGIN

					UPDATE [delivery].[dbo].[product]
					SET count_product = count_product + 1
					WHERE id_product = @this_product
				
					SET @this_iter = @this_iter + 1
				END

			SET @this_iter = 1
			SET @this_product = @this_product + 1
		END
END TRY  
BEGIN CATCH  
	SELECT ERROR_MESSAGE()
END CATCH


select id_material, count_material from [dbo].[material]