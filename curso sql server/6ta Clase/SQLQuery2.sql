/*cantidad de stock de categoria 2*/
select sum(UnitsInstock)
from products
where CategoryID=2;

/*funciones escalares toman un valor y devuelven un solo valor*/
select @@VERSION 

/*si quiero formatear esta fecha puedo aplicarle la funcion convert(tambien escalar)*/
select convert(varchar(11),getdate(),100);

select orderid, convert(varchar(11),orderdate,103)
from orders 

/*funciones escalares de cadena-FUNCION SUBSTRING - hace un recorte, desde donde queres extraer hasta donde*/
select 
LastName, FirstName,
SUBSTRING(LastName,1,3)+'_'+SUBSTRING(FirstName,1,2)+'@companyit.com' AS Email
from Employees

/*lenght function*/
select
	CompanyName,LEN(CompanyName) AS Longitud
from Customers
order by Longitud desc;

/*devuelve caracteres del codigo ascii*/
select CHAR(63)

/*ltrim ignora los espacios en blanco-- rtrim hace lo contrario --- admite solo un argumento*/
insert Employees (LastName,FirstName)
values ('  Perez', 'Enzo   ')

Update Employees 
set LastName = LTRIM(LastName),
    FirstName = LTRIM(FirstName);

select * from Employees;

/*patindex patron indice primera ocurrencia, reverse da vuelva un string*/


/*FUNCIONES DEFINIDAS POR EL PROGRAMADOR*/
select count(*)
from products where CategoryID=4

