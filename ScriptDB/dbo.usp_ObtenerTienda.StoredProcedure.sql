USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerTienda]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER TIENDAS
CREATE PROC [dbo].[usp_ObtenerTienda]
as
begin
 select IdTienda,Nombre,RUC,Direccion,Telefono,Activo from TIENDA
end

GO
