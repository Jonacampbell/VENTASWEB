USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_rptVenta]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --PROCEDMIENTO PARA REPORTE VENTA

create procedure [dbo].[usp_rptVenta] (
@FechaInicio date,
@FechaFin date,
@IdTienda int = 0
)
as
begin

 select convert(char(10), v.FechaRegistro ,103)[Fecha Venta],v.Codigo[Numero Documento],v.TipoDocumento[Tipo Documento],
 t.Nombre[Nombre Tienda], t.RUC[Ruc Tienda],
 concat(u.Nombres,' ', u.apellidos)[Nombre Empleado],
 v.CantidadTotal[Cantidad Unidades Vendidas],v.CantidadProducto[Cantidad Productos],v.TotalCosto[Total Venta] 
 from VENTA v
 inner join TIENDA t on t.IdTienda = v.IdTienda
 inner join USUARIO u on u.IdUsuario = v.IdUsuario
 where 
 CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin 
 and v.IdTienda = iif(@IdTienda =0 ,v.IdTienda,@IdTienda)
end





GO
