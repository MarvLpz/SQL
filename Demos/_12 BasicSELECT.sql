
USE SQLDemo2014
GO

-- Tip: Intellisense not working? 
-- SSMS doesn't recognize new schemas and tables... 
-- and puts those ugly red zigzagy underlines?
-- Refresh local cache by using  Ctrl + Shift + R. (wait for a short while)


-- Basic SELECT Statement 

SELECT	*
FROM	SQLDemo2014.finance.Project


SELECT	*
FROM	SQLDemo2014.finance.Location


SELECT	 CurrencyCode
		,CurrencyShortName
		,CurrencyName
		,LastUpdated
FROM	 dbo.Currency


-- Derived Table

SELECT	 TypeID
		,Name     -- A:  column names of DTCarType 
FROM (    
		SELECT	 1				AS TypeID 
				,'Crossovers'	AS Name 
		UNION	ALL 
		SELECT	 2
				,'SUVs'
           
     )	AS	DTCarType ; -- Name of Derived Table  


-- SQL Server 2008 

-- Table Value construction of Derived Table
-- subsets of data in a tabular format.
 
SELECT	 TypeID
		,Name  -- (A) Column names of the derived table  
FROM (    
		VALUES  
			 (1	,'Crossovers')
		 	,(2	,'SUVs')
			,(3	,'Green Cars')
			,((SELECT 4),(SELECT 'Convertible'))	 

      ) AS DTCarType   ---> Name of Derived Table 
  (TypeID, Name) ; --  Declaration of columns (see A) of the Derived Table 


-- SELECT TOP n – SQL Server 2005 and earlier versions

SELECT TOP 5	*
FROM			finance.Project ;
 
SELECT TOP 2	CurrencyShortName
			   ,CurrencyName
FROM			Currency ;


-- SELECT TOP (n) – SQL Server 2005 and latest version to date
 
DECLARE	@setTopN	TINYINT ;
SET		@setTopN	=  3;

SELECT TOP	(@setTopN)	CurrencyShortName
					   ,CurrencyName
FROM					Currency;
  

-- Using Alias

SELECT	CurrencyCode		AS	[Currency]
	   ,ExchangeRate		AS	[Rate]
	   ,ExchangeRate * 1.1  AS	[Selling Rate]
	   ,ExchangeRate * .97  AS	[Buying Rate]
FROM	dbo.DailyRate;


SELECT	CurrencyCode		AS	[Currency Code]
	   ,ExchangeRate + .10	AS [New Rate]
FROM	dbo.DailyRate;



SELECT	LocationName + ', Philippines'   [Location City]
	   ,InsertDate DATE
FROM	finance.Location;



--COLLATION:
---Default SQL_Latin1_General_CP1_CI_AS

SELECT	*
FROM	SQLDemo2014.finance.Project
WHERE ProjectName = 'THE BellAGio'

SELECT	*
FROM	SQLDemo2014.finance.Project
WHERE ProjectName COLLATE Latin1_General_CS_AS = 'THE BellAGio'

SELECT	*
FROM	SQLDemo2014.finance.Project
WHERE ProjectName COLLATE Latin1_General_CS_AS = 'The Bellagio'


--Create a table using collation Latin1_General_CI_AS and add some data to it 
CREATE TABLE CollateTable1
(
    ID INT IDENTITY(1, 1), 
    Text_Desc VARCHAR(100) COLLATE Latin1_General_CI_AS
)
INSERT INTO CollateTable1 (Text_Desc) VALUES ('Chocolate')
INSERT INTO CollateTable1 (Text_Desc) VALUES ('Coffee')
 
--Create a second table using collation Traditional_Spanish_CI_AS and add some data to it 
CREATE TABLE CollateTable2
(
    ID INT IDENTITY(1, 1), 
    Text_Desc VARCHAR(100) COLLATE Traditional_Spanish_CI_AS
)
INSERT INTO CollateTable2 (Text_Desc) VALUES ('Chocolate')
INSERT INTO CollateTable2 (Text_Desc) VALUES ('Coffee')
  
SELECT * FROM CollateTable1 ORDER BY Text_Desc
SELECT * FROM CollateTable2 ORDER BY Text_Desc

GO
