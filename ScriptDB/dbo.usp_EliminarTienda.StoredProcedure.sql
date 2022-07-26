USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA ELIMINAR TIENDA
create procedure [dbo].[usp_EliminarTienda](
@IdTienda int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que la tienda no se encuentre asignada a un usuario y una venta
	IF not EXISTS (select * from USUARIO u
	inner join TIENDA t on t.IdTienda = u.IdTienda
	where t.IdTienda = @IdTienda)

		delete from TIENDA where IdTienda = @IdTienda

	ELSE
		SET @Resultado = 0

end

GO
