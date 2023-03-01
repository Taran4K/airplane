USE [master]
GO
/****** Object:  Database [airlines]    Script Date: 01.03.2023 13:19:54 ******/
CREATE DATABASE [airlines]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'airlines', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\airlines.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'airlines_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\airlines_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [airlines] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airlines].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airlines] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [airlines] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [airlines] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [airlines] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [airlines] SET ARITHABORT OFF 
GO
ALTER DATABASE [airlines] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [airlines] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airlines] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airlines] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airlines] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [airlines] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [airlines] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airlines] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [airlines] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airlines] SET  DISABLE_BROKER 
GO
ALTER DATABASE [airlines] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airlines] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airlines] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airlines] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airlines] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airlines] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airlines] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airlines] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [airlines] SET  MULTI_USER 
GO
ALTER DATABASE [airlines] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [airlines] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airlines] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airlines] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [airlines] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [airlines] SET QUERY_STORE = OFF
GO
USE [airlines]
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
USE [airlines]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 01.03.2023 13:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID_Countries] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[ID_Countries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 01.03.2023 13:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[ID_Office] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Country_ID] [int] NULL,
	[phone] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
 CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED 
(
	[ID_Office] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01.03.2023 13:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01.03.2023 13:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Users_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_ID] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](50) NULL,
	[Firstname] [nvarchar](255) NULL,
	[Lastname] [nvarchar](255) NULL,
	[Office_ID] [int] NULL,
	[Birthdate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Users_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offices] FOREIGN KEY([Office_ID])
REFERENCES [dbo].[Offices] ([ID_Office])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([ID_Role])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [airlines] SET  READ_WRITE 
GO
