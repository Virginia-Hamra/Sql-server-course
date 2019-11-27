select 
	p.ProductID as Codigo,
	p.ProductName as Nombre,
	p.UnitsInStock as Stock,
	p.UnitPrice as Precio,
	s.CompanyName as Proveedor,
	c.CategoryName as Categoria
from products as p
join Suppliers as s on p.SupplierID=s.SupplierID
join Categories as c on p.CategoryID=c.CategoryID