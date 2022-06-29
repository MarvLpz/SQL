


-- Create a database using T-SQL (DDL)
IF DB_ID('SQLDemo2012') IS NOT NULL 
DROP DATABASE SQLDemo2012
GO -- terminator

CREATE DATABASE [SQLDemo2014] ON PRIMARY 
( 
	NAME = 'SQLDemo2014', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLDemo2014.mdf', 
	FILEGROWTH = 1024KB 
)

LOG ON 
( 
	NAME = 'SQLDemo2014_log', 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLDemo2014_log.ldf' , 
	FILEGROWTH = 10%
);
GO



-- Create Another Database 
-- Tip: It's a good practice to separate database and transaction log files on different drives 
-- for optimal performance and disaster recovery. (Production Box)

CREATE DATABASE AnotherDB ON PRIMARY 
( 
	NAME = 'AnotherDB', 
	FILENAME = 'C:\Users\Public\Another.mdf', 
	FILEGROWTH = 1024KB 
)
LOG ON -- 
( 
	NAME = 'AnotherLog', 
	FILENAME = 'C:\Users\Public\AssumingAnotherDrive_D.ldf' , 
	FILEGROWTH = 10%
);
GO


-- Drop the database
IF DB_ID('AnotherDB') IS NOT NULL 
DROP DATABASE AnotherDB
GO

/*
Alter Database:

USE master;
GO
--Modify DB Name
ALTER DATABASE oldDBName
Modify Name = newDBName;
GO

--Modify File
ALTER DATABASE newDBName
MODIFY FILE (NAME=oldDBName_Log,FILEGROWTH=20MB);
GO

*/


