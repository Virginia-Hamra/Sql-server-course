/*Funcion que reciba un ID de categoría y retorne cuantos articulos tiene*/

create function fnCantidadArt(
	@idCategoria int
	
)
returns int
as
begin
	declare @Cantidad int
	set @Cantidad=(select count(*) from products where CategoryID=@idCategoria)
	return @Cantidad
end

/* probar la funcion */
/* cuantos articulos hay en categoria 4 */
select dbo.fnCantidadArt(5)

select *,dbo.fnCantidadArt(CategoryID) as Articulos from Categories

