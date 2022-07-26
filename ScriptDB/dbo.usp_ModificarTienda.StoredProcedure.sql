USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR TIENDA
create procedure [dbo].[usp_ModificarTienda](
@IdTienda int,
@Nombre varchar(60),
@Ruc varchar(60),
@Direccion varchar(60),
@Telefono varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM TIENDA WHERE Nombre =@Nombre and IdTienda != @IdTienda)
		
		update TIENDA set 
		Nombre = @Nombre,
		RUC = @Ruc,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Activo = @Activo
		where IdTienda = @IdTienda

	ELSE
		SET @Resultado = 0

end

GO
