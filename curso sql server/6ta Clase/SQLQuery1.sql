SELECT 
	p.ProductID as Codigo,
	p.ProductName as Nombre,
	p.UnitsInStock as stock,
	P.UnitPrice as Precio,
	s.CompanyName as Proveedor,
	c.CategoryName as Categoria
FROM Products as p
JOIN Suppliers as s ON p.SupplierID=s.SupplierID
JOIN Categories as c ON p.CategoryID=c.CategoryID;