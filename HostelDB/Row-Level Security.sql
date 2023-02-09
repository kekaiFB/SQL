-------5 Этап РАЗГРАНИЧЕНИЕ ДОСТУПА ПО СТРОКАМ------------------


CREATE SCHEMA Security;  
GO   
CREATE FUNCTION Security.securitypredicate(@last_name AS nchar(50))  
    RETURNS TABLE  
WITH SCHEMABINDING  
AS  
    RETURN SELECT 1 AS securitypredicate_result
WHERE 
( @last_name = USER_NAME())
GO


CREATE SECURITY POLICY MyFilter  
ADD FILTER PREDICATE Security.securitypredicate(last_name)
ON dbo.student
WITH (STATE = ON);  
GO


GRANT SELECT ON Security.tvf_securitypredicate TO user1;  
GRANT SELECT ON Security.tvf_securitypredicate TO user2;  
GRANT SELECT ON Security.tvf_securitypredicate TO Petrov;


EXECUTE AS USER = 'user1';  
SELECT * FROM dbo.Student;
REVERT;  
  
EXECUTE AS USER = 'user2';  
SELECT * FROM dbo.Student;
REVERT;  

EXECUTE AS USER = 'Petrov';  
SELECT * FROM dbo.Student;
REVERT;  


ALTER SECURITY POLICY MyFilter  
WITH (STATE = OFF); 
