/* Comparison */
USE SQLDemo2014 
GO

SELECT	*
FROM	dbo.DailyRate

SELECT	*
FROM	dbo.DailyRate
WHERE	ExchangeRate !> 40.00;
 
SELECT	* 
FROM	dbo.DailyRate
WHERE	CurrencyCode = 3;

SELECT	* 
FROM	dbo.DailyRate
WHERE	ExchangeRate < 40.00;


SELECT	* 
FROM	dbo.DailyRate
WHERE	ExchangeRate > 10.00 AND CurrencyCode = 4; 



SELECT	* 
FROM	finance.Project
WHERE	ProjectName LIKE 'ONE%';



DECLARE	@Name	varchar(30);
SET		@Name	=	'Lafayette';

SELECT	* 
FROM	finance.Project
WHERE	ProjectName <> @Name;