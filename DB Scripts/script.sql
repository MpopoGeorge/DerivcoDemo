USE [master]
GO
/****** Object:  Database [Derivcoonline_Db]    Script Date: 2021/12/29 14:29:59 ******/
CREATE DATABASE [Derivcoonline_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Derivcoonline_Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Derivcoonline_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Derivcoonline_Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Derivcoonline_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Derivcoonline_Db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Derivcoonline_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Derivcoonline_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Derivcoonline_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Derivcoonline_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Derivcoonline_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Derivcoonline_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [Derivcoonline_Db] SET  MULTI_USER 
GO
ALTER DATABASE [Derivcoonline_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Derivcoonline_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Derivcoonline_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Derivcoonline_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Derivcoonline_Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Derivcoonline_Db', N'ON'
GO
ALTER DATABASE [Derivcoonline_Db] SET QUERY_STORE = OFF
GO
USE [Derivcoonline_Db]
GO
/****** Object:  Schema [DerivcoUsers]    Script Date: 2021/12/29 14:30:02 ******/
CREATE SCHEMA [DerivcoUsers]
GO
/****** Object:  Schema [master]    Script Date: 2021/12/29 14:30:02 ******/
CREATE SCHEMA [master]
GO
/****** Object:  Schema [orders]    Script Date: 2021/12/29 14:30:02 ******/
CREATE SCHEMA [orders]
GO
/****** Object:  Table [DerivcoUsers].[Customers]    Script Date: 2021/12/29 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DerivcoUsers].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](200) NULL,
	[TelephoneNumber] [nvarchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [master].[Categories]    Script Date: 2021/12/29 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [master].[MenuItems]    Script Date: 2021/12/29 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[MenuItems](
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[MenuItemCode] [nvarchar](50) NOT NULL,
	[MenuItemName] [nvarchar](50) NOT NULL,
	[MenuItemDescription] [nvarchar](300) NULL,
	[MenuItemImagePath] [nvarchar](600) NOT NULL,
	[MenuItemPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[MenuItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [orders].[CustomerOrder]    Script Date: 2021/12/29 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [orders].[CustomerOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [orders].[OrderDetails]    Script Date: 2021/12/29 14:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [orders].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[MenuItemId] [nvarchar](600) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [DerivcoUsers].[Customers] ON 

INSERT [DerivcoUsers].[Customers] ([CustomerId], [CustomerUserName], [FirstName], [LastName], [EmailAddress], [TelephoneNumber]) VALUES (1, N'INNOVECH\Admin', N'George', N'Mpopo', N'demosmain21@gmail.com', N'0818993305')
INSERT [DerivcoUsers].[Customers] ([CustomerId], [CustomerUserName], [FirstName], [LastName], [EmailAddress], [TelephoneNumber]) VALUES (11, N'INNOVECH\Admin', N'George', N'Mpopo', N'demosmain21@gmail.com', N'818993305')
INSERT [DerivcoUsers].[Customers] ([CustomerId], [CustomerUserName], [FirstName], [LastName], [EmailAddress], [TelephoneNumber]) VALUES (12, N'INNOVECH\Admin', N'George', N'Mpopo', N'demosmain21@gmail.com', N'818993305')
SET IDENTITY_INSERT [DerivcoUsers].[Customers] OFF
GO
SET IDENTITY_INSERT [master].[Categories] ON 

INSERT [master].[Categories] ([CategoryId], [CategoryCode], [CategoryName]) VALUES (1, N'E-100', N'Oranges')
INSERT [master].[Categories] ([CategoryId], [CategoryCode], [CategoryName]) VALUES (2, N'E-200', N'Apples')
INSERT [master].[Categories] ([CategoryId], [CategoryCode], [CategoryName]) VALUES (3, N'E-300', N'Sauteed Broccoli Rape')
INSERT [master].[Categories] ([CategoryId], [CategoryCode], [CategoryName]) VALUES (11, N'E-400', N'Pork Meat')
SET IDENTITY_INSERT [master].[Categories] OFF
GO
INSERT [master].[MenuItems] ([MenuItemId], [CategoryId], [MenuItemCode], [MenuItemName], [MenuItemDescription], [MenuItemImagePath], [MenuItemPrice]) VALUES (N'bd501d55-5c00-4850-9e52-5fccba87c062', 11, N'E-2999', N'Pork Meat', N'Pork Meat is white mean', N'~/Images/5e129e89-be85-4a11-833e-c870202196f7.jpg', CAST(89.00 AS Decimal(18, 2)))
INSERT [master].[MenuItems] ([MenuItemId], [CategoryId], [MenuItemCode], [MenuItemName], [MenuItemDescription], [MenuItemImagePath], [MenuItemPrice]) VALUES (N'bf0192c1-c385-485e-974b-e52a7c6291a8', 2, N'E-1100', N'Cold Fruits', N'Too Cold Fruits from fridge', N'~/Images/5e129e89-be85-4a11-833e-c870202196f7.jpg', CAST(54.00 AS Decimal(18, 2)))
INSERT [master].[MenuItems] ([MenuItemId], [CategoryId], [MenuItemCode], [MenuItemName], [MenuItemDescription], [MenuItemImagePath], [MenuItemPrice]) VALUES (N'55542cb4-9413-409c-89c7-e806710db3d4', 1, N'E-200', N'Apple', N'Apples good for you', N'~/Images/0f883d0f-43e2-4adf-b791-e6c286258265.jpg', CAST(43.00 AS Decimal(18, 2)))
INSERT [master].[MenuItems] ([MenuItemId], [CategoryId], [MenuItemCode], [MenuItemName], [MenuItemDescription], [MenuItemImagePath], [MenuItemPrice]) VALUES (N'23f74083-fba0-4663-b48d-fc4ecfc9444c', 3, N'E-2200', N'Broccoli Rape', N'Sauteed Broccoli Rape', N'~/Images/6d0052b8-0c72-42d1-9761-04c1ee52d3e5.jpg', CAST(55.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [orders].[CustomerOrder] ON 

INSERT [orders].[CustomerOrder] ([OrderId], [OrderDate], [OrderNumber], [CustomerId]) VALUES (14, CAST(N'2021-12-29T12:21:39.133' AS DateTime), N'292102021122139', 11)
INSERT [orders].[CustomerOrder] ([OrderId], [OrderDate], [OrderNumber], [CustomerId]) VALUES (15, CAST(N'2021-12-29T13:15:36.647' AS DateTime), N'291502021131536', 12)
SET IDENTITY_INSERT [orders].[CustomerOrder] OFF
GO
SET IDENTITY_INSERT [orders].[OrderDetails] ON 

INSERT [orders].[OrderDetails] ([OrderDetailId], [OrderId], [MenuItemId], [Quantity], [UnitPrice], [TotalAmount]) VALUES (31, 14, N'bd501d55-5c00-4850-9e52-5fccba87c062', CAST(1.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)), CAST(89.00 AS Decimal(18, 2)))
INSERT [orders].[OrderDetails] ([OrderDetailId], [OrderId], [MenuItemId], [Quantity], [UnitPrice], [TotalAmount]) VALUES (32, 14, N'55542cb4-9413-409c-89c7-e806710db3d4', CAST(1.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)))
INSERT [orders].[OrderDetails] ([OrderDetailId], [OrderId], [MenuItemId], [Quantity], [UnitPrice], [TotalAmount]) VALUES (33, 15, N'55542cb4-9413-409c-89c7-e806710db3d4', CAST(1.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)))
INSERT [orders].[OrderDetails] ([OrderDetailId], [OrderId], [MenuItemId], [Quantity], [UnitPrice], [TotalAmount]) VALUES (34, 15, N'bf0192c1-c385-485e-974b-e52a7c6291a8', CAST(1.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [orders].[OrderDetails] ([OrderDetailId], [OrderId], [MenuItemId], [Quantity], [UnitPrice], [TotalAmount]) VALUES (35, 15, N'23f74083-fba0-4663-b48d-fc4ecfc9444c', CAST(1.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [orders].[OrderDetails] OFF
GO
USE [master]
GO
ALTER DATABASE [Derivcoonline_Db] SET  READ_WRITE 
GO
