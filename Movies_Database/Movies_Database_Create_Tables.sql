USE [master]
GO
/****** Object:  Database [Movies]    Script Date: 04/08/2022 15:11:36 ******/
CREATE DATABASE [Movies]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'Movies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Movies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'Movies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Movies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Movies] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movies] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Movies] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Movies] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Movies] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Movies] SET ARITHABORT OFF
GO
ALTER DATABASE [Movies] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Movies] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Movies] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Movies] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Movies] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Movies] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Movies] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Movies] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Movies] SET  DISABLE_BROKER
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Movies] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Movies] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Movies] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Movies] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Movies] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Movies] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Movies] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Movies] SET  MULTI_USER
GO
ALTER DATABASE [Movies] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Movies] SET DB_CHAINING OFF
GO
ALTER DATABASE [Movies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [Movies] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [Movies] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [Movies] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [Movies] SET QUERY_STORE = OFF
GO
USE [Movies]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 04/08/2022 15:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[ActorID] [int] NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[BirthDate] [date] NULL,
PRIMARY KEY CLUSTERED
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CastMembers]    Script Date: 04/08/2022 15:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CastMembers](
	[CastMemberID] [int] NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[ActorID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[CastMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Director]    Script Date: 04/08/2022 15:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Director](
	[DirectorID] [int] NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[BirthDate] [date] NULL,
PRIMARY KEY CLUSTERED
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 04/08/2022 15:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] NOT NULL,
	[GenreName] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 04/08/2022 15:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
	[DirectorID] [int] NULL,
	[RatingID] [int] NULL,
	[Title] [varchar](128) NOT NULL,
	[ReleaseDate] [date] NULL,
PRIMARY KEY CLUSTERED
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 04/08/2022 15:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [int] NOT NULL,
	[RatingName] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CastMembers]  WITH CHECK ADD  CONSTRAINT [FK_CastMembers_Actor] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actor] ([ActorID])
GO
ALTER TABLE [dbo].[CastMembers] CHECK CONSTRAINT [FK_CastMembers_Actor]
GO
ALTER TABLE [dbo].[CastMembers]  WITH CHECK ADD  CONSTRAINT [FK_CastMembers_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[CastMembers] CHECK CONSTRAINT [FK_CastMembers_Movie]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Genre] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Genre]
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE
GO
