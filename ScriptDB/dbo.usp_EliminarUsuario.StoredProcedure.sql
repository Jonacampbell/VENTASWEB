USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarUsuario]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR USUARIO
create procedure [dbo].[usp_EliminarUsuario](
@IdUsuario int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun usuario se encuentre relacionado a una tienda
	IF (not EXISTS (select c.* from COMPRA c 
		inner join USUARIO u on u.IdUsuario = c.IdUsuario 
		where u.IdUsuario = @IdUsuario
		) and 
		not EXISTS (select v.* from VENTA v 
		inner join USUARIO u on u.IdUsuario = v.IdUsuario 
		where u.IdUsuario = @IdUsuario
		)
	)
		delete from USUARIO where IdUsuario = @IdUsuario
	ELSE
		SET @Resultado = 0

end

GO
