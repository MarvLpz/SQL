
-- Sample 1

-- To change the current environment database 
USE SQLDemo2014; 
GO
 

-- Create new table. 
-- Table Name: Project 
-- Note: Project will contain name of buildings (Construction Project)
	-- Create a schema first
	/*  Schema  */  -- Schemas are just like Namespace in C# codes.     
				    -- They logically group tables, procs, views together. //container

USE [SQLDemo2014]
GO

CREATE SCHEMA [finance] AUTHORIZATION [dbo]				--database owner (user) has absolute control over the securable and cannot be denied any priviledge
GO


IF OBJECT_ID('finance.Project','U') IS NOT NULL   
	DROP TABLE finance.Project ; 
GO 

CREATE TABLE finance.Project (
	 ProjectId		INT IDENTITY(100,1) NOT NULL								-- add identity (SEED, INCREMENT)
	,LocationId		INT NOT NULL
	,ProjectName	CHAR(30) NOT NULL CHECK (LEFT (ProjectName,8) <> 'Mckinley')-- CHECK CONSTRAINT
	,LastUpdate		DATETIME NULL
	,CONSTRAINT	PK_ProjectId PRIMARY KEY (ProjectId),							-- add primary key to the table, considered as CLUSTERED by default
);	
GO


-- To insert additional column to a table 

ALTER TABLE finance.Project 
	ADD  UpdatedBy  CHAR(30) NOT NULL;
GO


/*
--Alter Column:
ALTER TABLE finance.Project 
ALTER COLUMN  UpdatedBy  NCHAR(30) NOT NULL;
GO

*/


-- Create another table. 
-- Table Name: Location

IF OBJECT_ID('finance.Location','U') IS NOT NULL   
	DROP TABLE finance.Location;  
CREATE TABLE finance.Location (
	 LocationId		INT NOT NULL PRIMARY KEY
	,LocationName	VARCHAR(30) NOT NULL
	,InsertDate		DATE NOT NULL DEFAULT(GetDate())
	,InsertedBy		VARCHAR(10) NOT NULL
);
GO


-- Set Foreign key constraint for Table Project, referencing Table Location

ALTER TABLE finance.Project
	ADD CONSTRAINT FK_LocationId FOREIGN KEY(LocationID)
	REFERENCES finance.Location(LocationId)
GO


-- To add a Default constraint column to a table.
-- Set LastUpdate column to today's date when no value is supplied during Insert 

ALTER TABLE finance.Project
	ADD CONSTRAINT Def_LastUpdate DEFAULT(GetDate()) FOR LastUpdate;
GO	


/*
--Drop Constraint
--Constraint cannot be dropped
ALTER TABLE finance.Project
DROP CONSTRAINT Def_LastUpdate 
GO	

*/



-- To add NONCLUSTERED INDEX
CREATE NONCLUSTERED INDEX  IX_LocationId ON finance.Project(LocationId);
GO


/*
-- If data is UNIQUE: 
CREATE UNIQUE NONCLUSTERED INDEX IXU_LocationId 
ON		dbo.Project(LocationId);

*/


/*
-- To remove index 
DROP INDEX [schema].Project.IXU_IndexName;
--INDEX cannot be alter: Drop Constraint then reCreate
*/


/*
-- CHECK the newly created Project table in SSMS 
-- RUN to validate the CHECK constraint for ‘Mckinley’ in Project Name, observe the error

INSERT INTO	finance.Project(LocationId,ProjectName,LastUpdate,UpdatedBy)
VALUES ('1','Mckinley Place',GETDATE(),'Username');

*/





-- Sample 2

-- Create another new table. 
-- Table Name: Currency
-- Will use default schema dbo
-- Currency Table will contain unique currency code and description

USE	SQLDemo2014; 
GO

IF OBJECT_ID('Currency','U') IS NOT NULL 
	DROP TABLE Currency;
GO

CREATE TABLE Currency
(
	 CurrencyCode		INT NOT NULL PRIMARY KEY  
	,CurrencyShortName	CHAR(3) NOT NULL
	,CurrencyName		VARCHAR(30) NOT NULL
	,LastUpdated		DATETIME NOT NULL
);
GO

-- Create another Table 
-- Table Name: DailyRate
-- Will use default schema dbo
-- This table will contain the daily updates of exchange rate

IF OBJECT_ID('DailyRate','U') IS NOT NULL 
	DROP TABLE DailyRate;
GO 

CREATE TABLE DailyRate
(
	 CurrencyCode	INT NOT NULL 
	,ExchangeRate	NUMERIC(8,4)  NULL
	,InsertDate		DATETIME NOT NULL
	,CONSTRAINT PK_CurrencyCode_InsertDate PRIMARY KEY (CurrencyCode, InsertDate)	
);
GO

-- Add a Foreign key Constraint

ALTER TABLE  DailyRate
	ADD CONSTRAINT FK_CurrencyCode FOREIGN KEY (CurrencyCode)
	REFERENCES Currency(CurrencyCode);
GO


/* 
-- Drop or remove table objects using T-SQL (DDL) */ 
-- Do not run this yet, discussion on contraints when deleting tables 

-- DROP TABLE finance.Location

-- Error will occur, you may now run the drop FK constraint above. OR!... 
-- Drop the table referencing the table first, w/c is dbo.Project

-- DROP TABLE finance.Project


IF OBJECT_ID('finance.Location','U') IS NOT NULL   
	DROP TABLE finance.Location;  
GO 


/*
-- Other way to check and drop the existing table
IF EXISTS (
	SELECT	* 
	FROM	sys.tables 
	WHERE	Name ='Location'
)
DROP TABLE Location
*/


-- How To DROP a Constraint (!!DO NOT EXECUTE!!)

ALTER TABLE finance.Project
	DROP CONSTRAINT FK_LocationId
GO



/*

-- Drop the tables from Sample 2
-- DROP TABLE DailyRate;
-- DROP TABLE Currency;

*/
 

-- Did you drop the all the tables? 
-- Now re-execute the whole Demo, because we will be building on top of it, on the next demo.




/*
Rename Constraint:
DROP & ADD Schema
EXEC sp_rename 'finance.DF__Location__Insert__1367E606','finance.DF__Location_InsertDate','OBJECT'
*/
