USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProductoTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_RegistrarProductoTienda](
@IdProducto int,
@IdTienda int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE IdProducto = @IdProducto and IdTienda = @IdTienda)

		insert into PRODUCTO_TIENDA(IdProducto,IdTienda) values (
		@IdProducto,@IdTienda
		)
	ELSE
		SET @Resultado = 0
	
end

GO
