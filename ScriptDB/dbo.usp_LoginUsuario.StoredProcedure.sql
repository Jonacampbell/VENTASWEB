USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoginUsuario]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIO

create procedure [dbo].[usp_LoginUsuario](
@Usuario varchar(60),
@Clave varchar(60),
@IdUsuario int output
)
as
begin
	set @IdUsuario = 0
	if exists(select * from USUARIO where [Usuario] COLLATE Latin1_General_CS_AS = @Usuario and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
		set @IdUsuario = (select top 1 IdUsuario from USUARIO where [Usuario]  COLLATE Latin1_General_CS_AS = @Usuario and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
end

GO
