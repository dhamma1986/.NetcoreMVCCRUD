USE [master]
GO
/****** Object:  Database [AgreementMgmt]    Script Date: 03/10/2022 07:51:19 ******/
CREATE DATABASE [AgreementMgmt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgreementMgmt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AgreementMgmt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AgreementMgmt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AgreementMgmt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AgreementMgmt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgreementMgmt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgreementMgmt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgreementMgmt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgreementMgmt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgreementMgmt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgreementMgmt] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgreementMgmt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AgreementMgmt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgreementMgmt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgreementMgmt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgreementMgmt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgreementMgmt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgreementMgmt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgreementMgmt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgreementMgmt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgreementMgmt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AgreementMgmt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgreementMgmt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgreementMgmt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgreementMgmt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgreementMgmt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgreementMgmt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgreementMgmt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgreementMgmt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgreementMgmt] SET  MULTI_USER 
GO
ALTER DATABASE [AgreementMgmt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgreementMgmt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgreementMgmt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgreementMgmt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AgreementMgmt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AgreementMgmt] SET QUERY_STORE = OFF
GO
USE [AgreementMgmt]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AgreementMgmt]
GO
/****** Object:  Table [dbo].[AgreementMaster]    Script Date: 03/10/2022 07:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgreementMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[PrdGroupID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[EffectiveDate] [smalldatetime] NULL,
	[ExpirationDate] [smalldatetime] NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[NewPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_AgreementMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroupMaster]    Script Date: 03/10/2022 07:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroupMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupDescription] [nvarchar](500) NULL,
	[GroupCode] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductGroupMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 03/10/2022 07:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProdGroupID] [bigint] NOT NULL,
	[ProductDescription] [nvarchar](500) NULL,
	[ProductNumber] [nvarchar](10) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/10/2022 07:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](150) NULL,
	[LastName] [nvarchar](150) NULL,
	[email] [nvarchar](250) NULL,
	[mobile] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AgreementMaster] ON 
GO
INSERT [dbo].[AgreementMaster] ([ID], [UserID], [PrdGroupID], [ProductID], [EffectiveDate], [ExpirationDate], [ProductPrice], [NewPrice]) VALUES (1, 1, 2, 1, CAST(N'2022-09-27T00:00:00' AS SmallDateTime), CAST(N'2022-10-10T00:00:00' AS SmallDateTime), CAST(2000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[AgreementMaster] ([ID], [UserID], [PrdGroupID], [ProductID], [EffectiveDate], [ExpirationDate], [ProductPrice], [NewPrice]) VALUES (3, NULL, 3, 2, CAST(N'2022-10-01T23:51:00' AS SmallDateTime), CAST(N'2022-10-01T23:51:00' AS SmallDateTime), CAST(2000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[AgreementMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductGroupMaster] ON 
GO
INSERT [dbo].[ProductGroupMaster] ([ID], [GroupDescription], [GroupCode], [IsActive]) VALUES (2, N'Group 1', N'GP1', 1)
GO
INSERT [dbo].[ProductGroupMaster] ([ID], [GroupDescription], [GroupCode], [IsActive]) VALUES (3, N'Group 2', N'GP2', 1)
GO
SET IDENTITY_INSERT [dbo].[ProductGroupMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductMaster] ON 
GO
INSERT [dbo].[ProductMaster] ([ID], [ProdGroupID], [ProductDescription], [ProductNumber], [Price], [IsActive]) VALUES (1, 2, N'PROD 1', N'PRD1', CAST(2000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[ProductMaster] ([ID], [ProdGroupID], [ProductDescription], [ProductNumber], [Price], [IsActive]) VALUES (2, 3, N'PROD 2', N'PRD2', CAST(3000.00 AS Decimal(18, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[ProductMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON 
GO
INSERT [dbo].[UserMaster] ([ID], [FirstName], [LastName], [email], [mobile], [Password], [IsActive]) VALUES (1, N'Raj', N'Kumar', N'raj@kumar.com', N'7777755555', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
GO
ALTER TABLE [dbo].[AgreementMaster]  WITH CHECK ADD  CONSTRAINT [FK_AgreementMaster_ProductGroupMaster] FOREIGN KEY([PrdGroupID])
REFERENCES [dbo].[ProductGroupMaster] ([ID])
GO
ALTER TABLE [dbo].[AgreementMaster] CHECK CONSTRAINT [FK_AgreementMaster_ProductGroupMaster]
GO
ALTER TABLE [dbo].[AgreementMaster]  WITH CHECK ADD  CONSTRAINT [FK_AgreementMaster_ProductMaster] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductMaster] ([ID])
GO
ALTER TABLE [dbo].[AgreementMaster] CHECK CONSTRAINT [FK_AgreementMaster_ProductMaster]
GO
ALTER TABLE [dbo].[ProductMaster]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaster_ProductGroupMaster] FOREIGN KEY([ProdGroupID])
REFERENCES [dbo].[ProductGroupMaster] ([ID])
GO
ALTER TABLE [dbo].[ProductMaster] CHECK CONSTRAINT [FK_ProductMaster_ProductGroupMaster]
GO
USE [master]
GO
ALTER DATABASE [AgreementMgmt] SET  READ_WRITE 
GO
