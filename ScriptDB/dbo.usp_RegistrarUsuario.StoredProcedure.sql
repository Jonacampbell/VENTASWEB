USE [DBPRUEBAS]
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarUsuario]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA REGISTRAR USUARIO
CREATE PROC [dbo].[usp_RegistrarUsuario](
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@IdTienda int,
@IdRol int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Usuario = @Usuario)

		insert into USUARIO(Nombres,Apellidos,Correo,Usuario,Clave,IdTienda,IdRol) values (
		@Nombres,@Apellidos,@Correo,@Usuario,@Clave,@IdTienda,@IdRol
		)
	ELSE
		SET @Resultado = 0
	
end

GO
