USE [master]
GO
/****** Object:  Database [SanaDB]    Script Date: 28/06/2024 11:04:03 p. m. ******/
CREATE DATABASE [SanaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SanaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SanaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SanaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SanaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SanaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SanaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SanaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SanaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SanaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SanaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SanaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SanaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SanaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SanaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SanaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SanaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SanaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SanaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SanaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SanaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SanaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SanaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SanaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SanaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SanaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SanaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SanaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SanaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SanaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SanaDB] SET  MULTI_USER 
GO
ALTER DATABASE [SanaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SanaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SanaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SanaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SanaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SanaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SanaDB', N'ON'
GO
ALTER DATABASE [SanaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SanaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SanaDB]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 28/06/2024 11:04:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 28/06/2024 11:04:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 28/06/2024 11:04:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 28/06/2024 11:04:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[total] [float] NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_categories]    Script Date: 28/06/2024 11:04:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 28/06/2024 11:04:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](255) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [description]) VALUES (1, N'Electronics')
INSERT [dbo].[categories] ([id], [description]) VALUES (2, N'Books')
INSERT [dbo].[categories] ([id], [description]) VALUES (3, N'Clothing')
INSERT [dbo].[categories] ([id], [description]) VALUES (4, N'Home & Kitchen')
INSERT [dbo].[categories] ([id], [description]) VALUES (5, N'Sports & Outdoors')
INSERT [dbo].[categories] ([id], [description]) VALUES (6, N'Health & Personal Care')
INSERT [dbo].[categories] ([id], [description]) VALUES (7, N'Toys & Games')
INSERT [dbo].[categories] ([id], [description]) VALUES (8, N'Automotive')
INSERT [dbo].[categories] ([id], [description]) VALUES (9, N'Beauty')
INSERT [dbo].[categories] ([id], [description]) VALUES (10, N'Computers')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [name]) VALUES (1, N'Pepe')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (1, 2, 699.99, 1, 1)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (2, 2, 699.99, 1, 2)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (3, 2, 699.99, 1, 3)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (4, 2, 699.99, 1, 4)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (5, 2, 699.99, 1, 5)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (6, 1, 999.99, 2, 6)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (7, 1, 999.99, 2, 7)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (8, 1, 999.99, 2, 8)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (9, 1, 999.99, 2, 9)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (10, 1, 999.99, 2, 10)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (11, 1, 999.99, 2, 11)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (12, 1, 999.99, 2, 12)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (13, 1, 999.99, 2, 13)
INSERT [dbo].[order_detail] ([id], [quantity], [price], [product_id], [order_id]) VALUES (14, 1, 299.99, 3, 13)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (1, NULL, CAST(N'2024-06-29T03:18:59.377' AS DateTime), 1399.98, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (2, NULL, CAST(N'2024-06-29T03:19:48.483' AS DateTime), 1399.98, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (3, NULL, CAST(N'2024-06-29T03:21:52.207' AS DateTime), 1399.98, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (4, NULL, CAST(N'2024-06-29T03:26:24.770' AS DateTime), 1399.98, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (5, NULL, CAST(N'2024-06-29T03:31:12.427' AS DateTime), 1399.98, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (6, NULL, CAST(N'2024-06-29T03:33:43.850' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (7, NULL, CAST(N'2024-06-29T03:34:56.897' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (8, NULL, CAST(N'2024-06-29T03:39:43.583' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (9, NULL, CAST(N'2024-06-29T03:48:49.860' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (10, NULL, CAST(N'2024-06-29T03:51:16.420' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (11, NULL, CAST(N'2024-06-29T03:51:52.073' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (12, NULL, CAST(N'2024-06-29T03:58:38.263' AS DateTime), 999.99, 1)
INSERT [dbo].[orders] ([id], [description], [date], [total], [customer_id]) VALUES (13, NULL, CAST(N'2024-06-29T03:58:59.647' AS DateTime), 1299.98, 1)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (1, N'P001', N'Smartphone', 699.99, 0, N'Latest model with advanced features', 1)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (2, N'P002', N'Laptop', 999.99, 2, N'High-performance laptop for gaming and work', 1)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (3, N'P003', N'Tablet', 299.99, 9, N'Portable and powerful tablet', 1)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (4, N'P004', N'Headphones', 199.99, 10, N'Noise-cancelling headphones', 1)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (5, N'P005', N'E-reader', 129.99, 10, N'Lightweight e-reader with a long battery life', 2)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (6, N'P006', N'Cookbook', 24.99, 10, N'Recipes for healthy and delicious meals', 2)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (7, N'P007', N'Mystery Novel', 19.99, 10, N'Best-selling mystery novel', 2)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (8, N'P008', N'History Book', 29.99, 10, N'Comprehensive history book', 2)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (9, N'P009', N'T-shirt', 15.99, 10, N'Comfortable cotton t-shirt', 3)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (10, N'P010', N'Jeans', 49.99, 10, N'Stylish and durable jeans', 3)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (11, N'P011', N'Sweater', 39.99, 10, N'Warm and cozy sweater', 3)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (12, N'P012', N'Dress', 59.99, 10, N'Elegant evening dress', 3)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (13, N'P013', N'Blender', 89.99, 10, N'High-speed blender for smoothies and soups', 4)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (14, N'P014', N'Toaster', 29.99, 10, N'2-slice toaster with defrost function', 4)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (15, N'P015', N'Microwave Oven', 149.99, 10, N'Compact microwave oven', 4)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (16, N'P016', N'Vacuum Cleaner', 149.99, 10, N'Powerful vacuum cleaner for deep cleaning', 4)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (17, N'P017', N'Yoga Mat', 29.99, 10, N'Non-slip yoga mat for all levels', 5)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (18, N'P018', N'Dumbbells', 59.99, 10, N'Adjustable dumbbells for strength training', 5)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (19, N'P019', N'Running Shoes', 79.99, 10, N'Lightweight running shoes', 5)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (20, N'P020', N'Football', 19.99, 10, N'Official size and weight football', 5)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (21, N'P021', N'Shampoo', 9.99, 10, N'Nourishing shampoo for all hair types', 6)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (22, N'P022', N'Toothbrush', 4.99, 10, N'Soft-bristle toothbrush', 6)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (23, N'P023', N'Multivitamins', 19.99, 10, N'Daily multivitamin supplement', 6)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (24, N'P024', N'Toy Car', 14.99, 10, N'Remote-controlled toy car', 7)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (25, N'P025', N'Board Game', 29.99, 10, N'Family board game for all ages', 7)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (26, N'P026', N'Puzzle', 19.99, 10, N'1000-piece puzzle', 7)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (27, N'P027', N'Car Wax', 14.99, 10, N'High-gloss car wax', 8)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (28, N'P028', N'Car Battery', 99.99, 10, N'Long-lasting car battery', 8)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (29, N'P029', N'Face Cream', 29.99, 10, N'Anti-aging face cream', 9)
INSERT [dbo].[products] ([id], [code], [name], [price], [quantity], [description], [category_id]) VALUES (30, N'P030', N'Laptop Bag', 49.99, 10, N'Durable laptop bag with multiple compartments', 10)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[product_categories]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[product_categories]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
USE [master]
GO
ALTER DATABASE [SanaDB] SET  READ_WRITE 
GO
