USE [dbGestionDeEventos]
GO
/****** Object:  Schema [Acce]    Script Date: 17/4/2024 10:14:02 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Even]    Script Date: 17/4/2024 10:14:02 ******/
CREATE SCHEMA [Even]
GO
/****** Object:  Schema [Gral]    Script Date: 17/4/2024 10:14:02 ******/
CREATE SCHEMA [Gral]
GO
/****** Object:  Schema [Hector11S_SQLLogin_1]    Script Date: 17/4/2024 10:14:02 ******/
CREATE SCHEMA [Hector11S_SQLLogin_1]
GO
/****** Object:  Table [Acce].[tbPantallas]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallas](
	[Pant_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pant_Descripcion] [varchar](50) NULL,
	[Pant_Usua_Creacion] [int] NULL,
	[Pant_Fecha_Creacion] [date] NULL,
	[Pant_Usua_Modifica] [int] NULL,
	[Pant_Fecha_Modifica] [date] NULL,
	[Pant_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbPantallasPorRoles]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallasPorRoles](
	[Paro_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol_Id] [int] NULL,
	[Pant_Id] [int] NULL,
	[Paro_Usua_Creacion] [int] NULL,
	[Paro_Fecha_Creacion] [date] NULL,
	[Paro_Usua_Modifica] [int] NULL,
	[Paro_Fecha_Modifica] [date] NULL,
	[Paro_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Paro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbRoles]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRoles](
	[Rol_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol_Descripcion] [varchar](50) NULL,
	[Rol_Usua_Creacion] [int] NULL,
	[Rol_Fecha_Creacion] [date] NULL,
	[Rol_Usua_Modifica] [int] NULL,
	[Rol_Fecha_Modifica] [date] NULL,
	[Rol_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsuarios]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsuarios](
	[Usua_Id] [int] IDENTITY(1,1) NOT NULL,
	[Usua_Usuario] [varchar](50) NULL,
	[Usua_Contra] [varchar](max) NULL,
	[Usua_Admin] [bit] NULL,
	[Empl_Id] [int] NULL,
	[Clie_Id] [int] NULL,
	[Rol_Id] [int] NULL,
	[Usua_Usua_Creacion] [int] NULL,
	[Usua_Fecha_Creacion] [date] NULL,
	[Usua_Usua_Modifica] [int] NULL,
	[Usua_Fecha_Modifica] [date] NULL,
	[Usua_Activo] [bit] NULL,
	[Usua_CodigoVerificacion] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Usua_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbCategoriaUtileria]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbCategoriaUtileria](
	[Cate_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cate_Descripion] [varchar](50) NULL,
	[Cate_Usua_Creacion] [int] NULL,
	[Cate_Fecha_Creacion] [date] NULL,
	[Cate_Usua_Modifica] [int] NULL,
	[Cate_Fecha_Modifica] [date] NULL,
	[Cate_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbEventos]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbEventos](
	[Even_Id] [int] IDENTITY(1,1) NOT NULL,
	[Even_Descripcion] [varchar](100) NULL,
	[Even_FechaInicio] [datetime] NOT NULL,
	[Even_FechaFin] [datetime] NOT NULL,
	[Clie_Id] [int] NOT NULL,
	[Muni_Id] [varchar](4) NOT NULL,
	[Even_Usua_Creacion] [int] NULL,
	[Even_Fecha_Creacion] [date] NULL,
	[Even_Usua_Modifica] [int] NULL,
	[Even_Fecha_Modifica] [date] NULL,
	[Even_Estado] [bit] NULL,
	[Even_Sexo] [char](1) NULL,
	[Ever_Id] [int] NULL,
	[PaUt_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Even_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbEventosElegir]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbEventosElegir](
	[Ever_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ever_Descripcion] [varchar](50) NULL,
	[Ever_UsuarioCreacion] [int] NULL,
	[Ever_FechaCreacion] [datetime] NULL,
	[Ever_UsuarioModifica] [int] NULL,
	[Ever_FechaModifica] [datetime] NULL,
	[Ever_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ever_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbPaquetes]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbPaquetes](
	[Paqe_Id] [int] IDENTITY(1,1) NOT NULL,
	[Paqe_Descripcion] [varchar](100) NULL,
	[Paqe_Precio] [money] NULL,
	[Paqe_FechaLimite] [datetime] NULL,
	[Empl_Id] [int] NOT NULL,
	[Paqe_Usua_Creacion] [int] NULL,
	[Paqe_Fecha_Creacion] [date] NULL,
	[Paqe_Usua_Modifica] [int] NULL,
	[Paqe_Fecha_Modifica] [date] NULL,
	[Paqe_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Paqe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbPaquetesDetalle]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbPaquetesDetalle](
	[PaDe_Id] [int] IDENTITY(1,1) NOT NULL,
	[Paqe_Id] [int] NULL,
	[Util_Id] [int] NULL,
	[PaDe_Cantidad] [int] NULL,
	[PaDe_Subtotal] [money] NULL,
	[PaDe_Total] [money] NULL,
	[PaUt_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaDe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbPaquetesPorUtilerias]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbPaquetesPorUtilerias](
	[PaUt_Id] [int] IDENTITY(1,1) NOT NULL,
	[Paqe_Id] [int] NULL,
	[Util_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaUt_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Even].[tbUtileria]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Even].[tbUtileria](
	[Util_Id] [int] IDENTITY(1,1) NOT NULL,
	[Util_Descripcion] [varchar](50) NULL,
	[Cate_Id] [int] NULL,
	[Util_cantidadStock] [int] NULL,
	[Util_Imagen] [varchar](max) NULL,
	[Util_Precio] [money] NULL,
	[Util_Disponibilidad] [bit] NULL,
	[Util_Usua_Creacion] [int] NULL,
	[Util_Fecha_Creacion] [date] NULL,
	[Util_Usua_Modifica] [int] NULL,
	[Util_Fecha_Modifica] [date] NULL,
	[Util_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Util_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCargos]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbCargos](
	[Carg_Id] [int] IDENTITY(1,1) NOT NULL,
	[Carg_Descripcion] [varchar](50) NULL,
	[Carg_Usua_Creacion] [int] NULL,
	[Carg_Fecha_Creacion] [date] NULL,
	[Carg_Usua_Modifica] [int] NULL,
	[Carg_Fecha_Modifica] [date] NULL,
	[Carg_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Carg_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbClientes]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbClientes](
	[Clie_Id] [int] IDENTITY(1,1) NOT NULL,
	[Clie_Identidad] [varchar](50) NULL,
	[Clie_Nombre] [varchar](100) NULL,
	[Clie_Apellido] [varchar](100) NULL,
	[Clie_Telefono] [varchar](50) NULL,
	[Clie_CorreoElectronico] [varchar](50) NULL,
	[Clie_Sexo] [char](1) NULL,
	[Esta_Id] [int] NULL,
	[Muni_Id] [varchar](4) NULL,
	[Clie_Usua_Creacion] [int] NULL,
	[Clie_Fecha_Creacion] [date] NULL,
	[Clie_Usua_Modifica] [int] NULL,
	[Clie_Fecha_Modifica] [date] NULL,
	[Clie_Estado] [bit] NULL,
	[Carg_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Clie_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbDepartamentos]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbDepartamentos](
	[Dept_Codigo] [varchar](2) NOT NULL,
	[Dept_Descripcion] [varchar](50) NULL,
	[Dept_Usuario_Creacion] [int] NOT NULL,
	[Dept_Fecha_Creacion] [date] NOT NULL,
	[Dept_Usuario_Modifica] [int] NULL,
	[Dept_Fecha_Modifica] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEmpleados]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEmpleados](
	[Empl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Empl_Identidad] [varchar](50) NULL,
	[Empl_Nombre] [varchar](100) NULL,
	[Empl_Apellido] [varchar](100) NULL,
	[Empl_Sexo] [char](1) NULL,
	[Carg_Id] [int] NULL,
	[Esta_Id] [int] NULL,
	[Muni_Id] [varchar](4) NULL,
	[Empl_Usua_Creacion] [int] NULL,
	[Empl_Fecha_Creacion] [date] NULL,
	[Empl_Usua_Modifica] [int] NULL,
	[Empl_Fecha_Modifica] [date] NULL,
	[Empl_Estado] [bit] NULL,
	[Empl_CorreoElectronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Empl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEstadosCiviles]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEstadosCiviles](
	[Esta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Esta_Descripcion] [varchar](50) NULL,
	[Esta_Usuario_Creacion] [int] NOT NULL,
	[Esta_Fecha_Creacion] [date] NOT NULL,
	[Esta_Usuario_Modifica] [int] NULL,
	[Esta_Fecha_Modifica] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Esta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMunicipios]    Script Date: 17/4/2024 10:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMunicipios](
	[Muni_Id] [varchar](4) NOT NULL,
	[Muni_Descripcion] [varchar](50) NULL,
	[Dept_Id] [varchar](2) NULL,
	[Muni_Usuario_Creacion] [int] NOT NULL,
	[Muni_Fecha_Creacion] [date] NOT NULL,
	[Muni_Usuario_Modifica] [int] NULL,
	[Muni_Fecha_Modifica] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Muni_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Acce].[tbRoles] ON 

INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (1, N'Admin', 1, CAST(N'2024-12-12' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbUsuarios] ON 

INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Clie_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Activo], [Usua_CodigoVerificacion]) VALUES (1, N'Admin', N'Admin', 1, 1, 1, 1, 1, CAST(N'2024-02-02' AS Date), NULL, NULL, 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Clie_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Activo], [Usua_CodigoVerificacion]) VALUES (7, N'messi', N'88980FDBE55B2915D0DB9E9B784A08B00B5D9A8A15D4769AF848C0E0BAA7228D22AF598A82B1A3528DDA15E75885E1F08F4B5CE41FDB0AB10A079408A378AEAF', 0, NULL, 3, 1, 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Clie_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Activo], [Usua_CodigoVerificacion]) VALUES (8, N'string', N'2757CB3CAFC39AF451ABB2697BE79B4AB61D63D74D85B0418629DE8C26811B529F3F3780D0150063FF55A2BEEE74C4EC102A2A2731A1F1F7F10D473AD18A6A87', 0, NULL, 4, 1, 1, CAST(N'2024-04-17' AS Date), NULL, NULL, 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Clie_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Activo], [Usua_CodigoVerificacion]) VALUES (9, N'kk', N'932F481FA8263721B0E091722452B39607F45F2179756B1888BD1C7B81B0B4869A1E6150C3C4898FD8849E1C4222CD870D3C21C74611D0C8591507BD9262D3D8', 0, NULL, 5, 1, 1, CAST(N'2024-04-17' AS Date), 1, CAST(N'2024-04-16' AS Date), 1, NULL)
SET IDENTITY_INSERT [Acce].[tbUsuarios] OFF
GO
SET IDENTITY_INSERT [Even].[tbCategoriaUtileria] ON 

INSERT [Even].[tbCategoriaUtileria] ([Cate_Id], [Cate_Descripion], [Cate_Usua_Creacion], [Cate_Fecha_Creacion], [Cate_Usua_Modifica], [Cate_Fecha_Modifica], [Cate_Estado]) VALUES (1, N'Cubiertos', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [Even].[tbCategoriaUtileria] OFF
GO
SET IDENTITY_INSERT [Even].[tbEventos] ON 

INSERT [Even].[tbEventos] ([Even_Id], [Even_Descripcion], [Even_FechaInicio], [Even_FechaFin], [Clie_Id], [Muni_Id], [Even_Usua_Creacion], [Even_Fecha_Creacion], [Even_Usua_Modifica], [Even_Fecha_Modifica], [Even_Estado], [Even_Sexo], [Ever_Id], [PaUt_Id]) VALUES (1, N'gggg', CAST(N'2024-04-16T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), 1, N'0501', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1, N'M', 1, NULL)
INSERT [Even].[tbEventos] ([Even_Id], [Even_Descripcion], [Even_FechaInicio], [Even_FechaFin], [Clie_Id], [Muni_Id], [Even_Usua_Creacion], [Even_Fecha_Creacion], [Even_Usua_Modifica], [Even_Fecha_Modifica], [Even_Estado], [Even_Sexo], [Ever_Id], [PaUt_Id]) VALUES (2, N'ggggg', CAST(N'2024-04-16T00:00:00.000' AS DateTime), CAST(N'2024-04-16T00:00:00.000' AS DateTime), 1, N'0501', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1, N'M', 1, NULL)
SET IDENTITY_INSERT [Even].[tbEventos] OFF
GO
SET IDENTITY_INSERT [Even].[tbEventosElegir] ON 

INSERT [Even].[tbEventosElegir] ([Ever_Id], [Ever_Descripcion], [Ever_UsuarioCreacion], [Ever_FechaCreacion], [Ever_UsuarioModifica], [Ever_FechaModifica], [Ever_Estado]) VALUES (1, N'Cumpleaños', 1, NULL, NULL, NULL, 1)
INSERT [Even].[tbEventosElegir] ([Ever_Id], [Ever_Descripcion], [Ever_UsuarioCreacion], [Ever_FechaCreacion], [Ever_UsuarioModifica], [Ever_FechaModifica], [Ever_Estado]) VALUES (2, N'Boda', NULL, NULL, NULL, NULL, 1)
INSERT [Even].[tbEventosElegir] ([Ever_Id], [Ever_Descripcion], [Ever_UsuarioCreacion], [Ever_FechaCreacion], [Ever_UsuarioModifica], [Ever_FechaModifica], [Ever_Estado]) VALUES (3, N'Quince Años', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [Even].[tbEventosElegir] OFF
GO
SET IDENTITY_INSERT [Even].[tbPaquetes] ON 

INSERT [Even].[tbPaquetes] ([Paqe_Id], [Paqe_Descripcion], [Paqe_Precio], [Paqe_FechaLimite], [Empl_Id], [Paqe_Usua_Creacion], [Paqe_Fecha_Creacion], [Paqe_Usua_Modifica], [Paqe_Fecha_Modifica], [Paqe_Estado]) VALUES (3, N'Basico', 1000.0000, CAST(N'2024-04-16T00:00:00.000' AS DateTime), 1, 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [Even].[tbPaquetes] OFF
GO
SET IDENTITY_INSERT [Even].[tbPaquetesPorUtilerias] ON 

INSERT [Even].[tbPaquetesPorUtilerias] ([PaUt_Id], [Paqe_Id], [Util_Id]) VALUES (2, 3, 2)
INSERT [Even].[tbPaquetesPorUtilerias] ([PaUt_Id], [Paqe_Id], [Util_Id]) VALUES (3, 3, 2)
INSERT [Even].[tbPaquetesPorUtilerias] ([PaUt_Id], [Paqe_Id], [Util_Id]) VALUES (4, 3, 2)
INSERT [Even].[tbPaquetesPorUtilerias] ([PaUt_Id], [Paqe_Id], [Util_Id]) VALUES (5, 3, 2)
SET IDENTITY_INSERT [Even].[tbPaquetesPorUtilerias] OFF
GO
SET IDENTITY_INSERT [Even].[tbUtileria] ON 

INSERT [Even].[tbUtileria] ([Util_Id], [Util_Descripcion], [Cate_Id], [Util_cantidadStock], [Util_Imagen], [Util_Precio], [Util_Disponibilidad], [Util_Usua_Creacion], [Util_Fecha_Creacion], [Util_Usua_Modifica], [Util_Fecha_Modifica], [Util_Estado]) VALUES (2, N'Cucharra', 1, 100, N'kk', 100.0000, 1, 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [Even].[tbUtileria] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCargos] ON 

INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (1, N'Cliente', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbCargos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbClientes] ON 

INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Identidad], [Clie_Nombre], [Clie_Apellido], [Clie_Telefono], [Clie_CorreoElectronico], [Clie_Sexo], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado], [Carg_Id]) VALUES (1, N'0501200416442', N'Hector', N'Torres', N'97240774', N'hector@gmail.com', N'M', 1, N'0501', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Identidad], [Clie_Nombre], [Clie_Apellido], [Clie_Telefono], [Clie_CorreoElectronico], [Clie_Sexo], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado], [Carg_Id]) VALUES (3, N'1234567890', N'Juan', N'Perez', N'555-1234', N'juan@example.com', N'M', 1, N'0501', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Identidad], [Clie_Nombre], [Clie_Apellido], [Clie_Telefono], [Clie_CorreoElectronico], [Clie_Sexo], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado], [Carg_Id]) VALUES (4, N'05012004', N'ronaldo', N'ronaldo', N'8899', N'aaa@gmail.com', N'M', 1, N'0501', 1, CAST(N'2024-04-17' AS Date), NULL, NULL, 1, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Identidad], [Clie_Nombre], [Clie_Apellido], [Clie_Telefono], [Clie_CorreoElectronico], [Clie_Sexo], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado], [Carg_Id]) VALUES (5, N'05012004', N'julian', N'alvarez', N'8899', N'aaa@gmail.com', N'M', 1, N'0501', 1, CAST(N'2024-04-17' AS Date), NULL, NULL, 1, 1)
SET IDENTITY_INSERT [Gral].[tbClientes] OFF
GO
INSERT [Gral].[tbDepartamentos] ([Dept_Codigo], [Dept_Descripcion], [Dept_Usuario_Creacion], [Dept_Fecha_Creacion], [Dept_Usuario_Modifica], [Dept_Fecha_Modifica]) VALUES (N'02', N'Cortes', 1, CAST(N'2024-02-02' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [Gral].[tbEmpleados] ON 

INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Identidad], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Carg_Id], [Esta_Id], [Muni_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado], [Empl_CorreoElectronico]) VALUES (1, N'0501200416442', N'Hector', N'Torres', N'M', 1, 1, N'0501', 1, CAST(N'2024-04-16' AS Date), NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [Gral].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] ON 

INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usuario_Creacion], [Esta_Fecha_Creacion], [Esta_Usuario_Modifica], [Esta_Fecha_Modifica]) VALUES (1, N'Soltero', 1, CAST(N'2024-04-16' AS Date), NULL, NULL)
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] OFF
GO
INSERT [Gral].[tbMunicipios] ([Muni_Id], [Muni_Descripcion], [Dept_Id], [Muni_Usuario_Creacion], [Muni_Fecha_Creacion], [Muni_Usuario_Modifica], [Muni_Fecha_Modifica]) VALUES (N'0501', N'San Pedro Sula', N'02', 1, CAST(N'2024-04-16' AS Date), NULL, NULL)
GO
ALTER TABLE [Acce].[tbPantallas] ADD  DEFAULT ((1)) FOR [Pant_Estado]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] ADD  DEFAULT ((1)) FOR [Paro_Estado]
GO
ALTER TABLE [Acce].[tbRoles] ADD  DEFAULT ((1)) FOR [Rol_Estado]
GO
ALTER TABLE [Acce].[tbUsuarios] ADD  DEFAULT ((1)) FOR [Usua_Activo]
GO
ALTER TABLE [Even].[tbCategoriaUtileria] ADD  DEFAULT ((1)) FOR [Cate_Estado]
GO
ALTER TABLE [Even].[tbEventos] ADD  DEFAULT ((1)) FOR [Even_Estado]
GO
ALTER TABLE [Even].[tbPaquetes] ADD  DEFAULT ((1)) FOR [Paqe_Estado]
GO
ALTER TABLE [Even].[tbUtileria] ADD  DEFAULT ((1)) FOR [Util_Estado]
GO
ALTER TABLE [Gral].[tbCargos] ADD  DEFAULT ((1)) FOR [Carg_Estado]
GO
ALTER TABLE [Gral].[tbClientes] ADD  DEFAULT ((1)) FOR [Clie_Estado]
GO
ALTER TABLE [Gral].[tbEmpleados] ADD  DEFAULT ((1)) FOR [Empl_Estado]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [Fk_tbPantallas_Usua_Usua_Creacion] FOREIGN KEY([Pant_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [Fk_tbPantallas_Usua_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [Fk_tbPantallas_Usua_Usua_Modifica] FOREIGN KEY([Pant_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [Fk_tbPantallas_Usua_Usua_Modifica]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [Fk_tbPantallasPor_Roles_Id] FOREIGN KEY([Rol_Id])
REFERENCES [Acce].[tbRoles] ([Rol_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [Fk_tbPantallasPor_Roles_Id]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [Fk_tbPantallasPorRoles_Pant_Id] FOREIGN KEY([Pant_Id])
REFERENCES [Acce].[tbPantallas] ([Pant_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [Fk_tbPantallasPorRoles_Pant_Id]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [Fk_tbPantallasPorRoles_Usua_Usua_Creacion] FOREIGN KEY([Paro_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [Fk_tbPantallasPorRoles_Usua_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [Fk_tbPantallasPorRoles_Usua_Usua_Modifica] FOREIGN KEY([Paro_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [Fk_tbPantallasPorRoles_Usua_Usua_Modifica]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [Fk_tbRoles_Usua_Usua_Creacion] FOREIGN KEY([Rol_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [Fk_tbRoles_Usua_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [Fk_tbRoles_Usua_Usua_Modifica] FOREIGN KEY([Rol_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [Fk_tbRoles_Usua_Usua_Modifica]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [Fk_tbUsuarios_Usua_Id] FOREIGN KEY([Usua_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [Fk_tbUsuarios_Usua_Id]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [Fk_tbUsuarios_Usua_Usua_Modifica] FOREIGN KEY([Usua_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [Fk_tbUsuarios_Usua_Usua_Modifica]
GO
ALTER TABLE [Even].[tbCategoriaUtileria]  WITH CHECK ADD  CONSTRAINT [Fk_tbCategoriaUtileria_Usua_Usua_Creacion] FOREIGN KEY([Cate_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbCategoriaUtileria] CHECK CONSTRAINT [Fk_tbCategoriaUtileria_Usua_Usua_Creacion]
GO
ALTER TABLE [Even].[tbCategoriaUtileria]  WITH CHECK ADD  CONSTRAINT [Fk_tbCategoriaUtileria_Usua_Usua_Modifica] FOREIGN KEY([Cate_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbCategoriaUtileria] CHECK CONSTRAINT [Fk_tbCategoriaUtileria_Usua_Usua_Modifica]
GO
ALTER TABLE [Even].[tbEventos]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventos_Clie_Id] FOREIGN KEY([Clie_Id])
REFERENCES [Gral].[tbClientes] ([Clie_Id])
GO
ALTER TABLE [Even].[tbEventos] CHECK CONSTRAINT [Fk_tbEventos_Clie_Id]
GO
ALTER TABLE [Even].[tbEventos]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventos_Ever_Id] FOREIGN KEY([Ever_Id])
REFERENCES [Even].[tbEventosElegir] ([Ever_Id])
GO
ALTER TABLE [Even].[tbEventos] CHECK CONSTRAINT [Fk_tbEventos_Ever_Id]
GO
ALTER TABLE [Even].[tbEventos]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventos_Muni_Id] FOREIGN KEY([Muni_Id])
REFERENCES [Gral].[tbMunicipios] ([Muni_Id])
GO
ALTER TABLE [Even].[tbEventos] CHECK CONSTRAINT [Fk_tbEventos_Muni_Id]
GO
ALTER TABLE [Even].[tbEventos]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventos_PaUt_Id] FOREIGN KEY([PaUt_Id])
REFERENCES [Even].[tbPaquetesPorUtilerias] ([PaUt_Id])
GO
ALTER TABLE [Even].[tbEventos] CHECK CONSTRAINT [Fk_tbEventos_PaUt_Id]
GO
ALTER TABLE [Even].[tbEventos]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventos_Usua_Usua_Creacion] FOREIGN KEY([Even_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbEventos] CHECK CONSTRAINT [Fk_tbEventos_Usua_Usua_Creacion]
GO
ALTER TABLE [Even].[tbEventos]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventos_Usua_Usua_Modifica] FOREIGN KEY([Even_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbEventos] CHECK CONSTRAINT [Fk_tbEventos_Usua_Usua_Modifica]
GO
ALTER TABLE [Even].[tbEventosElegir]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventosElegir_Ever_UsuarioCreacion] FOREIGN KEY([Ever_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbEventosElegir] CHECK CONSTRAINT [Fk_tbEventosElegir_Ever_UsuarioCreacion]
GO
ALTER TABLE [Even].[tbEventosElegir]  WITH CHECK ADD  CONSTRAINT [Fk_tbEventosElegir_Ever_UsuarioModifica] FOREIGN KEY([Ever_UsuarioModifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbEventosElegir] CHECK CONSTRAINT [Fk_tbEventosElegir_Ever_UsuarioModifica]
GO
ALTER TABLE [Even].[tbPaquetes]  WITH CHECK ADD  CONSTRAINT [Fk_tbPaquetes_Empl_Id] FOREIGN KEY([Empl_Id])
REFERENCES [Gral].[tbEmpleados] ([Empl_Id])
GO
ALTER TABLE [Even].[tbPaquetes] CHECK CONSTRAINT [Fk_tbPaquetes_Empl_Id]
GO
ALTER TABLE [Even].[tbPaquetes]  WITH CHECK ADD  CONSTRAINT [Fk_tbPaquetes_Usua_Usua_Creacion] FOREIGN KEY([Paqe_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbPaquetes] CHECK CONSTRAINT [Fk_tbPaquetes_Usua_Usua_Creacion]
GO
ALTER TABLE [Even].[tbPaquetes]  WITH CHECK ADD  CONSTRAINT [Fk_tbPaquetes_Usua_Usua_Modifica] FOREIGN KEY([Paqe_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbPaquetes] CHECK CONSTRAINT [Fk_tbPaquetes_Usua_Usua_Modifica]
GO
ALTER TABLE [Even].[tbPaquetesDetalle]  WITH CHECK ADD  CONSTRAINT [Fk_tbPaquetesDetalle_PaUt_Id] FOREIGN KEY([PaUt_Id])
REFERENCES [Even].[tbPaquetesPorUtilerias] ([PaUt_Id])
GO
ALTER TABLE [Even].[tbPaquetesDetalle] CHECK CONSTRAINT [Fk_tbPaquetesDetalle_PaUt_Id]
GO
ALTER TABLE [Even].[tbPaquetesDetalle]  WITH CHECK ADD  CONSTRAINT [Fk_tbPaquetesDetalle_Util_Id] FOREIGN KEY([Util_Id])
REFERENCES [Even].[tbUtileria] ([Util_Id])
GO
ALTER TABLE [Even].[tbPaquetesDetalle] CHECK CONSTRAINT [Fk_tbPaquetesDetalle_Util_Id]
GO
ALTER TABLE [Even].[tbPaquetesPorUtilerias]  WITH CHECK ADD FOREIGN KEY([Paqe_Id])
REFERENCES [Even].[tbPaquetes] ([Paqe_Id])
GO
ALTER TABLE [Even].[tbPaquetesPorUtilerias]  WITH CHECK ADD FOREIGN KEY([Util_Id])
REFERENCES [Even].[tbUtileria] ([Util_Id])
GO
ALTER TABLE [Even].[tbUtileria]  WITH CHECK ADD  CONSTRAINT [Fk_tbUtileria_Cate_Id] FOREIGN KEY([Cate_Id])
REFERENCES [Even].[tbCategoriaUtileria] ([Cate_Id])
GO
ALTER TABLE [Even].[tbUtileria] CHECK CONSTRAINT [Fk_tbUtileria_Cate_Id]
GO
ALTER TABLE [Even].[tbUtileria]  WITH CHECK ADD  CONSTRAINT [Fk_tbUtileria_Usua_Usua_Creacion] FOREIGN KEY([Util_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbUtileria] CHECK CONSTRAINT [Fk_tbUtileria_Usua_Usua_Creacion]
GO
ALTER TABLE [Even].[tbUtileria]  WITH CHECK ADD  CONSTRAINT [Fk_tbUtileria_Usua_Usua_Modifica] FOREIGN KEY([Util_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Even].[tbUtileria] CHECK CONSTRAINT [Fk_tbUtileria_Usua_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [Fk_tbCargos_Usua_Usua_Creacion] FOREIGN KEY([Carg_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [Fk_tbCargos_Usua_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [Fk_tbCargos_Usua_Usua_Modifica] FOREIGN KEY([Carg_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [Fk_tbCargos_Usua_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [Fk_tbClientes_Carg_Id] FOREIGN KEY([Carg_Id])
REFERENCES [Gral].[tbCargos] ([Carg_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [Fk_tbClientes_Carg_Id]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [Fk_tbClientes_Esta_Id] FOREIGN KEY([Esta_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Esta_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [Fk_tbClientes_Esta_Id]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [Fk_tbClientes_Muni_Id] FOREIGN KEY([Muni_Id])
REFERENCES [Gral].[tbMunicipios] ([Muni_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [Fk_tbClientes_Muni_Id]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [Fk_tbClientes_Usua_Usua_Creacion] FOREIGN KEY([Clie_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [Fk_tbClientes_Usua_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [Fk_tbClientes_Usua_Usua_Modifica] FOREIGN KEY([Clie_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [Fk_tbClientes_Usua_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [Fk_tbDepartamentos_Dept_Usuario_Creacion] FOREIGN KEY([Dept_Usuario_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [Fk_tbDepartamentos_Dept_Usuario_Creacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [Fk_tbDepartamentos_Dept_Usuario_Modifica] FOREIGN KEY([Dept_Usuario_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [Fk_tbDepartamentos_Dept_Usuario_Modifica]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [Fk_tbEmpleados_Carg_Id] FOREIGN KEY([Carg_Id])
REFERENCES [Gral].[tbCargos] ([Carg_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [Fk_tbEmpleados_Carg_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [Fk_tbEmpleados_Esta_Id] FOREIGN KEY([Esta_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Esta_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [Fk_tbEmpleados_Esta_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [Fk_tbEmpleados_Muni_Id] FOREIGN KEY([Muni_Id])
REFERENCES [Gral].[tbMunicipios] ([Muni_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [Fk_tbEmpleados_Muni_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [Fk_tbEmpleados_Usua_Usua_Creacion] FOREIGN KEY([Empl_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [Fk_tbEmpleados_Usua_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [Fk_tbEmpleados_Usua_Usua_Modifica] FOREIGN KEY([Empl_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [Fk_tbEmpleados_Usua_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [Fk_tbEstadosCiviles_Esta_Usuario_Creacion] FOREIGN KEY([Esta_Usuario_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [Fk_tbEstadosCiviles_Esta_Usuario_Creacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [Fk_tbEstadosCiviles_Esta_Usuario_Modifica] FOREIGN KEY([Esta_Usuario_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [Fk_tbEstadosCiviles_Esta_Usuario_Modifica]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [Fk_tbMunicipios_Dept_Id] FOREIGN KEY([Dept_Id])
REFERENCES [Gral].[tbDepartamentos] ([Dept_Codigo])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [Fk_tbMunicipios_Dept_Id]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [Fk_tbMunicipios_Muni_Usuario_Creacion] FOREIGN KEY([Muni_Usuario_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [Fk_tbMunicipios_Muni_Usuario_Creacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [Fk_tbMunicipios_Muni_Usuario_Modifica] FOREIGN KEY([Muni_Usuario_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [Fk_tbMunicipios_Muni_Usuario_Modifica]
GO
/****** Object:  StoredProcedure [Acce].[SP_Pantallas_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Acce].[SP_Pantallas_Mostrar] 
    @RoleId INT
AS
BEGIN
    SELECT Pan.Pant_Id, Pan.Pant_Descripcion
    FROM Acce.tbPantallas AS Pan
    WHERE Pan.Pant_Estado = 1
      AND NOT EXISTS (
          SELECT 1
          FROM Acce.tbPantallasPorRoles AS PxR
          WHERE PxR.Rol_Id = @RoleId AND PxR.pant_id = Pan.Pant_Id
      )
END
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_PantallasPorRoles_Mostrar] 
@Rol_Id INT
AS
BEGIN
	SELECT PanRo.Rol_Id,PAN.Pant_Id,Pant_Descripcion
	FROM Acce.tbPantallasPorRoles AS PanRo 
	inner JOIN Acce.tbPantallas AS PAN ON PAN.Pant_Id = PanRo.Pant_Id
	WHERE  PanRo.Rol_Id = @Rol_Id and pan.Pant_Estado = 1
	--Pan.Pant_Estado = 1 AND
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_Roles_Mostrar]
AS
BEGIN
	SELECT	
	Rol_Id,
				Rol_Descripcion
	FROM Acce.tbRoles AS Rol
	WHERE Rol.Rol_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Actualizar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_Actualizar]
    (
        @Usua_Id INT,
        @Usua_Usuario VARCHAR(30),
        @Usua_Admin BIT,
        @Empl_Id INT,
		@Clie_Id int,
        @Rol_Id INT,
        @Usua_Usua_Modifica INT,
        @Usua_Fecha_Modifica DATETIME
    )
AS
BEGIN
    BEGIN TRY
        UPDATE Acce.tbUsuarios
        SET
            Usua_Usuario = @Usua_Usuario,
            Usua_Admin = @Usua_Admin,
            Empl_Id = @Empl_Id,
			Clie_Id = @Clie_Id,
            Rol_Id = @Rol_Id,
            Usua_Usua_Modifica = @Usua_Usua_Modifica,
            Usua_Fecha_Modifica = @Usua_Fecha_Modifica
        WHERE
            Usua_Id = @Usua_Id;
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_ActualizarCodigoVerificacion]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_Usuarios_ActualizarCodigoVerificacion]
(
	@Usua_Id INT,
    @Usua_CodigoVerificacion VARCHAR(10)
)
AS
BEGIN
    BEGIN TRY
	BEGIN TRANSACTION 
        UPDATE Acce.tbUsuarios
        SET
            Usua_CodigoVerificacion = @Usua_CodigoVerificacion
        WHERE
            Usua_Id = @Usua_Id;
      	COMMIT TRANSACTION
		SELECT 1 AS Resultado;
    END TRY
   	BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        
        SELECT 
            ERROR_MESSAGE() AS Error,
            ERROR_LINE() AS Linea,
            0 AS Resultado;
	END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Eliminar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_Usuarios_Eliminar]
(
	@Usua_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Acce].[tbUsuarios]
	SET Usua_Activo = 0
	WHERE Usua_Id = @Usua_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END

GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_InicioSesion]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_InicioSesion]
(
	@Usuario VARCHAR (100),
	@Contra	VARCHAR (MAX)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @ContraHasheada VARCHAR(MAX);
	

		SET @ContraHasheada = CONVERT(VARCHAR(MAX), HASHBYTES('SHA2_512', @Contra), 2);
		
	
		SELECT usu.Usua_Id ,
				emp.Empl_Nombre + ' ' + emp.Empl_Apellido AS Empl_Empleado,
				emp.Empl_Id,
				cli.Clie_Nombre + ' ' + cli.Clie_Apellido AS Clie_Cliente,
				p.pant_descripcion,
				usu.Usua_Admin as Usua_Administrador,
				usu.Rol_Id
			
		FROM Acce.tbUsuarios AS usu 
		LEFT JOIN Gral.tbEmpleados AS emp ON usu.empl_id = emp.empl_id 
	    LEFT JOIN [Gral].[tbClientes] AS cli ON cli.Clie_Id = usu.Clie_Id 
		LEFT JOIN Acce.tbPantallasPorRoles AS R ON R.Rol_Id = usu.Rol_Id 
		LEFT JOIN Acce.tbPantallas AS p ON p.pant_id = R.pant_id
		WHERE usu.usua_Usuario = @Usuario AND usu.usua_Contra =  @ContraHasheada;
	END TRY
	BEGIN CATCH
	
		SELECT 0;
	END CATCH;
END;

GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Insertar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_Insertar]
    (
        @Usua_Usuario VARCHAR(30),
        @Usua_Contra VARCHAR(MAX),
        @Usua_Admin BIT,
        @Empl_Id INT,
		@Clie_Id int,
        @Rol_Id INT,
        @Usua_Usua_Creacion INT,
        @Usua_Fecha_Creacion DATETIME,
		@Usua_Activo  bit
    )
AS
BEGIN
     DECLARE @estadoActual INT;

    SELECT @estadoActual = Usua_Activo FROM [Acce].[tbUsuarios] WHERE Usua_Usuario = @Usua_Usuario;
BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
                -- El estado es 0, actualiza el estado a 1
                UPDATE [Acce].[tbUsuarios] SET Usua_Activo = 1 WHERE Usua_Usuario = @Usua_Usuario;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
        INSERT INTO Acce.tbUsuarios (
            Usua_Usuario,
            Usua_Contra,
            Usua_Admin,
            Empl_Id,
			Clie_Id,
            Rol_Id,
            Usua_Usua_Creacion,
            Usua_Fecha_Creacion,
			Usua_Activo
			
        )
        VALUES (
            @Usua_Usuario,
		@Usua_Contra,
            @Usua_Admin,
            @Empl_Id,
			@Clie_Id,
            @Rol_Id,
            @Usua_Usua_Creacion,
            @Usua_Fecha_Creacion,
			@Usua_Activo
        );
		END
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Llenar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Acce].[SP_Usuarios_Llenar] 
    @Usua_Id INT
AS
BEGIN
    SELECT
	Usu.Usua_Id,
        Usu.Usua_Usuario,
        Usu.Usua_Admin,
        Usu.Usua_Contra,
        Empl.Empl_Nombre + ' ' + Empl.Empl_Apellido AS Empleado,
		Rol.Rol_Id,
		Empl.Empl_Id,
        Rol.Rol_Descripcion,
        Usu.Usua_Fecha_Creacion,
        Creacion.Usua_Usuario AS UsuarioCreacion,
        Usu.Usua_Fecha_Modifica,
        Modificacion.Usua_Usuario AS UsuarioModificacion 

    FROM Acce.tbUsuarios AS Usu 
    LEFT JOIN Gral.tbEmpleados AS Empl ON Usu.Empl_Id = Empl.Empl_Id 
    LEFT JOIN Acce.tbRoles AS Rol ON Usu.Rol_Id = Rol.Rol_Id 
    LEFT JOIN Acce.tbUsuarios AS Creacion ON Usu.Usua_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Usu.Usua_Usua_Modifica = Modificacion.Usua_Id
    WHERE Usu.Usua_Id = @Usua_Id
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Acce].[SP_Usuarios_Mostrar]
AS
BEGIN
	SELECT
	    Usu.Usua_Id,
		Usu.Usua_Usuario,
		Usu.Usua_Admin,
		Empl.Empl_Nombre + ' ' + Empl.Empl_Apellido AS Empleado,
		Rol.Rol_Descripcion 

	FROM Acce.tbUsuarios AS Usu LEFT JOIN Gral.tbEmpleados AS Empl
	ON Usu.Empl_Id = Empl.Empl_Id LEFT JOIN Acce.tbRoles AS Rol
	ON Usu.Rol_Id = Rol.Rol_Id 
	WHERE Usu.Usua_Activo = 1 
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_MostrarCodigoVerificacion]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_Usuarios_MostrarCodigoVerificacion]
(
	@Usua_Id INT,
    @Usua_CodigoVerificacion VARCHAR(10)
)
AS
BEGIN
    BEGIN TRY
	BEGIN TRANSACTION 
		SELECT * from Acce.tbUsuarios 
		WHERE tbUsuarios.Usua_Id = @Usua_Id AND 
			tbUsuarios.Usua_CodigoVerificacion = @Usua_CodigoVerificacion;
    END TRY
   	BEGIN CATCH
        SELECT 0 AS Resultado;
	END CATCH
END;

GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Reestablecer]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_Reestablecer]
(
    @Usua_Id INT,
    @Usua_Contra VARCHAR(MAX),
    @Usua_Usua_Modifica INT, 
    @Usua_Fecha_Modifica DATETIME
)
AS
BEGIN
BEGIN TRY
	UPDATE Acce.tbUsuarios
			SET Usua_Contra = CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Usua_Contra), 2),
			    Usua_Usua_Modifica = @Usua_Usua_Modifica,
				Usua_Fecha_Modifica = @Usua_Fecha_Modifica
			WHERE Usua_Id = @Usua_Id
    SELECT 1
    END TRY
    BEGIN CATCH
    SELECT 0
    END CATCH
END
GO
/****** Object:  StoredProcedure [Even].[SP_CategoriaUtileria_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE  [Even].[SP_CategoriaUtileria_Mostrar]
as
BEGIN 
select catu.Cate_Id,catu.Cate_Descripion,catu.Cate_Usua_Creacion,catu.Cate_Fecha_Creacion,catu.Cate_Usua_Modifica
,catu.Cate_Fecha_Modifica,catu.Cate_Estado
from Even.tbCategoriaUtileria as Catu
Where catu.Cate_Estado = 1
END
GO
/****** Object:  StoredProcedure [Even].[SP_Eventos_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE   [Even].[SP_Eventos_Mostrar]
as
BEGIN 
select Even.Even_Id,
Even.Even_Descripcion,
Even.Even_FechaInicio,
Even.Even_FechaFin,
Clie_Nombre + '' + Clie_Apellido as Cliente,
Muni_Descripcion,
Ever_Descripcion,
Paqe_Descripcion,
Util_Descripcion,
Even.Even_Usua_Creacion,
Even.Even_Fecha_Creacion,
Even.Even_Usua_Modifica,
even.Even_Usua_Modifica,
even.Even_Fecha_Modifica

from Even.tbEventos as Even LEFT JOIN Gral.tbClientes as Clien
on Even.Clie_Id = clien.Clie_Id LEFT JOIN Gral.tbMunicipios as Muni
on Even.Muni_Id = Muni.Muni_Id LEFT JOIN GRal.tbDepartamentos as DEp
on Muni.Dept_Id = DEp.Dept_Codigo LEFT JOIN Even.tbEventosElegir as EVE
on Even.Ever_Id = EVE.Ever_Id LEFT JOIN Even.tbPaquetesPorUtilerias AS Paut
on Even.PaUt_Id = Paut.PaUt_Id LEFT JOIN Even.tbPaquetes as Pa
on Paut.Paqe_Id = pa.Paqe_Id LEFT JOIN Even.tbUtileria as Util
on Paut.Util_Id = Util.Util_Id
Where Even.Even_Estado = 1
END
GO
/****** Object:  StoredProcedure [Even].[SP_EventosElegir_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Even].[SP_EventosElegir_Mostrar]
as
BEGIN
Select Ever.Ever_Id,
	   Ever.Ever_Descripcion,
	   Ever.Ever_UsuarioCreacion,
	   Ever.Ever_FechaCreacion,
	   Ever.Ever_UsuarioModifica,
	   Ever.Ever_FechaModifica

FROM Even.tbEventosElegir as Ever

END
GO
/****** Object:  StoredProcedure [Even].[SP_MayorEventos_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create     PROCEDURE [Even].[SP_MayorEventos_Mostrar]
AS 
BEGIN
    BEGIN TRY
        SELECT 
            [Clie_Nombre] AS Nombre,
            [Clie_Apellido] AS Apellido,
            [Ever_Descripcion],
            COUNT(*) AS TotalEventos
       FROM 
             [Even].[tbEventos] as even LEFT JOIN [Gral].[tbClientes] as clien
			 on clien.Clie_Id = even.Clie_Id left join [Even].[tbEventosElegir] as eveEle
			 on eveEle.Ever_Id = even.Ever_Id
        GROUP BY 
            Clie_Nombre, Clie_Apellido, [Ever_Descripcion]
        ORDER BY 
            TotalEventos DESC;
    END TRY
    BEGIN CATCH 
        SELECT 0 AS Resultado;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Even].[SP_MayorEventosPorSexo_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [Even].[SP_MayorEventosPorSexo_Mostrar]
AS 
BEGIN
    BEGIN TRY
        SELECT 
            [Clie_Nombre] AS NombreEve,
            [Clie_Apellido] AS ApellidoEve,
            [Even_Sexo],
            COUNT(*) AS TotalEventosEve
       FROM 
             [Even].[tbEventos] as even LEFT JOIN [Gral].[tbClientes] as clien
			 on clien.Clie_Id = even.Clie_Id
        GROUP BY 
            Clie_Nombre, Clie_Apellido, Even_Sexo
        ORDER BY 
            TotalEventosEve DESC;
    END TRY
    BEGIN CATCH 
        SELECT 0 AS Resultado;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Even].[SP_Paquetes_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Even].[SP_Paquetes_Mostrar]
as
BEGIN
Select Pa.Paqe_Id,
	   Pa.Paqe_Descripcion,
	   Pa.Paqe_Precio,
	   Pa.Paqe_FechaLimite,
	   Emp.Empl_Nombre + '' + Emp.Empl_Apellido as Empleados,
	   Pa.Paqe_Usua_Creacion,
	   Pa.Paqe_Fecha_Creacion,
	   Pa.Paqe_Usua_Modifica,
	   Pa.Paqe_Fecha_Modifica

FROM Even.tbPaquetes as Pa LEFT JOIN GRal.tbEmpleados as Emp
on Pa.Empl_Id = EMP.Empl_Id 

END
GO
/****** Object:  StoredProcedure [Even].[SP_PaquetesDetalle_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Even].[SP_PaquetesDetalle_Mostrar]
as
BEGIN
Select pd.PaDe_Id,
	   util.Util_Descripcion,
	   Pd.PaDe_Cantidad,
	   Pd.PaDe_Subtotal,
	   Pd.PaDe_Total,
	   Pa.Paqe_Descripcion
FROM Even.tbPaquetesDetalle as Pd LEFT JOIN EVEN.tbUtileria as util
on Pd.Util_Id = util.Util_Id LEFT JOIN Even.tbPaquetesPorUtilerias as Paut
on Pd.PaUt_Id = Paut.PaUt_Id LEFT JOIN Even.tbPaquetes as Pa 
on Paut.Paqe_Id = Pa.Paqe_Id

END
GO
/****** Object:  StoredProcedure [Even].[SP_PaquetesMasSolicitados]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Even].[SP_PaquetesMasSolicitados]
AS
BEGIN
    BEGIN TRY
        SELECT 
            ppu.[Paqe_Id],
            paq.[Paqe_Descripcion] AS NombrePaquete,
            COUNT(*) AS TotalPaquetesSolicitados
        FROM 
            [Even].[tbPaquetesPorUtilerias] ppu
        JOIN 
            [Even].[tbPaquetes] paq ON ppu.[Paqe_Id] = paq.[Paqe_Id]
        GROUP BY 
            ppu.[Paqe_Id], paq.[Paqe_Descripcion]
        ORDER BY 
            TotalPaquetesSolicitados DESC;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Even].[SP_Utileria_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ALTER TABLE [Even].[tbPaquetesDetalle]
--ADD CONSTRAINT FK_PaqueteDetalle_Page_Id
--FOREIGN KEY (Paqe_Id)
--REFERENCES [Even].[tbPaquetes](Paqe_Id);
--Go
Create   PROCEDURE [Even].[SP_Utileria_Mostrar]
as
BEGIN
Select Util.Util_Id,
	   Util.Util_Descripcion,
	   ct.Cate_Descripion,
	   Util.Util_cantidadStock,
	   Util.Util_Imagen,
	   Util.Util_Precio,
	   Util.Util_Disponibilidad,
	   Util.Util_Usua_Creacion,
	   Util.Util_Fecha_Creacion,
	   Util.Util_Usua_Modifica,
	   Util.Util_Fecha_Modifica

FROM Even.tbUtileria as Util LEFT JOIN Even.tbCategoriaUtileria as ct
on Util.Cate_Id = ct.Cate_Id

END
GO
/****** Object:  StoredProcedure [Even].[SP_UtileriasMasCompradas]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Even].[SP_UtileriasMasCompradas]
AS
BEGIN
    BEGIN TRY
        SELECT 
            u.[Util_Id],
            u.[Util_Descripcion] AS NombreUtileria,
            COUNT(*) AS TotalCompras
        FROM 
            [Even].[tbUtileria] u
        JOIN 
            [Even].[tbPaquetesPorUtilerias] ppu ON u.[Util_Id] = ppu.[Util_Id]
        WHERE 
            u.[Util_Disponibilidad] = 1
        GROUP BY 
            u.[Util_Id], u.[Util_Descripcion]
        ORDER BY 
            TotalCompras DESC;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Gral].[SP_Cargos_Mostrar]
AS
BEGIN
	SELECT	Carg.Carg_Id,
			Carg.Carg_Descripcion
	FROM Gral.tbCargos AS Carg
	WHERE Carg.Carg_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Gral].[SP_Clientes_Mostrar]
AS
BEGIN
	SELECT	Clie.Clie_Id,
			Clie.Clie_Identidad,
			Clie_Nombre,
			Clie_Apellido,
			Clie_Sexo,
			Clie_Telefono,
			Clie_CorreoElectronico,
			Esta_Descripcion,
			Muni_Descripcion,
			Dept_Descripcion,
			Carg_Descripcion
		
	FROM Gral.tbClientes AS Clie LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Clie.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Clie.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Codigo LEFT JOIn Gral.tbCargos as carg 
	ON Clie.Carg_Id = carg.Carg_Id
	WHERE Clie.Clie_Estado = 1 
END
GO
/****** Object:  StoredProcedure [Gral].[SP_CrearClienteYUsuario_Registrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Gral].[SP_CrearClienteYUsuario_Registrar]
    @Clie_Identidad VARCHAR(50),
    @Clie_Nombre VARCHAR(100),
    @Clie_Apellido VARCHAR(100),
    @Clie_Telefono VARCHAR(50),
    @Clie_CorreoElectronico VARCHAR(50),
    @Clie_Sexo CHAR(1),
    @Esta_Id INT,
    @Muni_Id VARCHAR(4),
    @Clie_Usua_Creacion INT,
    @Clie_Fecha_Creacion DATE,
    @Clie_Estado BIT = 1,
    @Carg_Id INT,
    @Usua_Usuario VARCHAR(30),
    @Usua_Contra VARCHAR(MAX),
    @Usua_Admin BIT,
    @Rol_Id INT,
    @Usua_Usua_Creacion INT,
    @Usua_Fecha_Creacion DATETIME,
    @Usua_Activo BIT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

      
        DECLARE @HashContraseña VARCHAR(MAX);
        SET @HashContraseña = CONVERT(VARCHAR(MAX), HASHBYTES('SHA2_512', @Usua_Contra), 2);

     
        INSERT INTO Gral.tbClientes (
            Clie_Identidad, Clie_Nombre, Clie_Apellido, Clie_Telefono,
            Clie_CorreoElectronico, Clie_Sexo, Esta_Id, Muni_Id,
            Clie_Usua_Creacion, Clie_Fecha_Creacion , Clie_Estado, Carg_Id
        )
        VALUES (
            @Clie_Identidad, @Clie_Nombre, @Clie_Apellido, @Clie_Telefono,
            @Clie_CorreoElectronico, @Clie_Sexo, @Esta_Id, @Muni_Id,
            @Clie_Usua_Creacion, @Clie_Fecha_Creacion,
             @Clie_Estado, @Carg_Id
        );

        
        DECLARE @NuevoClienteId INT;
        SET @NuevoClienteId = SCOPE_IDENTITY();

     
        INSERT INTO Acce.tbUsuarios (
            Usua_Usuario,
            Usua_Contra,
            Usua_Admin,
            Empl_Id,
            Clie_Id,
            Rol_Id,
            Usua_Usua_Creacion,
            Usua_Fecha_Creacion,
            Usua_Activo
        )
        VALUES (
            @Usua_Usuario,
            @HashContraseña,
            @Usua_Admin,
            NULL, 
            @NuevoClienteId, 
            @Rol_Id,
            @Usua_Usua_Creacion,
            @Usua_Fecha_Creacion,
            @Usua_Activo
        );

        COMMIT TRANSACTION
        SELECT 1 AS Resultado; 
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage,
            ERROR_LINE() AS ErrorLine,
            0 AS Resultado; 
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Editar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Gral].[SP_Departamentos_Editar]
    @Dept_Codigo VARCHAR(2),
    @Dept_Descripcion VARCHAR(50),
    @Dept_Usuario_Modifica INT,
    @Dept_Fecha_Modifica DATETIME
AS
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
        UPDATE Gral.tbDepartamentos
        SET Dept_Descripcion = @Dept_Descripcion,
            Dept_Usuario_Modifica = @Dept_Usuario_Modifica,
            Dept_Fecha_Modifica = @Dept_Fecha_Modifica
        WHERE Dept_Codigo = @Dept_Codigo;
        SELECT 1 AS Resultado;
		COMMIT
    END TRY
    BEGIN CATCH
		ROLLBACK;
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Eliminar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Gral].[SP_Departamentos_Eliminar]
    @Dept_Codigo VARCHAR(2)
AS
BEGIN
    BEGIN TRY
        DELETE FROM Gral.tbDepartamentos
        WHERE Dept_Codigo = @Dept_Codigo;
        SELECT 1 AS Resultado;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Insertar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Insertar]
    @Dept_Codigo VARCHAR(2),
    @Dept_Descripcion VARCHAR(50),
    @Dept_Usuario_Creacion INT,
    @Dept_Fecha_Creacion DATETIME
AS
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
        INSERT INTO Gral.tbDepartamentos (Dept_Codigo, Dept_Descripcion, Dept_Usuario_Creacion, Dept_Fecha_Creacion)
        VALUES (@Dept_Codigo, @Dept_Descripcion, @Dept_Usuario_Creacion, @Dept_Fecha_Creacion);
        SELECT 1 AS Resultado;
		COMMIT
    END TRY
    BEGIN CATCH
		ROLLBACK
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Llenar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Gral].[SP_Departamentos_Llenar]
(
	@Dept_Codigo VARCHAR(2)
)
AS 
BEGIN
    BEGIN TRY
        SELECT *
        FROM Gral.tbDepartamentos
		WHERE tbDepartamentos.Dept_Codigo = @Dept_Codigo
    END TRY
    BEGIN CATCH 
        SELECT 0 ;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Gral].[SP_Departamentos_Mostrar]
AS 
BEGIN
    BEGIN TRY
        SELECT 
            Dept_Codigo,
            Dept_Descripcion
        FROM Gral.tbDepartamentos 
    END TRY
    BEGIN CATCH 
        SELECT 0 ;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [Gral].[SP_Empleados_Mostrar]
AS
BEGIN
	SELECT	Empl.Empl_Id,
			Empl.Empl_Identidad,
			Empl.Empl_Nombre,
			Empl.Empl_Apellido,
			Empl.Empl_Sexo,
			Empl.Empl_CorreoElectronico,
			Carg.Carg_Descripcion,
			Esta.Esta_Descripcion,
			Muni.Muni_Descripcion,
			Depa.Dept_Descripcion
	FROM Gral.tbEmpleados AS Empl LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Empl.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbCargos AS Carg
	ON Empl.Carg_Id = Carg.Carg_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Empl.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Codigo
	WHERE Empl.Empl_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Gral].[SP_EstadosCiviles_Mostrar]
AS
BEGIN
	SELECT	Esta.Esta_Id,
			Esta.Esta_Descripcion,
			Esta.Esta_Usuario_Creacion,
			Esta_Fecha_Creacion,
			Esta.Esta_Usuario_Modifica,
			Esta_Fecha_Modifica
	FROM Gral.tbEstadosCiviles AS Esta
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Mostrar]    Script Date: 17/4/2024 10:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Gral].[SP_Municipios_Mostrar]
AS
BEGIN
	SELECT		Muni_Id,Muni_Descripcion,Dept_Descripcion
			
	FROM Gral.tbMunicipios AS Muni left JOIN Gral.tbDepartamentos as Depa
	ON Muni.Dept_Id = Depa.Dept_Codigo
END
GO
