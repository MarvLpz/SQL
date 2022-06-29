-- Filtering Subjects Without Cost:

USE SQLDemo2014;
GO

--Run this code first to produce null Exchange Rate

UPDATE	dbo.DailyRate
Set		ExchangeRate = NULL 
WHERE	CurrencyCode = 4

-- Check the table

SELECT	* 
FROM	dbo.DailyRate

-- Before

SELECT	CurrencyCode	AS	Code
	   ,ExchangeRate	AS	Rate
FROM	dbo.DailyRate
WHERE	ExchangeRate IS NULL; 
 
-- After
SELECT	CurrencyCode			AS	Code
	   ,ISNULL(ExchangeRate,0)	AS	Rate
FROM	dbo.DailyRate
WHERE	ExchangeRate IS NULL; 
 
SELECT	CurrencyCode			AS	Code
	   ,ISNULL(ExchangeRate,0)	AS	Rate
FROM	dbo.DailyRate;



-- Order from a character data type:

SELECT   CurrencyShortName AS [CURRENCY]
		,CurrencyName AS [ ]   
FROM	 dbo.Currency
ORDER BY CurrencyShortName ASC;
          
-- sort by LastName in ascending order
-- Order from a numeric data type: 

SELECT	 ProjectId
		,ProjectName   
FROM	 finance.Project
ORDER BY ProjectID DESC;
    
-- sort by InstructorId in descending order
-- Order from a derived column:

SELECT		RTRIM(UpdatedBy) +' updated '+ ProjectName AS [Update Record]
FROM		finance.Project
ORDER BY	[Update Record];

-- sort by Name in ascending order  
-- ORDER BY with DISTINCT
/*
Using an ORDER BY with DISTINCT, the column name following the ORDER BY 
should also be included in the SELECT statement: 
*/
 
SELECT DISTINCT UpdatedBy AS [Table Project Administators]
FROM			finance.Project
ORDER BY		UpdatedBy ASC;

-- List of active curreny codes

SELECT DISTINCT CurrencyCode
FROM			dbo.Dailyrate
ORDER BY		CurrencyCode DESC;

-- List of active location codes

SELECT DISTINCT	LocationId
FROM			finance.Project
ORDER BY		LocationId;

