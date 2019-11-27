/* cantidad de stock de categoria 2*/
select sum(unitsInStock)
from products
where CategoryID=2

select @@VERSION

select convert(varchar(11),getdate(),103)

select orderid,
	convert(varchar(11),orderdate,103)
from orders

/* funcion substring */
select
LastName,FirstName,
substring(lastname,1,3)+
'.'+
substring(firstname,1,2)+'@gmail.com' as Email
from Employees