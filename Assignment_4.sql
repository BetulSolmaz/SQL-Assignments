
---Create a scalar-valued function that returns the factorial of a number you gave it.


CREATE FUNCTION fn_faktoriyel(@num INT)
RETURNS INT
AS 
BEGIN
    DECLARE @faktoriyel INT, @i INT
     SET @faktoriyel=1
     SET @i = 1

IF @num < 0
    SET @faktoriyel= NULL

ELSE    

    WHILE @i <= @num

       BEGIN
        SET @faktoriyel = @faktoriyel * @i
        SET @i = @i + 1
    END

        
    return @faktoriyel


END;
GO


SELECT dbo.fn_faktoriyel(5) as faktöriyel


