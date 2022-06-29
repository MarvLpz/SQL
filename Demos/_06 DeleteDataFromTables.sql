
-- Creation of data using T-SQL (DML)

USE SQLDemo2014;
GO
 
--Check the table
--SELECT * FROM finance.Project
--SELECT * FROM dbo.DailyRate
--SELECT * FROM dbo.Currency

-- Deleting Data From Tables
 
DELETE	FROM finance.Project;   -- FROM is optional
GO


DELETE	dbo.DailyRate
WHERE	CurrencyCode = 2;
GO


DELETE	dbo.DailyRate


-- Drop the constraint in order to use the 
-- TRUNCATE TABLE command in the Student table


ALTER	TABLE	DailyRate 
	DROP CONSTRAINT	FK_CurrencyCode  
GO

TRUNCATE	TABLE	dbo.Currency;  

/*  we used the TRUNCATE TABLE here so that the Student           
	will reset back to its original seeding sequence, not 
	based from the previous id of the last inserted    
	StudentId   		

NOTE: Disabling the constraint will not work for TRUNCATE TABLE being
referenced by a FOREIGN KEY constraint 
  
*/	
GO

-- Add the constraint again to create referential integrity 
ALTER	TABLE	DailyRate
	ADD	CONSTRAINT	FK_CurrencyCode	FOREIGN KEY (CurrencyCode)
	REFERENCES	Currency(CurrencyCode);
GO



DELETE	finance.Project;
GO

TRUNCATE TABLE finance.Project;
GO

-- Please Re-execute Insert data scripts from Demo 04
