--6. Напишите запрос показывающий продукцию произведенную в прошлом месяце, для изготовления которой потребовалось не менее пяти различных наименований материалов, произведенной в количестве менее десяти единиц.
DECLARE @date datetime = dateadd(month, -1, getdate());
DECLARE @start_month AS datetime =(SELECT DATEADD(DAY, 1, EOMONTH(@date,-1)))
DECLARE @end_month AS datetime =(SELECT DATEADD(DAY, -1, EOMONTH(@date)))

USE delivery

SELECT * 
FROM [dbo].[product]
where last_date_manufacture 
	BETWEEN @start_month AND @end_month
	AND count_product < 10
	AND id_product IN 
	(
		SELECT [product].id_product
		FROM [dbo].[product]
		JOIN [dbo].[product_composition]
		ON [product_composition].id_product = [product].id_product
		GROUP BY [product].id_product
		HAVING COUNT(DISTINCT [product_composition].[id_material]) >= 5
	)