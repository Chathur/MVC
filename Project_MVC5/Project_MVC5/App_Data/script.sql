USE [master]
GO
/****** Object:  Database [WICKRAMA_STORES]    Script Date: 1/8/2017 1:30:17 PM ******/
CREATE DATABASE [WICKRAMA_STORES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TactileWarehouseLimited', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Easify.mdf' , SIZE = 8256KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TactileWarehouseLimitedLog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Easify_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WICKRAMA_STORES] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WICKRAMA_STORES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WICKRAMA_STORES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET ARITHABORT OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WICKRAMA_STORES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WICKRAMA_STORES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WICKRAMA_STORES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WICKRAMA_STORES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WICKRAMA_STORES] SET  MULTI_USER 
GO
ALTER DATABASE [WICKRAMA_STORES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WICKRAMA_STORES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WICKRAMA_STORES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WICKRAMA_STORES] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WICKRAMA_STORES] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WICKRAMA_STORES', N'ON'
GO
USE [WICKRAMA_STORES]
GO
/****** Object:  Table [dbo].[ITEM_TYPES_LOOKUP]    Script Date: 1/8/2017 1:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_TYPES_LOOKUP](
	[TYPE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [nvarchar](50) NULL,
	[PRIVATE] [bit] NULL,
	[DefaultRetailMargin] [float] NULL,
	[DefaultTradeMargin] [float] NULL,
	[DefaultLoyaltyPoints] [int] NULL,
	[DefaultWeight] [float] NULL,
	[CategoryTypeId] [int] NOT NULL CONSTRAINT [DF_ITEM_TYPES_LOOKUP_CategoryTypeId]  DEFAULT ((1)),
 CONSTRAINT [PK_ITEM_TYPES_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[TYPE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEMS]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEMS](
	[StockId] [int] NOT NULL,
	[StockCode] [nvarchar](50) NOT NULL CONSTRAINT [DF_ITEM_StockCode]  DEFAULT (NULL),
	[Name_Item] [nvarchar](50) NOT NULL CONSTRAINT [DF_ITEM_Name_Item]  DEFAULT (NULL),
	[Type_Id] [int] NULL,
	[Type] [nvarchar](50) NOT NULL CONSTRAINT [DF_ITEM_Type]  DEFAULT (NULL),
	[COST_PRICE] [float] NOT NULL CONSTRAINT [DF_ITEM_COST_PRICE]  DEFAULT ((0)),
	[STOCK_LEVEL] [int] NOT NULL CONSTRAINT [DF_ITEM_STOCK_LEVEL]  DEFAULT ((0)),
	[MIN_MIN_STOCK_LEVEL] [int] NULL,
	[VendorId] [int] NULL,
	[Vendor_Name] [nvarchar](50) NOT NULL CONSTRAINT [DF_ITEM_Vendor_Name]  DEFAULT (NULL),
	[Retail_Margin] [float] NOT NULL CONSTRAINT [DF_ITEM_Retail_Margin]  DEFAULT ((0)),
	[Trade_Margin] [float] NOT NULL CONSTRAINT [DF_ITEM_Trade_Margin]  DEFAULT ((0)),
	[Add_Quantity] [float] NULL,
 CONSTRAINT [PK_ITEM] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEMSS]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEMSS](
	[StockId] [int] IDENTITY(100000,1) NOT NULL,
	[StockCode] [nvarchar](50) NULL,
	[Name_Item] [nvarchar](255) NOT NULL,
	[TYPE_ID] [int] NULL,
	[COST_PRICE] [float] NULL,
	[STOCK_LEVEL] [int] NULL CONSTRAINT [DF_ITEMS_STOCK_LEVEL]  DEFAULT ((0)),
	[MIN_STOCK_LEVEL] [int] NULL,
	[PRICE_CHANGE_DATE] [datetime] NULL,
	[ReorderWhenLow] [bit] NOT NULL,
	[VendorId] [int] NULL,
	[Vendor_Name] [varchar](50) NULL,
	[Retail_Margin] [float] NULL,
	[Trade_Margin] [float] NULL,
	[ItemTypeId] [int] NOT NULL CONSTRAINT [DF_ITEMS_ItemTypeId]  DEFAULT ((1)),
	[Add_Quantity] [float] NULL,
 CONSTRAINT [PK_ITEMS] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ItemTypes](
	[ItemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ItemTypes] PRIMARY KEY CLUSTERED 
(
	[ItemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Job]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[job_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[route_id] [int] NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MANUFACTURER_LOOKUP]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUFACTURER_LOOKUP](
	[MAUN_ID] [int] IDENTITY(1,1) NOT NULL,
	[MANUFACTURER_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_MANUFACTURER_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[MAUN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_STATUS_LOOKUP]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_STATUS_LOOKUP](
	[STATUS_ID] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_STATUS] [nvarchar](50) NOT NULL,
	[OrderStatusTypeId] [int] NOT NULL,
	[System] [bit] NOT NULL,
	[DefaultType] [bit] NOT NULL,
 CONSTRAINT [PK_ORDER_STATUS_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[STATUS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderElementsStatusLookup]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderElementsStatusLookup](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderElementStatus] [nvarchar](50) NULL,
	[ItemOrder] [int] NULL,
 CONSTRAINT [PK_OrderElementsStatusLookup] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderPayments]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPayments](
	[OrderPaymentsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[CashAmount] [money] NULL,
	[CardAmount] [money] NULL,
	[ChequeAmount] [money] NULL,
	[OtherAmount] [money] NULL,
	[DatePaid] [smalldatetime] NULL,
	[TakenBy] [int] NULL,
 CONSTRAINT [PK_OrderPayments] PRIMARY KEY CLUSTERED 
(
	[OrderPaymentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDER_NO] [int] IDENTITY(100000,1) NOT NULL,
	[CUSTOMER] [int] NOT NULL,
	[DATE_PLACED] [date] NOT NULL,
	[Route] [int] NOT NULL,
	[PAID] [bit] NULL,
	[Employee] [nvarchar](50) NOT NULL,
	[INVOICED] [bit] NULL,
	[DATE_INVOICED] [smalldatetime] NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[DATE_ORDERED] [smalldatetime] NULL,
	[DATE_PAID] [smalldatetime] NULL,
	[PrivateComments] [ntext] NULL,
	[DueDate] [datetime] NULL,
	[DueTime] [datetime] NULL,
	[Scheduled] [bit] NULL,
	[Duration] [decimal](18, 0) NULL,
	[Priority] [int] NULL,
	[Recurring] [bit] NULL,
	[RecurrTimePeriod] [int] NULL,
	[RaisedBy] [int] NULL,
	[UseTradeMargins] [bit] NULL,
	[InterestFreeCredit] [bit] NULL,
	[AssignedTo] [int] NULL,
	[DueDate2] [datetime] NULL,
	[DueTime2] [datetime] NULL,
	[DueDuration2] [decimal](18, 0) NULL,
	[OrderType] [int] NULL,
	[LastModified] [datetime] NULL,
	[ExtOrderNo] [varchar](50) NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[ORDER_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderStatusTypeLookup]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatusTypeLookup](
	[OrderStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatusTypeLookup] PRIMARY KEY CLUSTERED 
(
	[OrderStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTypes](
	[OrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderTypes] PRIMARY KEY CLUSTERED 
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentAccountAccountantTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentAccountAccountantTypes](
	[AccountAccountantTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AccountantDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentAccountAccountantTypes] PRIMARY KEY CLUSTERED 
(
	[AccountAccountantTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentAccountHumanTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentAccountHumanTypes](
	[AccountHumanTypeId] [int] IDENTITY(1,1) NOT NULL,
	[HumanDescription] [varchar](50) NULL,
	[AccountantAccountType] [int] NULL,
	[IsPhysicalAccount] [bit] NULL,
	[ReadOnly] [bit] NULL,
 CONSTRAINT [PK_PaymentAccountHumanTypes] PRIMARY KEY CLUSTERED 
(
	[AccountHumanTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentAccounts]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentAccounts](
	[PaymentAccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountDescription] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[OpeningBalance] [money] NULL,
 CONSTRAINT [PK_PaymentAccounts] PRIMARY KEY CLUSTERED 
(
	[PaymentAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentCardTransactions]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentCardTransactions](
	[CardTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentGatewayProviderId] [int] NULL,
	[PaymentGatewayTransactionRef] [varchar](255) NULL,
	[Comments] [varchar](255) NULL,
	[PaymentId] [int] NULL,
	[TransactionDate] [datetime] NULL,
 CONSTRAINT [PK_PaymentCardTransactions] PRIMARY KEY CLUSTERED 
(
	[CardTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodsId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[PaymentMethodType] [int] NULL,
	[ShowInPOS] [bit] NULL,
	[RowOrder] [int] NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentMethodTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentMethodTypes](
	[PaymentMethodTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_PaymentMethodTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentAccountId] [int] NOT NULL,
	[TransactionRef] [varchar](50) NULL,
	[PaymentMethodId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Reconciled] [bit] NULL,
	[ReconciledDate] [datetime] NULL,
	[PaymentTypeId] [int] NULL,
	[OurRef] [int] NULL,
	[Comments] [varchar](255) NULL,
	[MoneyIn] [money] NULL,
	[MoneyOut] [money] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentsSagePayCardTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentsSagePayCardTypes](
	[CardTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CardTypeMnemonic] [varchar](50) NOT NULL,
	[CardTypeDescription] [varchar](50) NULL,
 CONSTRAINT [PK_PaymentsSagePayCardTypes] PRIMARY KEY CLUSTERED 
(
	[CardTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentTerms]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentTerms](
	[PaymentTermsId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[PaymentDays] [int] NOT NULL,
 CONSTRAINT [PK_PaymentTerms] PRIMARY KEY CLUSTERED 
(
	[PaymentTermsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentTransfers]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentTransfers](
	[PaymentTransfersId] [int] IDENTITY(900000,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[TransferDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PaymentTransfers] PRIMARY KEY CLUSTERED 
(
	[PaymentTransfersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PaymentTypes](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ProductInfo](
	[ProductInfoId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varbinary](max) NULL,
	[Description] [varchar](max) NULL,
	[SKU] [int] NOT NULL,
 CONSTRAINT [PK_ProductInfo] PRIMARY KEY CLUSTERED 
(
	[ProductInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductLocations]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ProductLocations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ProductLocations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductsAllocatedToOrders]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsAllocatedToOrders](
	[Sku] [int] NOT NULL,
	[OrderDetailsId] [int] NOT NULL,
	[QtyAllocated] [int] NOT NULL,
 CONSTRAINT [PK_ProductsAllocatedToOrders] PRIMARY KEY CLUSTERED 
(
	[Sku] ASC,
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PurchaseDetails](
	[PurchaseDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseId] [int] NULL,
	[Description] [varchar](255) NOT NULL,
	[OurSku] [varchar](50) NULL,
	[OurOrderNo] [int] NULL,
	[SupplierSku] [varchar](50) NULL,
	[Qty] [int] NULL,
	[PriceEach] [money] NULL,
	[VatRate] [float] NULL,
	[VatId] [int] NULL,
	[Received] [bit] NULL,
 CONSTRAINT [PK_PurchaseDetails] PRIMARY KEY CLUSTERED 
(
	[PurchaseDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Purchases](
	[PurchaseId] [int] IDENTITY(500000,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateOrdered] [datetime] NULL,
	[DateReceived] [datetime] NULL,
	[DateInvoiced] [datetime] NULL,
	[DateRequired] [datetime] NULL,
	[DateExpected] [datetime] NULL,
	[DatePaymentDue] [datetime] NULL,
	[DatePaid] [datetime] NULL,
	[Paid] [bit] NULL,
	[UserId] [int] NOT NULL,
	[Comments] [varchar](255) NULL,
	[PurchaseStatusId] [int] NULL,
	[SupplierId] [int] NULL,
	[SupplierRef] [varchar](50) NULL,
	[SupplierInvoiceNo] [varchar](50) NULL,
	[PurchaseTypeId] [int] NULL,
	[Tax] [money] NULL,
	[NotesToSupplier] [text] NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseStatus]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PurchaseStatus](
	[PurchaseStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[ItemOrder] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseStatus] PRIMARY KEY CLUSTERED 
(
	[PurchaseStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseTypes]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PurchaseTypes](
	[PurchaseTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PurchaseTypes] PRIMARY KEY CLUSTERED 
(
	[PurchaseTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Route]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[Route_id] [int] IDENTITY(1,1) NOT NULL,
	[Route_desc] [nchar](50) NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[Route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sales]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[sales_id] [int] NOT NULL,
	[sales_order_id] [int] NOT NULL,
	[Delivered_Date] [date] NOT NULL,
	[Total_Cost] [money] NOT NULL,
	[Paid] [bit] NULL,
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sales_order_detail]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_order_detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[sales_order_id] [int] NULL,
	[item_id] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Discount] [money] NULL,
 CONSTRAINT [PK_tb_order_detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUB_ITEM_TYPES_LOOKUP]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUB_ITEM_TYPES_LOOKUP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SUB_TYPE] [nvarchar](50) NULL,
	[PARENT_TYPE_ID] [int] NULL,
	[Published] [bit] NULL,
	[DefaultRetailMargin] [float] NULL,
	[DefaultTradeMargin] [float] NULL,
	[DefaultLoyaltyPoints] [int] NULL,
	[DefaultWeight] [float] NULL,
	[CategoryTypeId] [int] NOT NULL CONSTRAINT [DF_SUB_ITEM_TYPES_LOOKUP_CategoryTypeId]  DEFAULT ((1)),
 CONSTRAINT [PK_SUB_ITEM_TYPES_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxRates]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaxRates](
	[TaxId] [int] IDENTITY(1,1) NOT NULL,
	[TaxCode] [char](3) NOT NULL,
	[TaxRate] [float] NOT NULL,
	[TaxDescription] [varchar](20) NULL,
	[IsDefaultTaxCode] [bit] NOT NULL CONSTRAINT [DF_TaxRates_IsDefaultTaxCode]  DEFAULT ((0)),
 CONSTRAINT [PK_TaxRates] PRIMARY KEY CLUSTERED 
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Cart]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Cart](
	[ITEM_ID] [int] IDENTITY(1,1) NOT NULL,
	[STOCK_CODE] [int] NULL,
	[QUANTITY] [real] NULL,
	[ORDER_NO] [int] NULL,
	[UNIT_PRICE] [float] NOT NULL,
	[BUY_PRICE] [float] NOT NULL,
	[StatusId] [int] NULL,
	[Total]  AS ([UNIT_PRICE]*[Quantity]),
	[Name_Product] [nvarchar](50) NULL,
	[Bill_No] [int] NULL,
	[Route] [nvarchar](50) NULL,
	[sales_id] [nchar](10) NULL,
	[Discount] [nchar](10) NULL,
	[Code_Product] [nchar](10) NULL,
 CONSTRAINT [PK_ORDER_ELEMENTS] PRIMARY KEY CLUSTERED 
(
	[ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Customer]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Customer](
	[ID_Customer] [int] IDENTITY(1,1) NOT NULL,
	[Name_Customer] [nvarchar](50) NOT NULL,
	[Address_Customer] [nvarchar](50) NULL CONSTRAINT [DF_tb_Customer_Address_Customer]  DEFAULT ((0)),
	[Email] [nvarchar](50) NULL,
	[CreditLimit] [money] NULL,
	[Tel_Customer] [nchar](10) NULL,
	[Route_Customer] [int] NOT NULL CONSTRAINT [DF_tb_Customer_Route_Customer]  DEFAULT ((0)),
 CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED 
(
	[ID_Customer] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Employee]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Employee](
	[ID_Employee] [nvarchar](50) NOT NULL,
	[Name_Employee] [nchar](50) NOT NULL,
	[Address_Employee] [nchar](150) NOT NULL,
	[Tel_Employee] [nchar](10) NOT NULL,
	[email] [nchar](50) NULL,
	[Job_tile] [nchar](50) NOT NULL,
	[Salary] [nchar](10) NOT NULL,
	[Joining_Date] [nchar](10) NOT NULL,
	[user_id] [nchar](10) NULL,
	[Still_working] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Sales]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Sales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[sales_id] [int] NULL,
	[item_id] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [money] NOT NULL,
	[Code_Product] [nvarchar](50) NOT NULL,
	[Name_Product] [nvarchar](50) NOT NULL,
	[Total]  AS ([Price]*[Quantity]),
	[Date] [date] NOT NULL,
	[Employee] [nvarchar](50) NOT NULL,
	[Bill_No] [int] NOT NULL,
	[Customer] [nvarchar](50) NOT NULL,
	[Route] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_sales_detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_SalesOrder]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SalesOrder](
	[Sales_order_id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [nvarchar](50) NOT NULL,
	[Delivery_date] [date] NULL,
	[Customer] [nvarchar](50) NOT NULL,
	[Bill_No] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[item_id] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [money] NULL,
	[Code_Product] [nvarchar](50) NOT NULL,
	[Name_Product] [nvarchar](50) NOT NULL,
	[Total]  AS ([Price]*[Quantity]),
	[Route] [nvarchar](50) NULL,
 CONSTRAINT [PK_sales_order] PRIMARY KEY CLUSTERED 
(
	[Sales_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Supplier]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Supplier](
	[ID_Supplier] [int] IDENTITY(1,1) NOT NULL,
	[Name_Supplier] [nvarchar](50) NOT NULL,
	[Store_Supplier] [nvarchar](50) NULL,
	[Address_Supplier] [nvarchar](50) NULL,
	[ADDRESS_3] [nvarchar](50) NULL,
	[TOWN] [nvarchar](50) NULL,
	[COUNTY] [nvarchar](50) NULL,
	[POST_CODE] [nvarchar](10) NULL,
	[COUNTRY] [nvarchar](50) NULL,
	[Tel_Supplier] [nvarchar](20) NULL,
	[FAX_NO] [nvarchar](20) NULL,
	[CONTACT_NAME] [nvarchar](50) NULL,
	[CONTACT_TEL] [nvarchar](20) NULL,
	[CONTACT_FAX] [nvarchar](20) NULL,
	[CONTACT_EMAIL] [nvarchar](50) NULL,
	[WEB_ADDRESS] [nvarchar](50) NULL,
	[ACCOUNT_NO] [nvarchar](20) NULL,
	[CREDIT_ACCOUNT] [bit] NULL,
	[NOTES] [ntext] NULL,
	[CreditLimit] [money] NULL,
	[PaymentTermsId] [int] NULL,
 CONSTRAINT [PK_VENDORS] PRIMARY KEY CLUSTERED 
(
	[ID_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Users_Active]  DEFAULT ((0)),
	[Employee_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersPermissions]    Script Date: 1/8/2017 1:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersPermissions](
	[UserId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_UsersPermissions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ITEM_TYPES_LOOKUP] ON 

INSERT [dbo].[ITEM_TYPES_LOOKUP] ([TYPE_ID], [TYPE], [PRIVATE], [DefaultRetailMargin], [DefaultTradeMargin], [DefaultLoyaltyPoints], [DefaultWeight], [CategoryTypeId]) VALUES (-100, N'Discounts', NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[ITEM_TYPES_LOOKUP] ([TYPE_ID], [TYPE], [PRIVATE], [DefaultRetailMargin], [DefaultTradeMargin], [DefaultLoyaltyPoints], [DefaultWeight], [CategoryTypeId]) VALUES (1, N'Milk', 0, 0, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ITEM_TYPES_LOOKUP] OFF
INSERT [dbo].[ITEMS] ([StockId], [StockCode], [Name_Item], [Type_Id], [Type], [COST_PRICE], [STOCK_LEVEL], [MIN_MIN_STOCK_LEVEL], [VendorId], [Vendor_Name], [Retail_Margin], [Trade_Margin], [Add_Quantity]) VALUES (0, N'Nw 01', N'New Item', NULL, N'New', 150, 50, NULL, NULL, N'New Supp', 200, 205, 10)
SET IDENTITY_INSERT [dbo].[ITEMSS] ON 

INSERT [dbo].[ITEMSS] ([StockId], [StockCode], [Name_Item], [TYPE_ID], [COST_PRICE], [STOCK_LEVEL], [MIN_STOCK_LEVEL], [PRICE_CHANGE_DATE], [ReorderWhenLow], [VendorId], [Vendor_Name], [Retail_Margin], [Trade_Margin], [ItemTypeId], [Add_Quantity]) VALUES (-100, N'', N'Loyalty Points Discount', -100, NULL, NULL, NULL, NULL, 0, -100, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[ITEMSS] ([StockId], [StockCode], [Name_Item], [TYPE_ID], [COST_PRICE], [STOCK_LEVEL], [MIN_STOCK_LEVEL], [PRICE_CHANGE_DATE], [ReorderWhenLow], [VendorId], [Vendor_Name], [Retail_Margin], [Trade_Margin], [ItemTypeId], [Add_Quantity]) VALUES (100000, N'', N'Vanilla Milk', 1, 0, 20, 0, CAST(N'2016-10-13 13:33:35.857' AS DateTime), 0, 1, NULL, 0, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[ITEMSS] OFF
SET IDENTITY_INSERT [dbo].[ItemTypes] ON 

INSERT [dbo].[ItemTypes] ([ItemTypeId], [ItemType]) VALUES (1, N'Standard')
INSERT [dbo].[ItemTypes] ([ItemTypeId], [ItemType]) VALUES (2, N'Loyalty Points')
SET IDENTITY_INSERT [dbo].[ItemTypes] OFF
SET IDENTITY_INSERT [dbo].[MANUFACTURER_LOOKUP] ON 

INSERT [dbo].[MANUFACTURER_LOOKUP] ([MAUN_ID], [MANUFACTURER_NAME]) VALUES (-100, N'')
INSERT [dbo].[MANUFACTURER_LOOKUP] ([MAUN_ID], [MANUFACTURER_NAME]) VALUES (1, N'Nestle')
SET IDENTITY_INSERT [dbo].[MANUFACTURER_LOOKUP] OFF
SET IDENTITY_INSERT [dbo].[ORDER_STATUS_LOOKUP] ON 

INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (1, N'Delivery', 2, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (2, N'Awaiting Parts', 2, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (3, N'Build', 2, 0, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (4, N'In Test', 2, 0, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (5, N'Design', 2, 0, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (6, N'Complete', 4, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (7, N'Quote Completed', 1, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (8, N'On hold', 3, 0, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (9, N'Cancelled', 3, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (10, N'In Progress', 2, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (11, N'New Order', 2, 1, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (12, N'Scheduled', 2, 0, 0)
INSERT [dbo].[ORDER_STATUS_LOOKUP] ([STATUS_ID], [ORDER_STATUS], [OrderStatusTypeId], [System], [DefaultType]) VALUES (13, N'Quote In Progress', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ORDER_STATUS_LOOKUP] OFF
SET IDENTITY_INSERT [dbo].[OrderElementsStatusLookup] ON 

INSERT [dbo].[OrderElementsStatusLookup] ([StatusId], [OrderElementStatus], [ItemOrder]) VALUES (1, N'Picking', 20)
INSERT [dbo].[OrderElementsStatusLookup] ([StatusId], [OrderElementStatus], [ItemOrder]) VALUES (3, N'On Order', 10)
INSERT [dbo].[OrderElementsStatusLookup] ([StatusId], [OrderElementStatus], [ItemOrder]) VALUES (4, N'Waiting to Go', 40)
INSERT [dbo].[OrderElementsStatusLookup] ([StatusId], [OrderElementStatus], [ItemOrder]) VALUES (5, N'Delivered', 50)
INSERT [dbo].[OrderElementsStatusLookup] ([StatusId], [OrderElementStatus], [ItemOrder]) VALUES (6, N'Purchasing', 5)
INSERT [dbo].[OrderElementsStatusLookup] ([StatusId], [OrderElementStatus], [ItemOrder]) VALUES (7, N'Returned', 60)
SET IDENTITY_INSERT [dbo].[OrderElementsStatusLookup] OFF
SET IDENTITY_INSERT [dbo].[OrderStatusTypeLookup] ON 

INSERT [dbo].[OrderStatusTypeLookup] ([OrderStatusTypeId], [OrderStatusType]) VALUES (1, N'Quote')
INSERT [dbo].[OrderStatusTypeLookup] ([OrderStatusTypeId], [OrderStatusType]) VALUES (2, N'Active')
INSERT [dbo].[OrderStatusTypeLookup] ([OrderStatusTypeId], [OrderStatusType]) VALUES (3, N'Inactive')
INSERT [dbo].[OrderStatusTypeLookup] ([OrderStatusTypeId], [OrderStatusType]) VALUES (4, N'Complete')
SET IDENTITY_INSERT [dbo].[OrderStatusTypeLookup] OFF
SET IDENTITY_INSERT [dbo].[OrderTypes] ON 

INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (1, N'Shop')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (2, N'Warranty')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (3, N'Business')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (4, N'Home')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (5, N'Internet')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (6, N'Commission')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (7, N'Telephone')
INSERT [dbo].[OrderTypes] ([OrderTypeId], [Description]) VALUES (8, N'Mail')
SET IDENTITY_INSERT [dbo].[OrderTypes] OFF
SET IDENTITY_INSERT [dbo].[PaymentAccountAccountantTypes] ON 

INSERT [dbo].[PaymentAccountAccountantTypes] ([AccountAccountantTypeId], [AccountantDescription]) VALUES (1, N'Asset')
INSERT [dbo].[PaymentAccountAccountantTypes] ([AccountAccountantTypeId], [AccountantDescription]) VALUES (2, N'Liability')
INSERT [dbo].[PaymentAccountAccountantTypes] ([AccountAccountantTypeId], [AccountantDescription]) VALUES (3, N'Equity')
INSERT [dbo].[PaymentAccountAccountantTypes] ([AccountAccountantTypeId], [AccountantDescription]) VALUES (4, N'Income')
INSERT [dbo].[PaymentAccountAccountantTypes] ([AccountAccountantTypeId], [AccountantDescription]) VALUES (5, N'Expense')
SET IDENTITY_INSERT [dbo].[PaymentAccountAccountantTypes] OFF
SET IDENTITY_INSERT [dbo].[PaymentAccountHumanTypes] ON 

INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (1, N'Bank Account – Current', 1, 0, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (2, N'Bank Account – Loan', 2, 0, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (3, N'Bank Account – Savings', 1, 0, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (4, N'Cash Account', 1, 0, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (5, N'Cashbox / Safe', 1, 1, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (6, N'Till', 1, 1, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (7, N'Credit Card Account', 2, 0, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (8, N'Owners Investments', 3, 0, 0)
INSERT [dbo].[PaymentAccountHumanTypes] ([AccountHumanTypeId], [HumanDescription], [AccountantAccountType], [IsPhysicalAccount], [ReadOnly]) VALUES (9, N'Expense Account', 5, 0, 0)
SET IDENTITY_INSERT [dbo].[PaymentAccountHumanTypes] OFF
SET IDENTITY_INSERT [dbo].[PaymentAccounts] ON 

INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (1, N'Current', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (2, N'Cash', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (3, N'Business Credit Card', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (4, N'Money Loaned by Owner', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (5, N'Cashbox', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (6, N'Discrepancies', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (7, N'PayPal', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (8, N'Business Loan', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (9, N'Business Savings', 1, 0.0000)
INSERT [dbo].[PaymentAccounts] ([PaymentAccountId], [AccountDescription], [Active], [OpeningBalance]) VALUES (10, N'Till 1', 1, 0.0000)
SET IDENTITY_INSERT [dbo].[PaymentAccounts] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (1, N'Cash', 1, 1, 1, 10)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (2, N'Cheque', 1, 3, 1, 20)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (3, N'Bank Transfer', 1, 4, 0, 50)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (4, N'Direct Debit', 1, 4, 0, 60)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (5, N'Standing Order', 1, 4, 0, 70)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (6, N'Debit Card', 1, 2, 0, 80)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (7, N'Credit Card', 1, 2, 1, 30)
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [PaymentMethod], [Active], [PaymentMethodType], [ShowInPOS], [RowOrder]) VALUES (8, N'Other', 1, 4, 1, 40)
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethodTypes] ON 

INSERT [dbo].[PaymentMethodTypes] ([PaymentMethodTypeId], [Description]) VALUES (1, N'Cash')
INSERT [dbo].[PaymentMethodTypes] ([PaymentMethodTypeId], [Description]) VALUES (2, N'Card')
INSERT [dbo].[PaymentMethodTypes] ([PaymentMethodTypeId], [Description]) VALUES (3, N'Cheque')
INSERT [dbo].[PaymentMethodTypes] ([PaymentMethodTypeId], [Description]) VALUES (4, N'Other')
SET IDENTITY_INSERT [dbo].[PaymentMethodTypes] OFF
SET IDENTITY_INSERT [dbo].[PaymentsSagePayCardTypes] ON 

INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (1, N'NONE', NULL)
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (2, N'MC', N'Mastercard')
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (3, N'MAESTRO', N'Maestro')
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (4, N'VISA', N'Visa')
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (5, N'DELTA', N'Visa Debit / Delta')
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (6, N'SOLO', N'Solo')
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (7, N'JCB', N'JCB')
INSERT [dbo].[PaymentsSagePayCardTypes] ([CardTypeId], [CardTypeMnemonic], [CardTypeDescription]) VALUES (8, N'UKE', N'Visa Electron')
SET IDENTITY_INSERT [dbo].[PaymentsSagePayCardTypes] OFF
SET IDENTITY_INSERT [dbo].[PaymentTerms] ON 

INSERT [dbo].[PaymentTerms] ([PaymentTermsId], [Description], [PaymentDays]) VALUES (1, N'Pro Forma', 0)
INSERT [dbo].[PaymentTerms] ([PaymentTermsId], [Description], [PaymentDays]) VALUES (2, N'30 Days', 30)
SET IDENTITY_INSERT [dbo].[PaymentTerms] OFF
SET IDENTITY_INSERT [dbo].[PaymentTypes] ON 

INSERT [dbo].[PaymentTypes] ([PaymentTypeId], [Description]) VALUES (1, N'Sale')
INSERT [dbo].[PaymentTypes] ([PaymentTypeId], [Description]) VALUES (2, N'Purchase')
INSERT [dbo].[PaymentTypes] ([PaymentTypeId], [Description]) VALUES (3, N'Transfer')
SET IDENTITY_INSERT [dbo].[PaymentTypes] OFF
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (1, N'User can access the accounting system')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (2, N'User is allowed to manage other users logins')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (3, N'User can debug system')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (4, N'User can view product sales history')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (5, N'User can upload updates to website')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (6, N'User is allowed to run automated price checks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (7, N'User can edit manufacturers')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (8, N'User can access the Knowledgebase')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (9, N'User can access the customers screen')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (10, N'User can access the orders screen')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (11, N'User can access the EPOS system')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (12, N'User can access the Products screen')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (13, N'User can access suppliers screen')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (14, N'User can delete Knowledgebase articles')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (15, N'User is allowed to access the options menu')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (16, N'User can change VAT Settings')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (17, N'User is allowed to access the options menu EPOS tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (18, N'User is allowed to access the options menu Quotes & Invoices tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (19, N'User is allowed to access the options menu Email Notifications tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (20, N'User is allowed to backup the Easify database')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (21, N'User is allowed to restore Easify from a backup')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (22, N'User is allowed to view history event log')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (23, N'User is allowed to access the options menu Products tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (24, N'User is allowed to export customers')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (25, N'User is allowed to change customer account terms, trade & credit.')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (26, N'User is allowed to access the options menu Payment Terms tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (27, N'User is allowed to access the purchasing screen.')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (28, N'User is allowed to access the options menu Purchasing tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (29, N'User is allowed to access the options menu Order Types tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (30, N'User is allowed to export sales data')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (31, N'User is allowed to export purchase data')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (32, N'User is allowed to import product data')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (33, N'User is allowed to import customers')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (34, N'User is allowed to access the options menu Default Margins tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (35, N'User is allowed to open the till by pressing Ctrl+O')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (36, N'User is allowed give discounts via POS F6')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (37, N'User is allowed access to the End of Day (Z) Report')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (38, N'User can view the SKU column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (39, N'User can view the Our SKU column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (40, N'User can view the Manufacturer SKU column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (41, N'User can view the Supplier SKU column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (42, N'User can view the EAN column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (43, N'User can view the Manufacturer column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (44, N'User can view the Category column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (45, N'User can view the Subcategory column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (46, N'User can view the Description column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (47, N'User can view the Supplier column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (48, N'User can view the Cost Price column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (49, N'User can view the Retail Margin column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (50, N'User can view the Retail Price column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (51, N'User can view the Inc. VAT Price column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (52, N'User can view the Trade Margin column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (53, N'User can view the Trade Price column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (54, N'User can view the Alloc/Free column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (55, N'User can view the On Hand column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (56, N'User can view the Min Stock Level column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (57, N'User can view the Reorder When Low column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (58, N'User can view the Reorder Qty column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (59, N'User can view the Info column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (60, N'User can view the Last Priced column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (61, N'User can view the Published column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (62, N'User can view the Notes column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (63, N'User can view the Order No column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (64, N'User can view the Date Raised column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (65, N'User can view the Date Ordered column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (66, N'User can view the Company column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (67, N'User can view the Firstname column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (68, N'User can view the Surname column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (69, N'User can view the Status column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (70, N'User can view the Date Due column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (71, N'User can view the Order Type column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (72, N'User can view the Comments column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (73, N'User can view the Paid column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (74, N'User can view the Invoiced column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (75, N'User can view the Date Invoiced column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (76, N'User can view the Date Paid column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (77, N'User can view the Net Value column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (78, N'User can view the Time Due column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (79, N'User can view the Scheduled column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (80, N'User can view the Duration column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (81, N'User can view the VAT Value column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (82, N'User can view the Gross Value column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (83, N'User can view the Purchase No column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (84, N'User can view the Date Created column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (85, N'User can view the Date Ordered column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (86, N'User can view the Date Received column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (87, N'User can view the Date Invoiced column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (88, N'User can view the Date Required column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (89, N'User can view the Date Expected column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (90, N'User can view the Date Payment Due column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (91, N'User can view the Date Paid column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (92, N'User can view the Paid column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (93, N'User can view the Comments column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (94, N'User can view the Status column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (95, N'User can view the Supplier column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (96, N'User can view the Supplier Ref column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (97, N'User can view the Supplier Invoice No column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (98, N'User can view the Purchase Type column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (99, N'User can view the Payment Terms column')
GO
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (100, N'User can view the Notes to Supplier column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (101, N'User can view the Net Value column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (102, N'User can view the VAT Value column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (103, N'User can view the Gross Value column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (104, N'User is allowed to access the options menu Customers tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (105, N'User is allowed to use Advanced Payments for orders')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (106, N'User can view the Customer No. column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (107, N'User can view the Title column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (108, N'User can view the First Name column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (109, N'User can view the Surname column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (110, N'User can view the Company column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (111, N'User can view the Department column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (112, N'User can view the Job Title column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (113, N'User can view the Work Tel column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (114, N'User can view the Home Tel column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (115, N'User can view the Mobile column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (116, N'User can view the Other Tel column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (117, N'User can view the Fax column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (118, N'User can view the Email column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (119, N'User can view the Address 1 column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (120, N'User can view the Address 2 column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (121, N'User can view the Address 3 column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (122, N'User can view the Town column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (123, N'User can view the County column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (124, N'User can view the Postcode column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (125, N'User can view the Country column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (126, N'User can view the Relationship column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (127, N'User can view the Type column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (128, N'User can view the Newsletter column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (129, N'User can view the Del Title column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (130, N'User can view the Del First Name column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (131, N'User can view the Del Surname column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (132, N'User can view the Del Job Title column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (133, N'User can view the Del Department column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (134, N'User can view the Del Company column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (135, N'User can view the Del Tel column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (136, N'User can view the Del Email column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (137, N'User can view the Del Address 1 column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (138, N'User can view the Del Address 2 column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (139, N'User can view the Del Address 3 column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (140, N'User can view the Del Town column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (141, N'User can view the Del County column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (142, N'User can view the Del Postcode column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (143, N'User can view the Del Country column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (144, N'User can view the Payment Terms column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (145, N'User can view the Credit Limit column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (146, N'User can view the Trade Account column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (147, N'User can view the Notes column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (148, N'User can access production reports')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (149, N'User is allowed to move orders to completed status')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (150, N'User is allowed to set purchases to received status')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (151, N'User is allowed to access the options menu General tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (152, N'User is allowed to access the options menu Finance tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (153, N'User is allowed to access the options menu Document Management tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (154, N'User is allowed to access the options menu Advanced Server Settings tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (155, N'User is allowed to access the options menu Order Statuses tab')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (156, N'User is allowed to schedule orders, purchases & backups')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (157, N'User is allowed to create backup tasks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (158, N'User is allowed to edit backup tasks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (159, N'User is allowed to create orders & quotes tasks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (160, N'User is allowed to edit orders & quotes tasks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (161, N'User is allowed to create purchases tasks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (162, N'User is allowed to edit purchases tasks')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (163, N'User is allowed to edit the product location list')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (164, N'User can view the Weight column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (165, N'User can view the Location column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (166, N'User can use the PaperworkDesigner')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (167, N'User is allowed to export product data')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (168, N'User is allowed to export all transactions')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (169, N'User is allowed to create/edit/delete stock items')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (170, N'User can view/print Customer - Statement')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (171, N'User can view/print Product - Price Label 50mm x 25mm')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (172, N'User can view/print Purchase - Purchase Order')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (173, N'User can view/print Customer - Envelope DL')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (174, N'User can view/print Order - Invoice')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (175, N'User can view/print Order - Quote')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (176, N'User can view/print Order - Estimate')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (177, N'User can view/print Order - Delivery Note')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (178, N'User can view/print Order - Job Card')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (179, N'User can view the Loyalty Points column')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (180, N'User can view ECommerce Channel Manager')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (181, N'User can manage/edit ECommerce Channels')
INSERT [dbo].[Permissions] ([PermissionId], [Description]) VALUES (182, N'User can edit this Easify Server via Easify Connection Manager')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
SET IDENTITY_INSERT [dbo].[ProductLocations] ON 

INSERT [dbo].[ProductLocations] ([LocationId], [Description]) VALUES (-1, N'')
SET IDENTITY_INSERT [dbo].[ProductLocations] OFF
INSERT [dbo].[ProductsAllocatedToOrders] ([Sku], [OrderDetailsId], [QtyAllocated]) VALUES (100000, 1, 2)
INSERT [dbo].[ProductsAllocatedToOrders] ([Sku], [OrderDetailsId], [QtyAllocated]) VALUES (100000, 2, 1)
SET IDENTITY_INSERT [dbo].[PurchaseStatus] ON 

INSERT [dbo].[PurchaseStatus] ([PurchaseStatusId], [Description], [ItemOrder]) VALUES (1, N'Cancelled', 10)
INSERT [dbo].[PurchaseStatus] ([PurchaseStatusId], [Description], [ItemOrder]) VALUES (2, N'In Progress', 20)
INSERT [dbo].[PurchaseStatus] ([PurchaseStatusId], [Description], [ItemOrder]) VALUES (3, N'On Order', 30)
INSERT [dbo].[PurchaseStatus] ([PurchaseStatusId], [Description], [ItemOrder]) VALUES (4, N'Received', 40)
SET IDENTITY_INSERT [dbo].[PurchaseStatus] OFF
SET IDENTITY_INSERT [dbo].[PurchaseTypes] ON 

INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (1, N'Employee Costs')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (2, N'Premises Costs')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (3, N'Repairs Expenses')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (4, N'General Admin Costs')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (5, N'Motor Costs')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (6, N'Travel and Subsistence')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (7, N'Advertising, Promotion and Entertainment')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (8, N'Legal and Professional')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (9, N'Bank Fees')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (10, N'Pensions & Insurance')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (11, N'Cost of Goods')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (12, N'Long Term Liabilites')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (13, N'Money Transfer')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (14, N'VAT Liability')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (15, N'Directors/Shareholders Drawings')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (16, N'Misc Purchases')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (17, N'Misc Expenses')
INSERT [dbo].[PurchaseTypes] ([PurchaseTypeId], [Description]) VALUES (18, N'Commission Sales')
SET IDENTITY_INSERT [dbo].[PurchaseTypes] OFF
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (1, N'Route 1                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (2, N'Route 2                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (3, N'Route 3                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (4, N'Route 4                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (5, N'Route 5                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (6, N'Route 6                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (7, N'Route 7                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (8, N'Route 8                                           ')
INSERT [dbo].[Route] ([Route_id], [Route_desc]) VALUES (9, N'Direct                                            ')
SET IDENTITY_INSERT [dbo].[Route] OFF
SET IDENTITY_INSERT [dbo].[SUB_ITEM_TYPES_LOOKUP] ON 

INSERT [dbo].[SUB_ITEM_TYPES_LOOKUP] ([ID], [SUB_TYPE], [PARENT_TYPE_ID], [Published], [DefaultRetailMargin], [DefaultTradeMargin], [DefaultLoyaltyPoints], [DefaultWeight], [CategoryTypeId]) VALUES (-100, N'Loyalty Points', -100, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[SUB_ITEM_TYPES_LOOKUP] ([ID], [SUB_TYPE], [PARENT_TYPE_ID], [Published], [DefaultRetailMargin], [DefaultTradeMargin], [DefaultLoyaltyPoints], [DefaultWeight], [CategoryTypeId]) VALUES (1, N'Sri lanka', 1, NULL, 0, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SUB_ITEM_TYPES_LOOKUP] OFF
SET IDENTITY_INSERT [dbo].[TaxRates] ON 

INSERT [dbo].[TaxRates] ([TaxId], [TaxCode], [TaxRate], [TaxDescription], [IsDefaultTaxCode]) VALUES (1, N'N  ', 0, N'Not VAT Registered', 0)
INSERT [dbo].[TaxRates] ([TaxId], [TaxCode], [TaxRate], [TaxDescription], [IsDefaultTaxCode]) VALUES (2, N'S  ', 20, N'Standard VAT Rate', 1)
INSERT [dbo].[TaxRates] ([TaxId], [TaxCode], [TaxRate], [TaxDescription], [IsDefaultTaxCode]) VALUES (3, N'E  ', 0, N'Tax Exempt', 0)
INSERT [dbo].[TaxRates] ([TaxId], [TaxCode], [TaxRate], [TaxDescription], [IsDefaultTaxCode]) VALUES (4, N'Z  ', 0, N'Zero Rated', 0)
INSERT [dbo].[TaxRates] ([TaxId], [TaxCode], [TaxRate], [TaxDescription], [IsDefaultTaxCode]) VALUES (5, N'R  ', 5, N'Reduced VAT Rate', 0)
SET IDENTITY_INSERT [dbo].[TaxRates] OFF
SET IDENTITY_INSERT [dbo].[tb_Customer] ON 

INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (13, N'Cus 7', N'Add 7', NULL, 50000.0000, N'0113      ', 6)
INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (12, N'Cus 6', N'Add 6', NULL, 45000.0000, N'0112      ', 5)
INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (10, N'Cus 5 ', N'Add 5', NULL, 500.0000, NULL, 2)
INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (9, N'Cus 4', N'Add 4', NULL, 5000.0000, NULL, 1)
INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (8, N'Cus 3', N'Add 3', NULL, 10000.0000, NULL, 3)
INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (7, N'Cus 2', N'Add 2', NULL, 60000.0000, NULL, 1)
INSERT [dbo].[tb_Customer] ([ID_Customer], [Name_Customer], [Address_Customer], [Email], [CreditLimit], [Tel_Customer], [Route_Customer]) VALUES (6, N'Cus 1', N'Add 1', NULL, 50000.0000, NULL, 1)
SET IDENTITY_INSERT [dbo].[tb_Customer] OFF
SET IDENTITY_INSERT [dbo].[tb_Sales] ON 

INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (1, NULL, NULL, 10, 10, 0.0000, N'op', N'op', CAST(N'2016-12-14' AS Date), N'Empl 1', 5, N'Cus 1', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (2, NULL, NULL, 10, 10, 0.0000, N'ui', N'ui', CAST(N'2016-12-14' AS Date), N'Empl 1', 5, N'Cus 1', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (3, NULL, NULL, 10, 10, 0.0000, N'gh', N'gh', CAST(N'2016-12-14' AS Date), N'Empl 1', 5, N'Cus 4', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (4, NULL, NULL, 0, 10, 0.0000, N'jl', N'jl', CAST(N'2016-12-14' AS Date), N'Empl 1', 5, N'Cus 4', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (5, NULL, NULL, 10, 10, 0.0000, N'gh', N'gh', CAST(N'2016-12-14' AS Date), N'Empl 1', 5, N'Cus 4', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (6, NULL, NULL, 10, 10, 0.0000, N'gh', N'gh', CAST(N'2016-12-14' AS Date), N'Empl 1', 5, N' ', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (7, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 4', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (8, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 2', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (9, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 2', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (10, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 4', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (11, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 2', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (12, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 2', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (13, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 4', NULL)
INSERT [dbo].[tb_Sales] ([ID], [sales_id], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Date], [Employee], [Bill_No], [Customer], [Route]) VALUES (14, NULL, NULL, 10, 10, 0.0000, N'New Item', N'New Item', CAST(N'2016-12-14' AS Date), N'Empl 1', 6, N'Cus 2', NULL)
SET IDENTITY_INSERT [dbo].[tb_Sales] OFF
SET IDENTITY_INSERT [dbo].[tb_SalesOrder] ON 

INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (1, N'Empl 1', NULL, N'Cus 1', 1, CAST(N'2016-10-10' AS Date), 1, 10, 10, NULL, N'item', N'item', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (2, N'Empl 1', NULL, N'9', 2, CAST(N'2016-10-10' AS Date), NULL, 50, 50, NULL, N'Item', N'Item', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (3, N'Empl 1', NULL, N'9', 3, CAST(N'2016-10-10' AS Date), NULL, 5, 5, NULL, N'i', N'i', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (6, N'Empl 1', NULL, N'Cus 2', 4, CAST(N'2016-12-14' AS Date), NULL, 50, 50, NULL, N'ty', N'ty', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (7, N'Empl 1', NULL, N'Cus 1', 5, CAST(N'2016-12-14' AS Date), NULL, 10, 10, NULL, N'op', N'op', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (39, N'Empl 1', NULL, N'Cus 4', 6, CAST(N'2016-12-14' AS Date), NULL, 10, 10, NULL, N'New Item', N'New Item', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (43, N'Empl 1', NULL, N'9', 3, CAST(N'2016-10-10' AS Date), NULL, 5, 0, NULL, N'i0', N'i0', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (44, N'Empl 1', NULL, N'9', 3, CAST(N'2016-10-10' AS Date), NULL, 5, 0, NULL, N'i', N'i', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (45, N'Empl 1', NULL, N'9', 3, CAST(N'2016-10-10' AS Date), NULL, 50, 0, NULL, N'i', N'i', NULL)
INSERT [dbo].[tb_SalesOrder] ([Sales_order_id], [Employee], [Delivery_date], [Customer], [Bill_No], [Date], [item_id], [Quantity], [Price], [Discount], [Code_Product], [Name_Product], [Route]) VALUES (46, N'Empl 1', NULL, N'9', 3, CAST(N'2016-10-10' AS Date), NULL, 500, 0, NULL, N'i', N'i', NULL)
SET IDENTITY_INSERT [dbo].[tb_SalesOrder] OFF
SET IDENTITY_INSERT [dbo].[tb_Supplier] ON 

INSERT [dbo].[tb_Supplier] ([ID_Supplier], [Name_Supplier], [Store_Supplier], [Address_Supplier], [ADDRESS_3], [TOWN], [COUNTY], [POST_CODE], [COUNTRY], [Tel_Supplier], [FAX_NO], [CONTACT_NAME], [CONTACT_TEL], [CONTACT_FAX], [CONTACT_EMAIL], [WEB_ADDRESS], [ACCOUNT_NO], [CREDIT_ACCOUNT], [NOTES], [CreditLimit], [PaymentTermsId]) VALUES (-100, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Supplier] ([ID_Supplier], [Name_Supplier], [Store_Supplier], [Address_Supplier], [ADDRESS_3], [TOWN], [COUNTY], [POST_CODE], [COUNTRY], [Tel_Supplier], [FAX_NO], [CONTACT_NAME], [CONTACT_TEL], [CONTACT_FAX], [CONTACT_EMAIL], [WEB_ADDRESS], [ACCOUNT_NO], [CREDIT_ACCOUNT], [NOTES], [CreditLimit], [PaymentTermsId]) VALUES (1, N'Chaturanga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tb_Supplier] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Active], [Employee_id]) VALUES (-1, N'System', N'1637216415930126209240151202111423919386210', 0, NULL)
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Active], [Employee_id]) VALUES (1, N'Administrator', N'2122914021714301784233128915223624866126', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 171)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 172)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 173)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 174)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 175)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 176)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 177)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (-1, 178)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 1)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 2)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 3)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 4)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 5)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 6)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 7)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 8)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 9)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 10)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 11)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 12)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 13)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 14)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 15)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 16)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 17)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 18)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 19)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 20)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 21)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 22)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 23)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 24)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 25)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 26)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 27)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 28)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 29)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 30)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 31)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 32)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 33)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 34)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 35)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 36)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 37)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 38)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 39)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 40)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 41)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 42)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 43)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 44)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 45)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 46)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 47)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 48)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 49)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 50)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 51)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 52)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 53)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 54)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 55)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 56)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 57)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 58)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 59)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 60)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 61)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 62)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 63)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 64)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 65)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 66)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 67)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 68)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 69)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 70)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 71)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 72)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 73)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 74)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 75)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 76)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 77)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 78)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 79)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 80)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 81)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 82)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 83)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 84)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 85)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 86)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 87)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 88)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 89)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 90)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 91)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 92)
GO
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 93)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 94)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 95)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 96)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 97)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 98)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 99)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 100)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 101)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 102)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 103)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 104)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 105)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 106)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 107)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 108)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 109)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 110)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 111)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 112)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 113)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 114)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 115)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 116)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 117)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 118)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 119)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 120)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 121)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 122)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 123)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 124)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 125)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 126)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 127)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 128)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 129)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 130)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 131)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 132)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 133)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 134)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 135)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 136)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 137)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 138)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 139)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 140)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 141)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 142)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 143)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 144)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 145)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 146)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 147)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 148)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 149)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 150)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 151)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 152)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 153)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 154)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 155)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 156)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 157)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 158)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 159)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 160)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 161)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 162)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 163)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 164)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 165)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 166)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 167)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 168)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 169)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 170)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 171)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 172)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 173)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 174)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 175)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 176)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 177)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 178)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 179)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 180)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 181)
INSERT [dbo].[UsersPermissions] ([UserId], [PermissionId]) VALUES (1, 182)
/****** Object:  Index [IX_PaymentSearch]    Script Date: 1/8/2017 1:30:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentSearch] ON [dbo].[Payments]
(
	[PaymentDate] ASC,
	[PaymentAccountId] ASC,
	[TransactionRef] ASC,
	[PaymentMethodId] ASC,
	[Reconciled] ASC,
	[PaymentTypeId] ASC,
	[OurRef] ASC,
	[Comments] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInfo]    Script Date: 1/8/2017 1:30:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductInfo] ON [dbo].[ProductInfo]
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_VendorSearch]    Script Date: 1/8/2017 1:30:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_VendorSearch] ON [dbo].[tb_Supplier]
(
	[ID_Supplier] ASC,
	[Name_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ORDER_STATUS_LOOKUP]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_STATUS_LOOKUP_OrderStatusTypeLookup] FOREIGN KEY([OrderStatusTypeId])
REFERENCES [dbo].[OrderStatusTypeLookup] ([OrderStatusTypeId])
GO
ALTER TABLE [dbo].[ORDER_STATUS_LOOKUP] CHECK CONSTRAINT [FK_ORDER_STATUS_LOOKUP_OrderStatusTypeLookup]
GO
ALTER TABLE [dbo].[PaymentAccountHumanTypes]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAccountHumanTypes_PaymentAccountAccountantTypes] FOREIGN KEY([AccountantAccountType])
REFERENCES [dbo].[PaymentAccountAccountantTypes] ([AccountAccountantTypeId])
GO
ALTER TABLE [dbo].[PaymentAccountHumanTypes] CHECK CONSTRAINT [FK_PaymentAccountHumanTypes_PaymentAccountAccountantTypes]
GO
ALTER TABLE [dbo].[PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMethods_PaymentMethodTypes] FOREIGN KEY([PaymentMethodType])
REFERENCES [dbo].[PaymentMethodTypes] ([PaymentMethodTypeId])
GO
ALTER TABLE [dbo].[PaymentMethods] CHECK CONSTRAINT [FK_PaymentMethods_PaymentMethodTypes]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentAccounts] FOREIGN KEY([PaymentAccountId])
REFERENCES [dbo].[PaymentAccounts] ([PaymentAccountId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentAccounts]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentMethods] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodsId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentMethods]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentTypes] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentTypes] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentTypes]
GO
ALTER TABLE [dbo].[ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProductInfo_ITEMS] FOREIGN KEY([SKU])
REFERENCES [dbo].[ITEMSS] ([StockId])
GO
ALTER TABLE [dbo].[ProductInfo] CHECK CONSTRAINT [FK_ProductInfo_ITEMS]
GO
ALTER TABLE [dbo].[ProductsAllocatedToOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductsAllocatedToOrders_ITEMS] FOREIGN KEY([Sku])
REFERENCES [dbo].[ITEMSS] ([StockId])
GO
ALTER TABLE [dbo].[ProductsAllocatedToOrders] CHECK CONSTRAINT [FK_ProductsAllocatedToOrders_ITEMS]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Purchases] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchases] ([PurchaseId])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Purchases]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_PurchaseStatus] FOREIGN KEY([PurchaseStatusId])
REFERENCES [dbo].[PurchaseStatus] ([PurchaseStatusId])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_PurchaseStatus]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_PurchaseTypes] FOREIGN KEY([PurchaseTypeId])
REFERENCES [dbo].[PurchaseTypes] ([PurchaseTypeId])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_PurchaseTypes]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_VENDORS] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[tb_Supplier] ([ID_Supplier])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_VENDORS]
GO
ALTER TABLE [dbo].[tb_Customer]  WITH CHECK ADD  CONSTRAINT [FK_tb_Customer_tb_Customer] FOREIGN KEY([Route_Customer])
REFERENCES [dbo].[Route] ([Route_id])
GO
ALTER TABLE [dbo].[tb_Customer] CHECK CONSTRAINT [FK_tb_Customer_tb_Customer]
GO
ALTER TABLE [dbo].[tb_Supplier]  WITH CHECK ADD  CONSTRAINT [FK_VENDORS_PaymentTerms] FOREIGN KEY([PaymentTermsId])
REFERENCES [dbo].[PaymentTerms] ([PaymentTermsId])
GO
ALTER TABLE [dbo].[tb_Supplier] CHECK CONSTRAINT [FK_VENDORS_PaymentTerms]
GO
ALTER TABLE [dbo].[UsersPermissions]  WITH CHECK ADD  CONSTRAINT [FK_UsersPermissions_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([PermissionId])
GO
ALTER TABLE [dbo].[UsersPermissions] CHECK CONSTRAINT [FK_UsersPermissions_Permissions]
GO
ALTER TABLE [dbo].[UsersPermissions]  WITH CHECK ADD  CONSTRAINT [FK_UsersPermissions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersPermissions] CHECK CONSTRAINT [FK_UsersPermissions_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Set true if this is an internal item type i.e. labour' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ITEM_TYPES_LOOKUP', @level2type=N'COLUMN',@level2name=N'PRIVATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tells us what this is a subtype for' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SUB_ITEM_TYPES_LOOKUP', @level2type=N'COLUMN',@level2name=N'PARENT_TYPE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price the item was bought at for profit calcs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Cart', @level2type=N'COLUMN',@level2name=N'BUY_PRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True for current users,  false for ''deleted'' users.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Active'
GO
USE [master]
GO
ALTER DATABASE [WICKRAMA_STORES] SET  READ_WRITE 
GO
