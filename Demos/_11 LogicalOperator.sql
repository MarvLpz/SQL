
-- Logical Operator

USE SQLDemo2014
GO

-- BETWEEN , AND 

SELECT	*
FROM	dbo.DailyRate

SELECT	*
FROM	finance.Location


SELECT	* 
FROM	dbo.DailyRate
WHERE	ExchangeRate	BETWEEN 40.00 AND 50.00;

SELECT	* 
FROM	dbo.DailyRate
WHERE	ExchangeRate <= 40 AND ExchangeRate >= 50;


SELECT	* 
FROM	finance.Location
WHERE	InsertDate BETWEEN '11/01/2012' AND GETDATE();


-- LIKE , OR 

SELECT	* 
FROM	finance.Project
WHERE	(ProjectName LIKE '%N%') OR  (ProjectName LIKE '%IO');

-- TIP: always place the ‘%‘ at the end of the character 
-- or words to search from for better/faster performance

-- IN 

SELECT	* 
FROM	dbo.Currency
WHERE	CurrencyShortName IN ('U%!@#$!@#$','JPY','CAR','INR') ;
