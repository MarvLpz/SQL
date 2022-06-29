
-- Creation of data using T-SQL (DML)

--SELECT * FROM dbo.DailyRate 
--SELECT * FROM dbo.Currency

USE SQLDemo2014;
GO
 
-- Updating Data in Tables 

UPDATE	dbo.DailyRate 
SET		ExchangeRate = 41.2300
WHERE	CurrencyCode = 2  AND InsertDate = '01/02/2013';
GO

UPDATE	dbo.DailyRate  
SET		ExchangeRate = ExchangeRate + .01;
GO


UPDATE	dbo.Currency
SET		CurrencyName = 'Swiss Franc'
WHERE	CurrencyCode = 5


