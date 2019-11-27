--1 Y 2)
CREATE TABLE Empleados (
	LEGAJO INT IDENTITY (100,1) PRIMARY KEY,
	APELLIDO VARCHAR (50) NOT NULL,
	NOMBRES VARCHAR (50),
	CIUDAD VARCHAR (30) DEFAULT('CABA'),
	PAIS VARCHAR (30));

--3)
EXECUTE SP_COLUMNS Empleados;

--EXEC SP_COLUMNS Empleados;

--4)el legajo no se ingresa porque se actualiza solo al ser primary key
INSERT INTO Empleados 
VALUES ('Garcia','Jose', 'Mendoza', 'Argentina');

--5)
SELECT Color, COUNT(*) AS Cantidad
INTO Prod_X_color
FROM Production.Product
GROUP BY Color;

--6)
SELECT * INTO productos6
FROM Production.Product
SELECT ProductID, name, ProductSubcategoryID, ListPrice
FROM productos6
WHERE ProductSubcategoryID = 2


UPDATE productos6
SET ListPrice = ListPrice*1.2
WHERE ProductSubcategoryID = 2;

--7)
UPDATE Production.Product
SET ListPrice = ListPrice*1.2
WHERE ProductID IN (SELECT p.ProductID
                    FROM Production.Product p JOIN Production.ProductSubcategory s
					ON p.ProductSubcategoryID=s.ProductSubcategoryID
					WHERE s.ProductCategoryID=1);

--8)clonar antes de borrar
--SELECT * FROM Production.Product WHERE ProductSubcategoryID=1;
SELECT * INTO productos8
FROM Production.Product

SELECT * FROM productos8

DELETE FROM productos8
WHERE ProductSubcategoryID=1;

-- chequeo que se hayan borrado SELECT * FROM productos8 (ahora son 472 reg antes eran 504)

--9)
SELECT * INTO Ordenes9 
FROM Purchasing.PurchaseOrderDetail 


DELETE FROM Ordenes9
WHERE YEAR(DueDate)=2012 AND MONTH(DueDate)BETWEEN 7 AND 9;

--10)
SELECT name , color, ListPrice INTO Productos
FROM Production.Product

SELECT * FROM Productos;

--11)

INSERT INTO Productos (color, name, ListPrice)
VALUES ('red', 'Mountain Bike', '4000');

SELECT * FROM Productos;

--12)

SELECT * INTO Personas
FROM Person.Person 
WHERE BusinessEntityID BETWEEN 100 AND 200;

--13)
UPDATE Productos
SET ListPrice = ListPrice*1.15
WHERE Name LIKE '%Pedal%';

SELECT * FROM Productos
WHERE Name LIKE '%Pedal%';

--14)
SELECT*FROM Personas
WHERE FirstName LIKE 'M%';

DELETE FROM Personas 
WHERE FirstName LIKE 'M%';

--SELECT*FROM Personas
--WHERE FirstName LIKE 'M%';

--SUBCONSULTAS
--EJEMPLOS
--1 EN EL SELECT
SELECT
ProductID, ListPrice,(SELECT AVG(ListPrice)FROM Production.Product)
FROM Production.Product;
--2 EN EL FROM
SELECT pp.ProductID, pp.ListPrice, x.promedio
FROM Production.Product pp
INNER JOIN(SELECT ProductID, avg(LineTotal) promedio
FROM Sales.SalesOrderDetail
GROUP BY ProductID) x
ON pp.ProductID=x.ProductID;--3 EN EL WHERE
SELECT ProductID, ListPrice
FROM Production.Product
WHERE ListPrice <(
SELECT AVG(LineTotal)
FROM Sales.SalesOrderDetail);
--4 CORRELACIONADAS
SELECT p1.ProductSubcategoryID, p1.ProductID, p1.ListPrice
FROM Production.Product p1
WHERE ListPrice=(SELECT MIN (ListPrice)
FROM Production.Product p2 WHERE p2.ProductSubcategoryID = p1.ProductSubcategoryID)
ORDER BY p1.ProductSubcategoryID;
--5 IN
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE BusinessEntityID IN (
SELECT BusinessEntityID
FROM Sales.SalesPerson
);
--6 NOT IN
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE BusinessEntityID NOT IN (
SELECT BusinessEntityID
FROM Sales.SalesPerson
);
--7 EXIST
SELECT FirstName, LastName
FROM Person.Person p
WHERE EXISTS (SELECT BusinessEntityID
FROM Sales.SalesPerson s WHERE p.BusinessEntityID=s.BusinessEntityID
);
--8 NOT EXIST
SELECT FirstName, LastName
FROM Person.Person p
WHERE EXISTS (SELECT BusinessEntityID
FROM Sales.SalesPerson s WHERE p.BusinessEntityID=s.BusinessEntityID
);
--9 ANY
SELECT
Name, ListPrice
FROM Production.Product
WHERE ListPrice > ANY (
SELECT AVG(ListPrice) Promedio
FROM Production.Product
);
--10 ALL
SELECT Name,ListPrice
FROM Production.Product
WHERE ListPrice <> ALL (
SELECT AVG(ListPrice) Promedio
FROM Production.Product
);

--1 238
SELECT ProductID, Name FROM Production.Product
WHERE ProductID NOT IN (SELECT ProductID FROM Sales.SalesOrderDetail);

--2 701 customer

SELECT CustomerID FROM Sales.Customer
WHERE CustomerID NOT IN (SELECT SalesOrderID FROM Sales.SalesOrderHeader);

--3 correlacionada 200

SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ListPrice=(SELECT MIN (ListPrice)FROM Production.Product);


--4 Escalar 136 production.product

SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ListPrice>(SELECT AVG(ListPrice)FROM Production.Product);


--5 Escalar 44 production.product/product.subcategoryID

SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ListPrice >(SELECT MAX(ListPrice) FROM Production.Product p JOIN 
				  Production.ProductSubcategory s 
				  ON p.ProductSubcategoryID = s.ProductSubcategoryID
				  WHERE s.ProductCategoryID = 2);

--6 Any 39

SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > ANY (
SELECT AVG(ListPrice) Promedio
FROM Production.Product
);

SELECT*FROM Production.Product
WHERE Product.ProductSubcategoryID = 2 
AND ListPrice > ANY (SELECT ListPrice FROM Production.Product WHERE Product.ProductSubcategoryID = 3);

--7)da 3
SELECT * FROM Sales.SalesPerson

SELECT BusinessEntityID, SalesQuota FROM Sales.SalesPerson
WHERE SalesQuota (SELE)
