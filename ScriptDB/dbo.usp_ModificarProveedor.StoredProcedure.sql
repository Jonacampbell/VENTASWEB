USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProveedor]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA MODIFICAR PROVEEDOR
create procedure [dbo].[usp_ModificarProveedor](
@IdProveedor int,
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc and IdProveedor != @IdProveedor)
		
		update PROVEEDOR set 
		RUC = @Ruc,
		RazonSocial = @RazonSocial,
		Telefono = @Telefono,
		Correo = @Correo,
		Direccion = @Direccion,
		Activo = @Activo
		where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
