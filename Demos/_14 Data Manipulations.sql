-- Data Manipulation

-- Scalar Functions 
SELECT	GETDATE();


-- Strings
SELECT	'String Constant'; 


-- Count the length of the string. 
-- How many characters does the string have? 
SELECT	'Mabuhay!'			AS	[String]
	   ,LEN('Mabuhay!')		AS	[Without leading space]
	   ,LEN(' Mabuhay!')	AS	[With leading space] ;


-- Casing of characters
SELECT	'teST'			AS Before
	   ,UPPER('teST')	AS After -- TEST;  /* upper case */
SELECT	'aBc'			AS Before
	   ,LOWER('aBc')	AS After --  abc ;  /* lower case */ 


-- Removal of trailing/white spaces - ltrim (left) and rtrim(right):
DECLARE	@strLine	varchar(50) ;
SET		@strLine	= '              xxXxx         ' ;
SELECT	LTRIM(@strLine) + 'LEFT TRIM'  ; 
SELECT	RTRIM(@strLine) + 'RIGHT TRIM' ;  
SELECT	LTRIM(RTRIM(@strLine)) + 'RIGHT and LEFT TRIM';


/* How to limit the number of characters from the string : */
SELECT	RIGHT('The quick brown fox.', 5) ;
SELECT	LEFT('The quick brown fox.', 5) ;
SELECT	SUBSTRING('The quick brown fox.', 5, 6) ;



-- Position
-- CHARINDEX returns the starting position of a string to be found
SELECT	CHARINDEX('ate', 'Validate'); 

-- 'ate' found in what position?    

-- REPLACE or REVERSE a string:
SELECT	REPLACE('abcdeFcde','cde','xxx') ;
SELECT	REVERSE('PARTS') ;



-- Convert number to string data type:

DECLARE	@num	int ;
SET		@num	=	123;
SELECT	STR(@num); -- converts to character data type

-- STUFF
-- Inserts 1234567890 to ABCDEF to a given position 2, 
-- replacing 1 character, notice B will not return

SELECT	STUFF('ABCDEF',2,1,'1234567890')

-- Inserts 1234567890 to ABCDEF to a given position 2, 
-- replacing 1 character, notice B will not return

SELECT	STUFF('Cybergate 1',1,9,'CG')	AS	Location



-- Configuration


-- Version information of the installed SQL Server: 

SELECT	@@VERSION;

-- Language used of the installed SQL Server:

SELECT	@@LANGUAGE;

-- Server name with its instance name: 

SELECT	@@SERVERNAME

-- Server Property :

SELECT	SERVERPROPERTY('ProductVersion')	AS	ProductVersion,
		SERVERPROPERTY('ProductLevel')		AS	ProductLevel,
        SERVERPROPERTY('Edition')			AS Edition,
        SERVERPROPERTY('EngineEdition')		AS EngineEdition;
 
-- Metadata
-- To know the current database you are in: 

SELECT DB_NAME();

-- Returns the object identification number:


-- Date
-- Returns the current date:

DECLARE	@CurrentDate DATE ;                
SET		@CurrentDate =  GETDATE();
SELECT	@CurrentDate;

GO

-- DATENAME - string description of the date provided
SELECT DATENAME(M, GETDATE()) AS [Current Month] ;



-- DATEADD - Add a DAY, a MONTH and 2 YEARS respectively to the current date:

DECLARE  @CurrentDate DATETIME;   
SET		 @CurrentDate =  GETDATE();
SELECT	 DATEADD (DAY	,1	,@CurrentDate)	AS [Plus one Day]
		,DATEADD (MONTH	,1	,@CurrentDate)  AS [Plus one Month]                
		,DATEADD (YEAR	,2	,@CurrentDate)  AS [Plus two Years]
		,DATEADD (MONTH	,-2	,@CurrentDate)  AS [Minus two Months];



-- Returns current Greenwich Mean Time (UTC):\

SELECT GETUTCDATE ();

-- DATEDIFF – difference between two dates. 
-- How many days until Christmas?

SELECT DATEDIFF (D, GETDATE(), '12/25/2015') ;


-- DATEPART – returns an integer of the specified parameter date:
SELECT  DATEPART		(DAY	,GETDATE())	AS 'DAY No.'
       ,DATEPART		(MONTH	,GETDATE())	AS 'MONTH No.'
       ,DATEPART		(YEAR	,GETDATE())	AS 'YEAR No.'  
       ,DAY				(GETDATE())			AS 'DAY'
       ,MONTH			(GETDATE())			AS 'MONTH'  
       ,YEAR			(GETDATE())			AS 'YEAR';



/* @@ROWCOUNT – returns the number of rows affected after  the execution statement: */

USE SQLDemo2014
GO;

SELECT 'Test';
SELECT @@ROWCOUNT ;

SELECT	 ProjectName
FROM	 finance.Project
ORDER BY LastUpdate;
SELECT @@ROWCOUNT;

/*
TEST
SELECT @@ERROR
*/

-- Use CAST for simple conversion such as number to string or  vice versa:

SELECT CAST(123 AS varchar(3)) ;
SELECT CAST('123' AS int) ;

-- System with Date and Time functions
-- Date Format	SQL Statement

-- MM/DD/YYYY

SELECT CONVERT(VARCHAR(10), GETDATE(), 101) AS [MM/DD/YYYY] ;

-- YYYYMMDD
SELECT CONVERT(VARCHAR(8), GETDATE(), 112) AS [YYYYMMDD] ;

-- Month YYYY 
SELECT DATENAME(MM, GETDATE()) + ' ' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS [Month YYYY] ;

-- Month DD, YYYY
SELECT DATENAME(MM, GETDATE()) + RIGHT(CONVERT(VARCHAR(12), GETDATE(), 107), 9) AS [Month DD, YYYY] ;

-- DD-Mon-YY */
SELECT REPLACE(CONVERT(VARCHAR(9), GETDATE(), 6), ' ', '-') AS [DD-Mon-YY] ;