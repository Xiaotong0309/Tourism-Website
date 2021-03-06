USE [master]
GO
/****** Object:  Database [Travel]    Script Date: 2017/6/20 11:42:35 ******/
CREATE DATABASE [Travel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Travel', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Travel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Travel_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Travel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Travel] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Travel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Travel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Travel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Travel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Travel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Travel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Travel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Travel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Travel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Travel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Travel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Travel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Travel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Travel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Travel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Travel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Travel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Travel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Travel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Travel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Travel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Travel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Travel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Travel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Travel] SET  MULTI_USER 
GO
ALTER DATABASE [Travel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Travel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Travel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Travel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Travel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Travel] SET QUERY_STORE = OFF
GO
USE [Travel]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Travel]
GO
/****** Object:  User [travel]    Script Date: 2017/6/20 11:42:35 ******/
CREATE USER [travel] FOR LOGIN [travel] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[目的地]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[目的地](
	[目的地编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [varchar](20) NOT NULL,
	[攻略] [varchar](7000) NULL,
	[排名] [int] NULL,
	[类型] [bit] NOT NULL,
	[从属目的地] [int] NULL,
 CONSTRAINT [PK_目的地] PRIMARY KEY CLUSTERED 
(
	[目的地编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[热门目的地]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[热门目的地] AS
SELECT T2.名称 AS 国家,T1.名称 AS 城市,T1.目的地编号 ,T1.从属目的地
FROM 目的地 T1,目的地 T2 
WHERE T1.从属目的地=T2.目的地编号 AND T1.排名<=5 
GO
/****** Object:  Table [dbo].[游记]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[游记](
	[游记编号] [int] IDENTITY(1,1) NOT NULL,
	[题目] [varchar](20) NOT NULL,
	[发表时间] [date] NOT NULL,
	[人均花费] [int] NULL,
	[出行时间] [date] NULL,
	[出行人数] [int] NULL,
	[出行方式] [smallint] NOT NULL,
	[正文] [varchar](7000) NOT NULL,
	[浏览次数] [int] NULL,
	[收藏次数] [int] NULL,
	[发布者] [int] NOT NULL,
 CONSTRAINT [PK_游记] PRIMARY KEY CLUSTERED 
(
	[游记编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[游记目的地]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[游记目的地](
	[目的地编号] [int] NOT NULL,
	[游记编号] [int] NOT NULL,
 CONSTRAINT [PK__游记目的地__794DD808C2ADEB52] PRIMARY KEY CLUSTERED 
(
	[目的地编号] ASC,
	[游记编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[当季精选]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[当季精选] AS
with mm as (
SELECT 目的地编号,MONTH(出行时间) AS 月份,COUNT(*) AS 提及数
FROM 游记目的地,游记
WHERE 游记目的地.游记编号=游记.游记编号
GROUP BY 目的地编号,MONTH(出行时间))
SELECT mm.月份,T2.名称 AS 国家,T1.名称 AS 城市,T1.目的地编号 ,T1.从属目的地,mm.提及数
FROM 目的地 T1,目的地 T2 ,mm
WHERE T1.从属目的地=T2.目的地编号 AND T1.目的地编号=mm.目的地编号
GO
/****** Object:  View [dbo].[主题精选]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[主题精选] AS
with mm as (
SELECT 目的地编号,CASE WHEN 出行方式=0 THEN '一个人' WHEN 出行方式=1 THEN '和朋友' ELSE '家庭游' END  AS 出行方式,COUNT(*) AS 提及数
FROM 游记目的地,游记
WHERE 游记目的地.游记编号=游记.游记编号
GROUP BY 目的地编号,出行方式)
SELECT mm.出行方式,T2.名称 AS 国家,T1.名称 AS 城市,T1.目的地编号 ,T1.从属目的地,mm.提及数
FROM 目的地 T1,目的地 T2 ,mm
WHERE T1.从属目的地=T2.目的地编号 AND T1.目的地编号=mm.目的地编号
GO
/****** Object:  Table [dbo].[出行人]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[出行人](
	[出行人编号] [int] IDENTITY(1,1) NOT NULL,
	[身份证号] [varchar](20) NULL,
	[护照号] [varchar](20) NULL,
	[姓名] [varchar](20) NOT NULL,
	[手机号] [varchar](20) NOT NULL,
	[邮箱] [varchar](20) NULL,
	[出行人类型] [bit] NOT NULL,
 CONSTRAINT [PK_出行人] PRIMARY KEY CLUSTERED 
(
	[出行人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__出行人__43D7F42A4A978CD7] UNIQUE NONCLUSTERED 
(
	[护照号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__出行人__532C1712488FB70C] UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[参团]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[参团](
	[出行人编号] [int] NOT NULL,
	[线路编号] [int] NOT NULL,
	[出发日期] [date] NOT NULL,
 CONSTRAINT [PK__参团__ADE4F06790D90083] PRIMARY KEY CLUSTERED 
(
	[出行人编号] ASC,
	[线路编号] ASC,
	[出发日期] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[用户]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[用户](
	[用户编号] [int] IDENTITY(1,1) NOT NULL,
	[用户名] [varchar](20) NOT NULL,
	[密码] [varchar](18) NOT NULL,
	[手机号] [varchar](20) NULL,
	[生日] [date] NULL,
	[性别] [bit] NOT NULL,
	[积分] [int] NOT NULL,
 CONSTRAINT [PK_用户] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[预定线路]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[预定线路](
	[用户编号] [int] NOT NULL,
	[线路编号] [int] NOT NULL,
 CONSTRAINT [PK__预订线路__F01AEFD05C9BACEF] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC,
	[线路编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[创建出行人]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[创建出行人](
	[用户编号] [int] NOT NULL,
	[出行人编号] [int] NOT NULL,
 CONSTRAINT [PK__创建出行人__D95B89B709F70166] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC,
	[出行人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[线路]    Script Date: 2017/6/20 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[线路](
	[线路编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [varchar](20) NOT NULL,
	[联系方式] [varchar](20) NOT NULL,
	[天数] [int] NOT NULL,
	[线路说明] [varchar](7000) NOT NULL,
	[类别] [smallint] NOT NULL,
	[评分] [float] NOT NULL,
	[出发地] [varchar](20) NULL,
 CONSTRAINT [PK_线路] PRIMARY KEY CLUSTERED 
(
	[线路编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[出行时间]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[出行时间](
	[线路编号] [int] NOT NULL,
	[出发日期] [date] NOT NULL,
	[价格] [int] NOT NULL,
 CONSTRAINT [PK__出行时间__D70F80076D1907A4] PRIMARY KEY CLUSTERED 
(
	[线路编号] ASC,
	[出发日期] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[订单]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[订单] AS
SELECT 用户.用户编号,线路.线路编号,名称,出行时间.出发日期,价格,COUNT(出行人.出行人编号) AS 出行人数,天数,评分
FROM 用户,创建出行人,出行人,参团,出行时间,线路,预定线路
WHERE 用户.用户编号=创建出行人.用户编号 AND 创建出行人.出行人编号=出行人.出行人编号 AND 出行人.出行人编号=参团.出行人编号 AND 参团.线路编号=出行时间.线路编号  AND 线路.线路编号=出行时间.线路编号 AND 线路.线路编号=预定线路.线路编号 AND 用户.用户编号=预定线路.用户编号
GROUP BY 用户.用户编号,线路.线路编号,名称,出行时间.出发日期,价格,天数,评分
GO
/****** Object:  Table [dbo].[线路目的地]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[线路目的地](
	[目的地编号] [int] NOT NULL,
	[线路编号] [int] NOT NULL,
 CONSTRAINT [PK__线路目的地__6F51DA1D24DEE762] PRIMARY KEY CLUSTERED 
(
	[目的地编号] ASC,
	[线路编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[线路筛选]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[线路筛选] as
select distinct 线路.线路编号,线路.名称 AS 线路名,天数,CASE WHEN 类别=0 THEN '一日游' WHEN 类别=1 THEN '多日游' ELSE '半自由行' END  AS 线路类型,month(出发日期) AS 出发月份,价格,出发地,目的地.名称 AS 目的地,评分,COUNT(预定线路.用户编号) AS 销量
from 出行时间,线路目的地,目的地,线路 left outer join 预定线路 on(预定线路.线路编号=线路.线路编号)
where 线路.线路编号=出行时间.线路编号 and 线路.线路编号=线路目的地.线路编号 and 线路目的地.目的地编号=目的地.目的地编号 
GROUP BY 线路.线路编号,线路.名称,天数,类别,出发日期,价格,出发地,评分,目的地.名称
GO
/****** Object:  Table [dbo].[关注]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[关注](
	[关注者编号] [int] NOT NULL,
	[被关注者编号] [int] NOT NULL,
 CONSTRAINT [PK__关注__F1BE6B67E8D71F75] PRIMARY KEY CLUSTERED 
(
	[关注者编号] ASC,
	[被关注者编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[管理员]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[管理员](
	[管理员编号] [int] IDENTITY(1,1) NOT NULL,
	[账号] [varchar](20) NOT NULL,
	[密码] [varchar](18) NOT NULL,
 CONSTRAINT [PK_管理员] PRIMARY KEY CLUSTERED 
(
	[管理员编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[线路评价]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[线路评价](
	[用户编号] [int] NOT NULL,
	[线路编号] [int] NOT NULL,
	[评分] [smallint] NOT NULL,
	[内容] [varchar](7000) NOT NULL,
 CONSTRAINT [PK__线路评价__F01AEFD0CB6CAC8C] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC,
	[线路编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[线路收藏]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[线路收藏](
	[用户编号] [int] NOT NULL,
	[线路编号] [int] NOT NULL,
 CONSTRAINT [PK__线路收藏__F01AEFD0C6D47915] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC,
	[线路编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[游记收藏]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[游记收藏](
	[用户编号] [int] NOT NULL,
	[游记编号] [int] NOT NULL,
 CONSTRAINT [PK__游记收藏__E606EDC5FBF17997] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC,
	[游记编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[出行人] ADD  CONSTRAINT [DF_出行人_出行人类型]  DEFAULT ((0)) FOR [出行人类型]
GO
ALTER TABLE [dbo].[线路] ADD  CONSTRAINT [DF_线路_评分]  DEFAULT ((0)) FOR [评分]
GO
ALTER TABLE [dbo].[用户] ADD  CONSTRAINT [DF_用户_性别]  DEFAULT ((0)) FOR [性别]
GO
ALTER TABLE [dbo].[用户] ADD  CONSTRAINT [DF_用户_积分]  DEFAULT ((100)) FOR [积分]
GO
ALTER TABLE [dbo].[游记] ADD  CONSTRAINT [DF_游记_浏览次数]  DEFAULT ((0)) FOR [浏览次数]
GO
ALTER TABLE [dbo].[游记] ADD  CONSTRAINT [DF_游记_收藏次数]  DEFAULT ((0)) FOR [收藏次数]
GO
ALTER TABLE [dbo].[参团]  WITH CHECK ADD  CONSTRAINT [FK_参团_出行人] FOREIGN KEY([出行人编号])
REFERENCES [dbo].[出行人] ([出行人编号])
GO
ALTER TABLE [dbo].[参团] CHECK CONSTRAINT [FK_参团_出行人]
GO
ALTER TABLE [dbo].[参团]  WITH CHECK ADD  CONSTRAINT [PK_参团_出行时间] FOREIGN KEY([线路编号], [出发日期])
REFERENCES [dbo].[出行时间] ([线路编号], [出发日期])
GO
ALTER TABLE [dbo].[参团] CHECK CONSTRAINT [PK_参团_出行时间]
GO
ALTER TABLE [dbo].[出行时间]  WITH CHECK ADD  CONSTRAINT [FK_出行时间_线路] FOREIGN KEY([线路编号])
REFERENCES [dbo].[线路] ([线路编号])
GO
ALTER TABLE [dbo].[出行时间] CHECK CONSTRAINT [FK_出行时间_线路]
GO
ALTER TABLE [dbo].[创建出行人]  WITH CHECK ADD  CONSTRAINT [FK_创建出行人_出行人] FOREIGN KEY([出行人编号])
REFERENCES [dbo].[出行人] ([出行人编号])
GO
ALTER TABLE [dbo].[创建出行人] CHECK CONSTRAINT [FK_创建出行人_出行人]
GO
ALTER TABLE [dbo].[创建出行人]  WITH CHECK ADD  CONSTRAINT [FK_创建出行人_用户] FOREIGN KEY([用户编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[创建出行人] CHECK CONSTRAINT [FK_创建出行人_用户]
GO
ALTER TABLE [dbo].[关注]  WITH CHECK ADD  CONSTRAINT [FK_关注_用户] FOREIGN KEY([关注者编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[关注] CHECK CONSTRAINT [FK_关注_用户]
GO
ALTER TABLE [dbo].[关注]  WITH CHECK ADD  CONSTRAINT [FK_关注_用户1] FOREIGN KEY([被关注者编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[关注] CHECK CONSTRAINT [FK_关注_用户1]
GO
ALTER TABLE [dbo].[目的地]  WITH CHECK ADD  CONSTRAINT [FK_目的地_目的地] FOREIGN KEY([从属目的地])
REFERENCES [dbo].[目的地] ([目的地编号])
GO
ALTER TABLE [dbo].[目的地] CHECK CONSTRAINT [FK_目的地_目的地]
GO
ALTER TABLE [dbo].[线路目的地]  WITH CHECK ADD  CONSTRAINT [FK_线路目的地_目的地] FOREIGN KEY([目的地编号])
REFERENCES [dbo].[目的地] ([目的地编号])
GO
ALTER TABLE [dbo].[线路目的地] CHECK CONSTRAINT [FK_线路目的地_目的地]
GO
ALTER TABLE [dbo].[线路目的地]  WITH CHECK ADD  CONSTRAINT [FK_线路目的地_线路] FOREIGN KEY([线路编号])
REFERENCES [dbo].[线路] ([线路编号])
GO
ALTER TABLE [dbo].[线路目的地] CHECK CONSTRAINT [FK_线路目的地_线路]
GO
ALTER TABLE [dbo].[线路评价]  WITH CHECK ADD  CONSTRAINT [FK_线路评价_线路] FOREIGN KEY([线路编号])
REFERENCES [dbo].[线路] ([线路编号])
GO
ALTER TABLE [dbo].[线路评价] CHECK CONSTRAINT [FK_线路评价_线路]
GO
ALTER TABLE [dbo].[线路评价]  WITH CHECK ADD  CONSTRAINT [FK_线路评价_用户] FOREIGN KEY([用户编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[线路评价] CHECK CONSTRAINT [FK_线路评价_用户]
GO
ALTER TABLE [dbo].[线路收藏]  WITH CHECK ADD  CONSTRAINT [FK_线路收藏_线路] FOREIGN KEY([线路编号])
REFERENCES [dbo].[线路] ([线路编号])
GO
ALTER TABLE [dbo].[线路收藏] CHECK CONSTRAINT [FK_线路收藏_线路]
GO
ALTER TABLE [dbo].[线路收藏]  WITH CHECK ADD  CONSTRAINT [FK_线路收藏_用户] FOREIGN KEY([用户编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[线路收藏] CHECK CONSTRAINT [FK_线路收藏_用户]
GO
ALTER TABLE [dbo].[游记]  WITH CHECK ADD  CONSTRAINT [FK_游记_用户] FOREIGN KEY([发布者])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[游记] CHECK CONSTRAINT [FK_游记_用户]
GO
ALTER TABLE [dbo].[游记目的地]  WITH CHECK ADD  CONSTRAINT [FK_游记目的地_目的地] FOREIGN KEY([目的地编号])
REFERENCES [dbo].[目的地] ([目的地编号])
GO
ALTER TABLE [dbo].[游记目的地] CHECK CONSTRAINT [FK_游记目的地_目的地]
GO
ALTER TABLE [dbo].[游记目的地]  WITH CHECK ADD  CONSTRAINT [FK_游记目的地_游记] FOREIGN KEY([游记编号])
REFERENCES [dbo].[游记] ([游记编号])
GO
ALTER TABLE [dbo].[游记目的地] CHECK CONSTRAINT [FK_游记目的地_游记]
GO
ALTER TABLE [dbo].[游记收藏]  WITH CHECK ADD  CONSTRAINT [FK_游记收藏_用户] FOREIGN KEY([用户编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[游记收藏] CHECK CONSTRAINT [FK_游记收藏_用户]
GO
ALTER TABLE [dbo].[游记收藏]  WITH CHECK ADD  CONSTRAINT [FK_游记收藏_游记] FOREIGN KEY([游记编号])
REFERENCES [dbo].[游记] ([游记编号])
GO
ALTER TABLE [dbo].[游记收藏] CHECK CONSTRAINT [FK_游记收藏_游记]
GO
ALTER TABLE [dbo].[预定线路]  WITH CHECK ADD  CONSTRAINT [FK_预定线路_线路] FOREIGN KEY([线路编号])
REFERENCES [dbo].[线路] ([线路编号])
GO
ALTER TABLE [dbo].[预定线路] CHECK CONSTRAINT [FK_预定线路_线路]
GO
ALTER TABLE [dbo].[预定线路]  WITH CHECK ADD  CONSTRAINT [FK_预定线路_用户] FOREIGN KEY([用户编号])
REFERENCES [dbo].[用户] ([用户编号])
GO
ALTER TABLE [dbo].[预定线路] CHECK CONSTRAINT [FK_预定线路_用户]
GO
ALTER TABLE [dbo].[管理员]  WITH CHECK ADD  CONSTRAINT [CK_管理员] CHECK  ((len([密码])>=(6)))
GO
ALTER TABLE [dbo].[管理员] CHECK CONSTRAINT [CK_管理员]
GO
ALTER TABLE [dbo].[线路]  WITH CHECK ADD  CONSTRAINT [CK_线路] CHECK  (([类别]<=(2)))
GO
ALTER TABLE [dbo].[线路] CHECK CONSTRAINT [CK_线路]
GO
ALTER TABLE [dbo].[线路评价]  WITH CHECK ADD  CONSTRAINT [CK_线路评价] CHECK  (([评分]>=(1) AND [评分]<=(10)))
GO
ALTER TABLE [dbo].[线路评价] CHECK CONSTRAINT [CK_线路评价]
GO
ALTER TABLE [dbo].[用户]  WITH CHECK ADD  CONSTRAINT [CK_用户] CHECK  ((len([密码])>=(6)))
GO
ALTER TABLE [dbo].[用户] CHECK CONSTRAINT [CK_用户]
GO
ALTER TABLE [dbo].[游记]  WITH CHECK ADD  CONSTRAINT [CK_游记] CHECK  (([出行方式]<=(2)))
GO
ALTER TABLE [dbo].[游记] CHECK CONSTRAINT [CK_游记]
GO
/****** Object:  Trigger [dbo].[删除线路_A]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[删除线路_A]
ON [dbo].[出行时间]
AFTER DELETE
AS 
BEGIN
DECLARE @线路编号 INT,@数目 INT
SELECT @线路编号=线路编号 FROM DELETED
SELECT @数目=COUNT(*)
FROM 出行时间
WHERE 线路编号=@线路编号
GROUP BY 线路编号
IF(@数目=0)
DELETE 线路
WHERE 线路编号=@线路编号
END

GO
ALTER TABLE [dbo].[出行时间] ENABLE TRIGGER [删除线路_A]
GO
/****** Object:  Trigger [dbo].[评价_A]    Script Date: 2017/6/20 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[评价_A]
ON [dbo].[线路评价]
AFTER INSERT,DELETE
AS 
BEGIN
DECLARE @线路编号 INT,@评分 INT,@数目 INT,@评分_t INT
SELECT @线路编号=线路编号 FROM INSERTED
SELECT @评分=SUM(评分),@数目=COUNT(*)
FROM 线路评价
WHERE 线路编号=@线路编号
GROUP BY 线路编号
UPDATE 线路
SET 评分 = convert(decimal(18, 2),@评分)/convert(decimal(18, 2),@数目) WHERE 线路编号=@线路编号
END

GO
ALTER TABLE [dbo].[线路评价] ENABLE TRIGGER [评价_A]
GO
USE [master]
GO
ALTER DATABASE [Travel] SET  READ_WRITE 
GO
