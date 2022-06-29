
-- Filtering and Ordering Data  

USE SQLDemo2014;

-- Search for in-active currencies

SELECT	CurrencyCode
	   ,CurrencyShortName
	   ,CurrencyName 
FROM	dbo.Currency 
WHERE	CurrencyCode 
		NOT IN  (  
					SELECT	CurrencyCode
					FROM	dbo.DailyRate	
				) ;
SELECT	* 
FROM	dbo.DailyRate


-- Besides using an NOT IN, 
-- you can also use: =, >, <, <=, >= ,   LIKE , BETWEEN, IN, EXISTS, NOT EXISTS


SELECT	CurrencyCode	AS	Code
FROM	dbo.DailyRate
WHERE	InsertDate	BETWEEN	'11/01/2012' AND '03/01/2013';

SELECT	CurrencyCode	AS	Code
FROM	dbo.DailyRate
WHERE	InsertDate	>	'01/01/2012' ;

SELECT	CurrencyCode	AS	Code
FROM	dbo.DailyRate
WHERE	InsertDate	>=	'01/01/2012' ;

-- First letter provided with any characters accepted after

SELECT	ProjectName	AS	Project
	   ,UpdatedBy	AS	Operator
FROM	finance.Project P  
WHERE	(ProjectName LIKE 'P%' OR  ProjectName LIKE 'N%') OR (UpdatedBy ='USER001') ;


-- Example 2: Any first letter following second letter N and any characters after

SELECT	ProjectName AS	Project
	   ,UpdatedBy Operator
FROM	finance.Project P  
WHERE	ProjectName	LIKE '_N%';  


-- Example 3: First characters starting Q or P 

SELECT	LocationName	AS	[Philippine City]
FROM	finance.Location	L
WHERE	LocationName	LIKE '[QP]%' ;
GO

