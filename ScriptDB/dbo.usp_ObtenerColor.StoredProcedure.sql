USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerColor]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerColor]
as
begin
 select IdColor,Descripcion from COLOR
end
GO
