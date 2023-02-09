--Тригер на списание материлов

CREATE TRIGGER UpdateProduct ON [delivery].[dbo].[product]
INSTEAD OF UPDATE
AS
BEGIN

	SELECT * 
	INTO #thisMaterial
	FROM [delivery].[dbo].[product_composition] 
	where id_product = (select id_product from inserted)
	

	UPDATE material
	SET material.count_material = material.count_material - #thisMaterial.count_material
	FROM #thisMaterial
	JOIN material
	ON material.id_material = #thisMaterial.id_material


	-- изготовляем продукцию, в рандомном промежутке от (текущая дата минус один месяц)
	DECLARE @minDate AS date = (SELECT CAST(DateAdd("M", -1, CAST(GETDATE() AS Date) ) AS Date))
	DECLARE @maxDate AS date = (SELECT CAST(GETDATE() AS Date))

	UPDATE product
	SET 
	count_product = count_product + 1,
	last_date_manufacture = DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, @minDate, @maxDate)),@minDate)
	WHERE id_product = (select id_product from inserted)

END