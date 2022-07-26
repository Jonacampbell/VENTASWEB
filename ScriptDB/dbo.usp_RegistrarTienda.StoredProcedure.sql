USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA GUARDAR TIENDA
CREATE PROC [dbo].[usp_RegistrarTienda](
@Nombre varchar(50),
@Ruc varchar(50),
@Direccion varchar(50),
@Telefono varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM TIENDA WHERE Nombre = @Nombre)

		insert into TIENDA(Nombre,RUC,Direccion,Telefono) values (
		@Nombre,@Ruc,@Direccion,@Telefono
		)
	ELSE
		SET @Resultado = 0
	
end

GO
