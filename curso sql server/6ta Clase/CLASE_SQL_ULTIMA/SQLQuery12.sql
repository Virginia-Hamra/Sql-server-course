/* sp para dar alta de un empleado*/
alter procedure ProcAltaEmpleado
(
	@Apellido nvarchar(20),
	@Nombre nvarchar(10),
	@Ciudad nvarchar(15)
)
as
begin try
  begin transaction
    insert into Employees(LastName,FirstName,City)
	values(@Apellido,@Nombre,@Ciudad)

	insert into Auditoria(Usuario,Fecha,Empleado)
	values (current_user,getDate(),@Apellido)
	commit transaction
end try
begin catch
	rollback transaction
end catch















	/* prueba */
	ProcAltaEmpleado 'Rodriguez','Fernando','CABA'

	select * from auditoria