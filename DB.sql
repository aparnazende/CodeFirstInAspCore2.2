USE [master]
GO
/****** Object:  Database [DB_Music]    Script Date: 2/12/2020 5:06:02 PM ******/
CREATE DATABASE [DB_Music]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Music', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Music.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Music_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Music_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Music] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Music].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Music] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Music] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Music] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Music] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Music] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Music] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Music] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Music] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Music] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Music] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Music] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Music] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Music] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Music] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Music] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Music] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Music] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Music] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Music] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Music] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Music] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Music] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Music] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Music] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Music] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Music] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Music] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Music] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Music] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Music', N'ON'
GO
ALTER DATABASE [DB_Music] SET QUERY_STORE = OFF
GO
USE [DB_Music]
GO
/****** Object:  Table [dbo].[TblMasterAlbum]    Script Date: 2/12/2020 5:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMasterAlbum](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Image] [nvarchar](500) NULL,
	[ReleasedDate] [datetime2](7) NULL,
	[Rating] [int] NULL,
	[Review] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[ArtistId] [bigint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_MasterAlbum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMasterArtist]    Script Date: 2/12/2020 5:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMasterArtist](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](150) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nchar](10) NULL,
	[Gender] [bit] NOT NULL,
	[DOB] [datetime2](7) NULL,
	[Email] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[MaritalStatus] [bigint] NOT NULL,
	[PhoneExtnNo] [nvarchar](max) NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[GenreId] [bigint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_MasterArtist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMasterGenre]    Script Date: 2/12/2020 5:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMasterGenre](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MusicType] [nvarchar](200) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_MasterMusicType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSongs]    Script Date: 2/12/2020 5:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSongs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GenreId] [bigint] NULL,
	[AlbumId] [bigint] NULL,
	[ArtistId] [bigint] NULL,
	[Name] [nvarchar](max) NULL,
	[Time] [time](7) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Rating] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_TblSongs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblMasterAlbum] ON 

INSERT [dbo].[TblMasterAlbum] ([Id], [Name], [Image], [ReleasedDate], [Rating], [Review], [Price], [ArtistId], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (2, N'Ephorize', NULL, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), 123, N'good', CAST(100.00 AS Decimal(18, 2)), 3, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblMasterAlbum] ([Id], [Name], [Image], [ReleasedDate], [Rating], [Review], [Price], [ArtistId], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (6, N'Avatar Country', NULL, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), 234, N'ok', CAST(123.00 AS Decimal(18, 2)), 4, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblMasterAlbum] OFF
SET IDENTITY_INSERT [dbo].[TblMasterArtist] ON 

INSERT [dbo].[TblMasterArtist] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DOB], [Email], [Mobile], [MaritalStatus], [PhoneExtnNo], [PhotoPath], [IsDeleted], [GenreId], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [DeletedBy], [DeletedDate]) VALUES (3, N'Jeff ', NULL, N'Rosenstock', 1, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, N'9890410787', 1, NULL, NULL, 0, NULL, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblMasterArtist] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DOB], [Email], [Mobile], [MaritalStatus], [PhoneExtnNo], [PhotoPath], [IsDeleted], [GenreId], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [DeletedBy], [DeletedDate]) VALUES (4, N'Cupcakke', NULL, N'K         ', 1, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, N'9890410787', 1, NULL, NULL, 0, NULL, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblMasterArtist] ([Id], [FirstName], [MiddleName], [LastName], [Gender], [DOB], [Email], [Mobile], [MaritalStatus], [PhoneExtnNo], [PhotoPath], [IsDeleted], [GenreId], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [DeletedBy], [DeletedDate]) VALUES (5, N'Avatar', NULL, N'K         ', 1, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, N'9890410787', 1, NULL, NULL, 0, NULL, CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblMasterArtist] OFF
SET IDENTITY_INSERT [dbo].[TblMasterGenre] ON 

INSERT [dbo].[TblMasterGenre] ([Id], [MusicType], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (1, N'Rock', CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblMasterGenre] ([Id], [MusicType], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (2, N'Hip hop', CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblMasterGenre] ([Id], [MusicType], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (4, N'Indie pop', CAST(N'2019-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblMasterGenre] OFF
SET IDENTITY_INSERT [dbo].[TblSongs] ON 

INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (2, 2, 2, 3, N'2 Minutes', CAST(N'02:00:00' AS Time), CAST(12.00 AS Decimal(18, 2)), NULL, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (3, 2, 2, 3, N'Cartoons', CAST(N'02:40:00' AS Time), CAST(13.00 AS Decimal(18, 2)), NULL, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (4, 2, 2, 3, N'2 Minutes', CAST(N'02:10:00' AS Time), CAST(10.00 AS Decimal(18, 2)), NULL, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (5, 2, 2, 3, N'Crayons', CAST(N'03:20:00' AS Time), CAST(20.00 AS Decimal(18, 2)), NULL, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (6, 2, 2, 3, N'Exit', CAST(N'03:00:00' AS Time), CAST(12.00 AS Decimal(18, 2)), NULL, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (7, 2, 2, 3, N'Self Interview', CAST(N'05:10:00' AS Time), CAST(12.00 AS Decimal(18, 2)), NULL, CAST(N'2080-02-06T14:49:15.6876370' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[TblSongs] ([Id], [GenreId], [AlbumId], [ArtistId], [Name], [Time], [Price], [Rating], [CreatedDate], [UpdatedDate], [CreatedBy], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (12, 4, 6, 4, N'A Dil', CAST(N'02:30:00' AS Time), CAST(12.00 AS Decimal(18, 2)), NULL, CAST(N'2018-02-09T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblSongs] OFF
ALTER TABLE [dbo].[TblMasterAlbum]  WITH CHECK ADD  CONSTRAINT [FK_TblMasterAlbum_TblMasterArtist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[TblMasterArtist] ([Id])
GO
ALTER TABLE [dbo].[TblMasterAlbum] CHECK CONSTRAINT [FK_TblMasterAlbum_TblMasterArtist]
GO
ALTER TABLE [dbo].[TblMasterArtist]  WITH CHECK ADD  CONSTRAINT [FK_TblMasterArtist_TblMasterGenre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[TblMasterGenre] ([Id])
GO
ALTER TABLE [dbo].[TblMasterArtist] CHECK CONSTRAINT [FK_TblMasterArtist_TblMasterGenre]
GO
ALTER TABLE [dbo].[TblSongs]  WITH CHECK ADD  CONSTRAINT [FK_TblSongs_TblGenre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[TblMasterGenre] ([Id])
GO
ALTER TABLE [dbo].[TblSongs] CHECK CONSTRAINT [FK_TblSongs_TblGenre]
GO
ALTER TABLE [dbo].[TblSongs]  WITH CHECK ADD  CONSTRAINT [FK_TblSongs_TblMasterArtist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[TblMasterArtist] ([Id])
GO
ALTER TABLE [dbo].[TblSongs] CHECK CONSTRAINT [FK_TblSongs_TblMasterArtist]
GO
ALTER TABLE [dbo].[TblSongs]  WITH CHECK ADD  CONSTRAINT [FK_TblSongs_TblSongs] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[TblMasterAlbum] ([Id])
GO
ALTER TABLE [dbo].[TblSongs] CHECK CONSTRAINT [FK_TblSongs_TblSongs]
GO
USE [master]
GO
ALTER DATABASE [DB_Music] SET  READ_WRITE 
GO
