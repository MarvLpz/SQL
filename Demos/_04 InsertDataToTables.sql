
-- Sample 1
-- Creation of data using T-SQL (DML)

USE SQLDemo2014;
GO
 
 -- Check the tables first (no magic tricks here) 

SELECT	* 
FROM	finance.Location;
GO

-- Insert Data to Tables ---- INTO is optional  
-- Insert some data inside the Location table 


--Insert one record
INSERT	INTO	finance.Location
VALUES ('1'	,'Taguig', GetDate(), 'USER100')
GO

--insert multiple records
INSERT	INTO	finance.Location
VALUES ('2'	,'Makati'		,GetDate()	,'USER100'),
	   ('3'	,'Quezon City'	,GetDate()	,'USER100'),
	   ('4'	,'Pasay'		,GetDate()	,'USER100')
GO

--Insert using column list
INSERT INTO finance.Location(LocationId,LocationName,InsertDate,InsertedBy)
VALUES   ('5'	,'Mandaluyong' ,GetDate()	,'USER100')
GO


--IDENTITY INSERT
--Check table again
SELECT	*
FROM	 finance.Project
GO

--first record
INSERT	INTO finance.Project (
	 LocationId
	,ProjectName
	,LastUpdate
	,UpdatedBy)
VALUES	(1	,'The Bellagio'	,GETDATE()	,'USER001')
GO

--second record
INSERT	INTO	finance.Project (
	 LocationId
	,ProjectName
	,LastUpdate
	,UpdatedBy)
VALUES
	(2	,'One Central'	,GetDate()	,'USER007');
GO

--multiple records

INSERT	INTO	finance.Project
VALUES
	(2	,'Olympic Heights'	,GetDate()	,'USER007'),
	(2	,'Paseo Parkview'	,GetDate()	,'USER007'),
	(1	,'One Orchard'		,GetDate()	,'USER007'),
	(2	,'Lafayette'		,GetDate()	,'USER007'),
	(3	,'One Eastwood'		,GetDate()	,'USER007'),
	(4	,'Newport'			,GetDate()	,'USER007');     
GO



--using SET IDENTITY_INSERT ON , 
SET	IDENTITY_INSERT	finance.Project	ON 

INSERT	INTO finance.Project (
	 ProjectId
	,LocationId
	,ProjectName
	,LastUpdate
	,UpdatedBy)
VALUES
	(110	,1	,'Bonifacio Heights', GETDATE(), 'USER001')


SET	IDENTITY_INSERT finance.Project OFF;
GO

-- End the script using SET IDENTITY_INSERT OFF





-- SAMPLE 2


-- SELECT * FROM dbo.Currency

INSERT	INTO	dbo.Currency
VALUES 
	(1	,'PHP'	,'Philippine Peso'	,'01/02/2013') ;
GO

-- Insert Currency records 
INSERT	INTO	dbo.Currency
VALUES	
	 (2	,'USD'	,'US Dollar'		,GETDATE())
	,(3	,'AUD'	,'Australian Dollar',GETDATE())
	,(4	,'JPY'	,'Japanese Yen'		,GETDATE())
	,(5	,'CHF'	,'Swiss Frank'		,GETDATE())
	,(6	,'INR'	,'Indian Rupee'		,GETDATE());
GO

-- Insert DailyRate records
INSERT	dbo.DailyRate 
VALUES 
	 (2	,40.5555	,'01/02/2013')
	,(3	,20.7850	,'01/02/2013')
	,(4	,31.1134	,'01/02/2013')
	,(2	,40.4001	,'01/03/2013')
	,(3	,21.9000	,'01/03/2013')
	,(4	,31.2000	,'01/03/2013')
	,(2	,40.5555	,'01/04/2013') ;
GO

-- SELECT * FROM dbo.DailyRate



-- Testing Composite Index


-- Insert Record for USD for January 8, 2013
INSERT	DailyRate
VALUES 
	(2	,40.5555	,'01/08/2013')
GO


-- Insert another record for USD with different amount for January 8, 2013 --Error will occur
INSERT	DailyRate 
VALUES 
	(2	,41.5234	,'01/08/2013')
GO


-- Insert another record for USD with same amount for January 9, 2013 
-- This will work because Composite Primary Index, which composes colums CurrencyCode and InsertDate was used
INSERT	DailyRate 
VALUES 
	(2	,41.5234	,'01/09/2013')
GO

--- SELECT  * FROM  dbo.DailyRate