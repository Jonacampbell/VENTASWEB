USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductos]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerProductos]
as
begin
 select IdProducto,Codigo,ValorCodigo,Nombre,p.Descripcion[DescripcionProducto],p.IdCategoria,p.IdColor,p.Medida,p.Costo,p.PrecioVenta,p.Activo,c.Descripcion[DescripcionCategoria],f.Descripcion[DescripcionColor] from PRODUCTO p
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
 inner join COLOR f on f.IdColor = p.IdColor

end
GO
