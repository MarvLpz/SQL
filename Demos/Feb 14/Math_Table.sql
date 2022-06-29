
USE SQLDemo2012;
GO

IF OBJECT_ID('dbo.Math','U') IS NOT NULL
	DROP TABLE dbo.Math;
GO

CREATE TABLE Math (
	 KeyId		INT NOT NULL
	,ValueData	DECIMAL(5,2) NULL
	,ValueName	NVARCHAR(20) NOT NULL
);

USE SQLDemo2012;
GO

ALTER TABLE		Math
ALTER COLUMN	ValueName	NVARCHAR(30);


ALTER TABLE		Math
ADD CONSTRAINT	CKValueName
CHECK(ValueData > 0)


INSERT INTO Math /* KeyId, ValueData, ValueName */
VALUES
	 ('1',10	,'One')
	,('1',20	,'One')
	,('2',5	,'Two')
	,('2',140,'Two')
	,('3',8	,'Three')
	,('3',23,'Three')
	,('4',87,'Four')
	,('4',NULL,'Four');
GO

SELECT *
FROM Math

SELECT MIN(ValueData) AS MinValue
FROM MATH

SELECT MAX(ValueData) AS MaxValue
FROM MATH

SELECT AVG(ValueData) AS AveValue
FROM MATH

SELECT SUM(ValueData) AS Total
FROM MATH
