USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_rptProductoTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA REPORTE TIENDA PRODUCTO

 create procedure [dbo].[usp_rptProductoTienda](
 @IdTienda int = 0,
 @Codigo varchar(50)
 )
 as
 begin
 select 
 t.RUC[Ruc Tienda],t.Nombre[Nombre Tienda],t.Direccion[Direccion Tienda],
 p.Codigo[Codigo Producto],p.Nombre[Nombre Producto],p.Descripcion[Descripcion Producto],
 pt.Stock[Stock en tienda],convert(decimal(10,2),pt.PrecioUnidadCompra)[Precio Compra],convert(decimal(10,2),pt.PrecioUnidadVenta)[Precio Venta]
 from PRODUCTO_TIENDA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join TIENDA t on t.IdTienda = pt.IdTienda
 where pt.IdTienda = iif(@IdTienda = 0,pt.IdTienda,@IdTienda) and
 p.Codigo like '%' + @Codigo + '%'
 end

GO
