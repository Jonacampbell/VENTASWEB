USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaVenta]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER LISTA VENTA

create procedure [dbo].[usp_ObtenerListaVenta](
@Codigo varchar(50) = '',
@FechaInicio date,
@FechaFin date,
@NumeroDocumento varchar(50) = '',
@Nombre varchar(100) = ''
)
as
begin
SET DATEFORMAT dmy;
select v.IdVenta, v.TipoDocumento,v.Codigo,v.FechaRegistro,c.NumeroDocumento,c.Nombre,v.TotalCosto from VENTA v 
inner join CLIENTE c on c.IdCliente = v.IdCliente
where 
v.Codigo = iif(@Codigo='',v.Codigo,@Codigo) and
CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin and
c.NumeroDocumento like CONCAT('%',@NumeroDocumento,'%') and
c.Nombre like CONCAT('%',@Nombre,'%')

end

GO
