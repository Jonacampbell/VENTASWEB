USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProducto]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_RegistrarProducto](
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@Medida varchar(50),
@Costo int,
@PrecioVenta int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)))

		insert into PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria,Medida,Costo,PrecioVenta) values (
		RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),@Nombre,@Descripcion,@IdCategoria,@Medida,@Costo,@PrecioVenta
		)
	ELSE
		SET @Resultado = 0
	
end

GO
