insert Employees(lastname,FirstName)
values('   Perez','Enzo  ')

select *
from Employees

update employees
set LastName=ltrim(lastname),
    FirstName=ltrim(firstname)

select count(*)
from products where CategoryID=4
