USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarRol]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR ROL
CREATE PROC [dbo].[usp_RegistrarRol](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion = @Descripcion)
	begin
		declare @idrol int = 0
		insert into ROL(Descripcion) values (
		@Descripcion
		)
		set @idrol  = Scope_identity()

		insert into PERMISOS(IdRol,IdSubMenu,Activo)
		select @idrol, IdSubMenu,0 from SUBMENU
	end
	ELSE
		SET @Resultado = 0
	
end


GO
