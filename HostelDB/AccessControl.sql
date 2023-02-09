-----4 Этап разграничение доступа с помощью ролей-------------

use Hostel create role Administrator;
grant select,insert,update,delete on [dbo].[faculty] to Administrator;
grant select,insert,update,delete on [dbo].[group_faculty] to Administrator;
grant select,insert,update,delete on [dbo].[student] to Administrator;
grant select,insert,update,delete on [dbo].[hostel] to Administrator;
grant select,insert,update,delete on [dbo].[room] to Administrator;
grant select,insert,update,delete on [dbo].[occupancy_order] to Administrator;
grant select,insert,update,delete on [dbo].[occupancy_statement] to Administrator;

create login myadmin with password = '12345' ,check_Expiration = off;
use Hostel create user user1 for login Adm;
use Hostel alter role Administrator add member user1;


use Hostel create role Rasselitel;
grant select on [dbo].[faculty] to Rasselitel;
grant select on [dbo].[group_faculty] to Rasselitel;
grant select on [dbo].[student] to Rasselitel;
grant select on [dbo].[hostel] to Rasselitel;
grant select on [dbo].[room] to Rasselitel;
grant select,insert,update,delete on [dbo].[occupancy_order] to Rasselitel;
grant select,insert,update,delete on [dbo].[occupancy_statement] to Rasselitel;

create login rasselitel with password = '12345' ,check_Expiration = off;
use Hostel create user user2 for login rasselitel;
use Hostel alter role Rasselitel add member user2;


use Hostel create role Student;
grant select on [dbo].[student] to Rasselitel;

create login kekai with password = '12345' ,check_Expiration = off;
use Hostel create user Petrov for login kekai;
use Hostel alter role Student add member Petrov;
