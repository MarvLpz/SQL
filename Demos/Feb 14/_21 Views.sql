-- Views
-- Standard Views: result is not stored in the database

USE SQLDemo2014
GO

-- Sample 1

CREATE VIEW	vProductMarketPrice 
AS  

SELECT		 CASE	ProductType 
			 WHEN	'R'	THEN	'REGULAR'
			 WHEN	'S'	THEN	'SPECIAL'
			 ELSE	'UNKNOWN'
			 END AS	Category
			,ProductName			AS	[Name of Product]
			,ProductPrice	*	1.1	AS	Price                                                                     
FROM		 dbo.Product
GO;



-- Sample 2

CREATE	VIEW	vProjectList
AS

SELECT DISTINCT  ProjectName	AS	Project
				,LocationName	AS	Area 
				 
FROM			 finance.Project	proj 
LEFT JOIN		 finance.Location	loc 
ON				 proj.LocationId = loc.LocationId
GO;


SELECT	*
FROM	vProjectList








