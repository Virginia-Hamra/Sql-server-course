/* Crear una funcion que basada en id de cliente devuelva la cantidad de pedidos de ese cliente (empresa)-
puedo hacer la consulta primero y luego pasarla a funcion*/


alter function fnCantPedidosCliente(

	@idCliente nchar(5)

)
returns int
as
begin
	declare @Cantidad int
	set @Cantidad=(select count(*) from orders where CustomerID=@idCliente)
	return @Cantidad
end

select CompanyName, dbo.fnCantPedidosCliente(CustomerID) AS CantidadPedidos from customers

