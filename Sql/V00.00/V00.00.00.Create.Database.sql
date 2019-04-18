--------------------------------------------------------------------------------
--
-- Created: Éamonn A. Duffy, 17-Apr-2019 (With the assistance of SSMS initially).
--
--------------------------------------------------------------------------------
--
-- TODO: Determine the N (where N = 7?) Directives to use from the SQL Skills Course.
--
--------------------------------------------------------------------------------

:SETVAR	DatabaseNameCss				"Css.V003"

:SETVAR DatabaseFolderNameData		"C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:SETVAR	DatabaseFolderNameLog		"C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

USE [master]
GO

CREATE DATABASE [$(DatabaseNameCss)]
 CONTAINMENT = NONE
 ON  PRIMARY  
( NAME = N'$(DatabaseNameCss)', FILENAME = N'$(DatabaseFolderNameData)$(DatabaseNameCss).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'$(DatabaseNameCss)_log', FILENAME = N'$(DatabaseFolderNameLog)$(DatabaseNameCss)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [$(DatabaseNameCss)] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [$(DatabaseNameCss)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [$(DatabaseNameCss)] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET ARITHABORT OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET  DISABLE_BROKER 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET RECOVERY FULL 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET  MULTI_USER 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [$(DatabaseNameCss)] SET DB_CHAINING OFF 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [$(DatabaseNameCss)] SET QUERY_STORE = OFF
GO

ALTER DATABASE [$(DatabaseNameCss)] SET  READ_WRITE 
GO

--------------------------------------------------------------------------------
-- Begin using the New Database.
--------------------------------------------------------------------------------

USE [$(DatabaseNameCss)]
GO

--------------------------------------------------------------------------------
-- Create Schema if/as appropriate.
--------------------------------------------------------------------------------

IF SCHEMA_ID(N'Dad') IS NULL
BEGIN
	EXECUTE(N'CREATE SCHEMA Dad;');
END
GO

--------------------------------------------------------------------------------
-- Create Tables if/as appropriate.
--------------------------------------------------------------------------------
-- TODO: Investigate further the potential requirement for ON PRIMARY.
--------------------------------------------------------------------------------

DROP TABLE IF EXISTS Dad.DatabaseVersion; 
GO

CREATE TABLE Dad.DatabaseVersion
(
    DatabaseVersionId           Integer CONSTRAINT PK_DatabaseVersion PRIMARY KEY IDENTITY(0, 1) NOT NULL,
    Major                       Integer NOT NULL,
    Minor                       Integer NOT NULL,
    Build                       Integer NOT NULL,
    ServicePack                 Integer NOT NULL, 
    Description                 NVarChar(128) NOT NULL,
    CreatedDateTimeUtc          DateTime2(7) NOT NULL
);
GO

--------------------------------------------------------------------------------

INSERT INTO Dad.DatabaseVersion
    (Major, Minor, Build, ServicePack, Description, CreatedDateTimeUtc)
VALUES
    (0, 0, 0, 0, N'V0.0', GetUtcDate());
GO

--------------------------------------------------------------------------------
-- Scratch Pad area to try out SQL.
--------------------------------------------------------------------------------

 