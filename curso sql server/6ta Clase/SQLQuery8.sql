/* STORE PROCEDURE */
/* Se usan para cambios en los datos, en transacciones UPDATE, INSERT Y DELETE */
/* lenguaje SQL-server: Transact-SQL */

sp_helptext fnTop3

select * from sysMessages

/* sp para dar de alta un empleado */

alter procedure ProcAltaEmpleado 
(
	@Apellido nvarchar (20),
	@Nombre nvarchar (10),
	@Ciudad nvarchar (15)
)
as
begin try
	begin transaction
	insert into Employees(LastName, FirstName, City)
	values(@Apellido, @Nombre, @Ciudad)

	insert into Auditoria(Usuario, Fecha, Empleado)
	values(current_user, getdate(), @Apellido)
	commit transaction
end try
begin catch
	rollback transaction 
end catch



/* prueba del sp */

ProcAltaEmpleado 'Rodes', 'Jonas', 'CABA'

/* verifico si agrego los datos */
select * from Employees

select*from Auditoria