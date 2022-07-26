USE [DBPRUEBAS]
GO
/****** Object:  Table [dbo].[PRODUCTO_TIENDA]    Script Date: 29/07/2022 12:43:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_TIENDA](
	[IdProductoTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdTienda] [int] NULL,
	[PrecioUnidadCompra] [float] NULL,
	[PrecioUnidadVenta] [float] NULL,
	[Stock] [bigint] NULL,
	[Activo] [bit] NULL,
	[Iniciado] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [PrecioUnidadCompra]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [PrecioUnidadVenta]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [Iniciado]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
