CREATE DATABASE Trial
USE [Trial]
GO
/****** Object:  Table [dbo].[tb_Cart]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Cart](
	[ID_Product] [int] IDENTITY(1,1) NOT NULL,
	[Name_Product] [varchar](50) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Total]  AS ([Price]*[Quantity]),
 CONSTRAINT [PK_tb_Cart] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Customer]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Customer](
	[ID_Customer] [int] IDENTITY(1,1) NOT NULL,
	[Name_Customer] [nvarchar](50) NOT NULL,
	[Store_Customer] [nvarchar](50) NOT NULL,
	[Address_Customer] [nvarchar](50) NOT NULL,
	[Tel_Customer] [int] NULL,
 CONSTRAINT [PK_tb_Customer] PRIMARY KEY CLUSTERED 
(
	[ID_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_order]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order](
	[ID_order] [int] IDENTITY(1,1) NOT NULL,
	[Code_Order] [nvarchar](50) NULL,
	[Name_Order] [nvarchar](50) NULL,
	[Type_Order] [nvarchar](50) NULL,
	[Create_date] [datetime] NULL,
	[Total_money] [float] NULL,
 CONSTRAINT [PK_tb_order] PRIMARY KEY CLUSTERED 
(
	[ID_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order_detail](
	[ID_orderDetails] [int] IDENTITY(1,1) NOT NULL,
	[ID_order] [int] NULL,
	[ID_Product] [int] NULL,
	[Name_product] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Total_money] [float] NULL,
 CONSTRAINT [PK_tb_order_detail] PRIMARY KEY CLUSTERED 
(
	[ID_orderDetails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Product]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Product](
	[ID_Product] [int] IDENTITY(1,1) NOT NULL,
	[Code_Product] [nvarchar](50) NULL,
	[Name_Product] [nvarchar](50) NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_tb_Product_1] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Sales]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Sales](
	[ID_Product] [int] IDENTITY(1,1) NOT NULL,
	[Code_Product] [nvarchar](50) NULL,
	[Name_Product] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [nchar](10) NOT NULL,
	[Total]  AS ([Price]*[Quantity]),
	[Date] [date] NOT NULL,
	[Employee] [nvarchar](50) NOT NULL,
	[Bill_No] [int] NOT NULL,
	[Customer] [nvarchar](50) NULL CONSTRAINT [DF_tb_Sales_Customer]  DEFAULT (N'Customer'),
 CONSTRAINT [PK_tb_Sales_1] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_SalesOrder]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SalesOrder](
	[ID_Product] [int] IDENTITY(1,1) NOT NULL,
	[Code_Product] [nvarchar](50) NULL,
	[Name_Product] [nvarchar](50) NOT NULL,
	[Price] [float] NULL,
	[Quantity] [nchar](10) NULL,
	[Total]  AS ([Price]*[Quantity]),
	[Date] [date] NOT NULL,
	[Employee] [nvarchar](50) NOT NULL,
	[Bill_No] [int] NOT NULL,
	[Customer] [nvarchar](50) NULL CONSTRAINT [DF_tb_SalesOrder_Customer]  DEFAULT (N'Customer'),
 CONSTRAINT [PK_tb_Sales] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Supplier]    Script Date: 11/12/2016 22:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Supplier](
	[ID_Supplier] [int] IDENTITY(1,1) NOT NULL,
	[Name_Supplier] [varchar](50) NOT NULL,
	[Store_Supplier] [varchar](50) NOT NULL,
	[Address_Supplier] [varchar](50) NOT NULL,
	[Tel_Supplier] [int] NULL,
 CONSTRAINT [PK_tb_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Product] ON 

INSERT [dbo].[tb_Product] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Description]) VALUES (10, NULL, N'Huawei', 21000, 200, N'China')
INSERT [dbo].[tb_Product] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Description]) VALUES (13, NULL, N'Xogo', 100, 2000, N'New')
INSERT [dbo].[tb_Product] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Description]) VALUES (15, NULL, N'Apple', 50000, 1010, N'U.S')
INSERT [dbo].[tb_Product] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Description]) VALUES (16, NULL, N'Nit', 756, 850, N'fghr')
SET IDENTITY_INSERT [dbo].[tb_Product] OFF
SET IDENTITY_INSERT [dbo].[tb_Sales] ON 

INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (1, NULL, N'2', 2, N'2         ', CAST(N'2016-11-24' AS Date), N'2', 1, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (9, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (10, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (11, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (12, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (13, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (14, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (15, NULL, N'Apple', 20000, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (16, NULL, N'Apple', 3, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (17, NULL, N'2', 1, N'2         ', CAST(N'2016-11-24' AS Date), N'2', 1, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (18, NULL, N'3', 2, N'3         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (19, NULL, N'Apple', 3, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (20, NULL, N'3', 1, N'3         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (21, NULL, N'Apple', 2, N'2         ', CAST(N'2016-11-25' AS Date), N'3', 3, N'Customer')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (22, NULL, N'Apple', 20000, N'20        ', CAST(N'2017-01-01' AS Date), N'001', 2, N'New')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (23, NULL, N'new Item', 45000, N'50        ', CAST(N'2017-01-01' AS Date), N'001', 2, N'New')
INSERT [dbo].[tb_Sales] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (24, NULL, N'new Item 2', 50000, N'50        ', CAST(N'2017-01-01' AS Date), N'001', 2, N'New')
SET IDENTITY_INSERT [dbo].[tb_Sales] OFF
SET IDENTITY_INSERT [dbo].[tb_SalesOrder] ON 

INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (39, NULL, N'000', 0, N'000       ', CAST(N'0001-01-01' AS Date), N'000', 0, N'000')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (40, NULL, N'Item', 10, N'100       ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (44, NULL, N'Item 2', 200, N'15        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (45, NULL, N'Oranges', 4500, N'50        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (46, NULL, N'Oranges', 85000, N'200       ', CAST(N'0001-01-01' AS Date), N'000', 0, N'000')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (49, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (50, NULL, N'x', 40, N'4         ', CAST(N'2017-01-01' AS Date), N'001', 3, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (51, NULL, N'Huaweix', 500, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (52, NULL, N'Huaweis', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (53, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (54, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (55, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (56, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (57, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (58, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (59, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (60, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (61, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (62, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (63, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (64, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (65, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (66, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (67, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (68, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (69, NULL, N'Huawei', 456, N'45        ', CAST(N'2017-01-01' AS Date), N'001', 0, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (70, NULL, N'New Item', 500, N'50        ', CAST(N'0001-01-01' AS Date), N'000', 0, N'000')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (71, NULL, N'new Item', 45000, N'50        ', CAST(N'2017-01-01' AS Date), N'001', 2, N'New')
INSERT [dbo].[tb_SalesOrder] ([ID_Product], [Code_Product], [Name_Product], [Price], [Quantity], [Date], [Employee], [Bill_No], [Customer]) VALUES (72, NULL, N'new Item 2', 50000, N'50        ', CAST(N'2017-01-01' AS Date), N'001', 2, N'New')
SET IDENTITY_INSERT [dbo].[tb_SalesOrder] OFF
SET IDENTITY_INSERT [dbo].[tb_Supplier] ON 

INSERT [dbo].[tb_Supplier] ([ID_Supplier], [Name_Supplier], [Store_Supplier], [Address_Supplier], [Tel_Supplier]) VALUES (1, N'New Supplier', N'Nittambuwa Stores', N'Nittambuwa', 1124564560)
INSERT [dbo].[tb_Supplier] ([ID_Supplier], [Name_Supplier], [Store_Supplier], [Address_Supplier], [Tel_Supplier]) VALUES (2, N'Sarath', N'Nandasiri Stores', N'Middle Earth', 456456)
INSERT [dbo].[tb_Supplier] ([ID_Supplier], [Name_Supplier], [Store_Supplier], [Address_Supplier], [Tel_Supplier]) VALUES (3, N'New Sarath', N'New Nandasiri Stores', N'New Middle Earth', 562465)
INSERT [dbo].[tb_Supplier] ([ID_Supplier], [Name_Supplier], [Store_Supplier], [Address_Supplier], [Tel_Supplier]) VALUES (4, N'Newest Sarath', N'Newest Sarath Stores', N'Newest Middle Earth', 654654)
SET IDENTITY_INSERT [dbo].[tb_Supplier] OFF
