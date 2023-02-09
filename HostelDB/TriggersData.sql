--2 ЭТАП СОЗДАНИЕ ТРИГЕРОВ ДЛЯ РАБОТЫ С ДАННЫМИ --------------------------------------------------------

/*
CREATE TRIGGER insert_occupancy_order ON [Hostel].[dbo].[occupancy_order]
FOR INSERT
AS 
BEGIN
    UPDATE room
    SET number_residents = number_residents + 1
    WHERE id_room = (select id_room from inserted)
END


CREATE TRIGGER delete_occupancy_order ON [Hostel].[dbo].[occupancy_order]
AFTER DELETE 
AS
BEGIN
	UPDATE room
	SET number_residents = number_residents - 1
	WHERE id_room = (select id_room from deleted)
END


CREATE TRIGGER update_occupancy_order ON [Hostel].[dbo].[occupancy_order]
INSTEAD OF UPDATE
AS
BEGIN
	UPDATE room
	SET number_residents = number_residents - 1
	WHERE id_room = (select id_room from [Hostel].[dbo].[occupancy_order] where id_occupancy_order = (select id_occupancy_order from inserted))

	UPDATE room
	SET number_residents = number_residents + 1
	WHERE id_room = (select id_room from inserted)

	UPDATE occupancy_order
    SET id_room = (select id_room from inserted)
	WHERE id_occupancy_order = (select id_occupancy_order from inserted)
END
*/


/*
CREATE TRIGGER insert_room_for_hostel ON [dbo].[hostel]
FOR INSERT
AS 
BEGIN	
	DECLARE @max_floors_hostel INT, @this_floors_hostel INT, @number_room INT
	SET @max_floors_hostel = (select number_floors from inserted)
	SET @this_floors_hostel = 1
	WHILE @this_floors_hostel <= @max_floors_hostel
		BEGIN
			SET @number_room = 1
			WHILE @number_room <= 4
				BEGIN
					DECLARE @sex CHAR(1), @id_hostel INT

					IF @this_floors_hostel % 2 = 0
						SET @sex = 'Ж'
					ELSE 
						SET @sex = 'М'

					SET @id_hostel = (select id_hostel from inserted)
					
					INSERT INTO [dbo].[room]
					([number_room], [sex], [id_hostel])
					VALUES
					((@this_floors_hostel*10 + @number_room), @sex, @id_hostel)
					SET @number_room = @number_room + 1
				END
			SET @this_floors_hostel  = @this_floors_hostel + 1
		END
END
*/
