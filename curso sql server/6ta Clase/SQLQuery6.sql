CREATE FUNCTION fn_Vendedor (@longitud nvarchar(9))
RETURNS @Vendedores TABLE
   (ID int PRIMARY KEY NOT NULL,
   [Empleado] nvarchar(61) NOT NULL)
AS
BEGIN
   IF @longitud = 'Corto'
      INSERT @Vendedores SELECT EmployeeID, LastName 
      FROM Employees
   ELSE IF @longitud = 'Largo'
      INSERT @Vendedores SELECT EmployeeID, 
      (FirstName + ' ' + LastName) FROM Employees
RETURN
END 
/* este tipo de funciones se ejecutan despues del from porque son tablas*/

select * from dbo.fn_Vendedor('Largo')
where Empleado like 'M%'