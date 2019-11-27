/* crear una funcion que retorne los 3 articulos mas caros --
hacer primero el select 
no tiene parametros porque no tengo que filtrar por ninguna categoria
top 3 with ties = incluye los que empaten en el corte.*/

alter function fnTop3()
returns @top3 table
(
	Nombre varchar(50),
	Precio decimal
)
as
begin
	insert @top3
	select top 3 with ties ProductName, UnitPrice
	from Products
	order by UnitPrice desc
return
end

select * from dbo.fnTop3()