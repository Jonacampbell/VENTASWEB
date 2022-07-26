USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProductoTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO_TIENDA
create procedure [dbo].[usp_EliminarProductoTienda](
@IdProductoTienda int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE IdProductoTienda = @IdProductoTienda and Iniciado = 1 )

		delete from PRODUCTO_TIENDA where IdProductoTienda = @IdProductoTienda

	ELSE
		SET @Resultado = 0

end

GO
