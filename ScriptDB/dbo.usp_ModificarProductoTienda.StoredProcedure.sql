USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProductoTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO_TIENDA
create procedure [dbo].[usp_ModificarProductoTienda](
@IdProductoTienda int,
@IdProducto varchar(60),
@IdTienda varchar(60),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE @IdProductoTienda = @IdProductoTienda and Iniciado = 1 )
		
		update PRODUCTO_TIENDA set 
		IdProducto = @IdProducto,
		IdTienda = @IdTienda
		where IdProductoTienda = @IdProductoTienda
	ELSE
		SET @Resultado = 0

end

GO
