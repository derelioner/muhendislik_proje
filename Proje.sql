USE [ProjeYonetim]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 13.01.2018 18:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjeDurumlari]    Script Date: 13.01.2018 18:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjeDurumlari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DurumAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProjeDurumlari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projeler]    Script Date: 13.01.2018 18:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projeler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DurumId] [int] NULL,
	[KullaniciId] [int] NULL,
	[ProjeAdi] [nvarchar](50) NULL,
	[Aciklama] [nchar](10) NULL,
	[BaslangicTarihi] [datetime] NULL,
	[BitisTarihi] [datetime] NULL,
 CONSTRAINT [PK_Projeler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VW_Projeler]    Script Date: 13.01.2018 18:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Projeler]
AS
SELECT 
P.ID AS [PROJE_ID],
P.DurumId AS [DURUM_ID],
p.BaslangicTarihi,
p.BitisTarihi,
K.ID AS [KULLANICI_ID],
P.ProjeAdi,
PD.DurumAdi,
K.KullaniciAdi
FROM Projeler AS P
inner join ProjeDurumlari AS PD
ON P.DurumId=PD.ID
inner join Kullanicilar as K
ON K.ID=P.KullaniciId

GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

GO
INSERT [dbo].[Kullanicilar] ([ID], [KullaniciAdi], [Email], [Sifre]) VALUES (3, N'ÖNER DERELİ', N'oner@gmail.com', N'123456')
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjeDurumlari] ON 

GO
INSERT [dbo].[ProjeDurumlari] ([ID], [DurumAdi]) VALUES (1, N'Bekleniyor')
GO
INSERT [dbo].[ProjeDurumlari] ([ID], [DurumAdi]) VALUES (2, N'Devam Ediyor')
GO
INSERT [dbo].[ProjeDurumlari] ([ID], [DurumAdi]) VALUES (5, N'Tamamlandı')
GO
SET IDENTITY_INSERT [dbo].[ProjeDurumlari] OFF
GO
SET IDENTITY_INSERT [dbo].[Projeler] ON 

GO
INSERT [dbo].[Projeler] ([ID], [DurumId], [KullaniciId], [ProjeAdi], [Aciklama], [BaslangicTarihi], [BitisTarihi]) VALUES (12, 2, 3, N'Test Proje ', N'Test      ', CAST(N'2017-02-13 00:00:00.000' AS DateTime), CAST(N'2018-02-13 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Projeler] OFF
GO
