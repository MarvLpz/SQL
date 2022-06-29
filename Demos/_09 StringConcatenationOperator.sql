
-- String Concatenation

SELECT 'Black' + SPACE(1) + 'and' + SPACE(1) + 'White';


-- You can concatinate two or more different column types by using 
-- convert/cast/str commands for you to have the same column type before concatinating.
-- Sample. Convert NUMERIC to CHAR Type



DECLARE	@String1	VARCHAR(10), 
		@Count		DECIMAL(18,2);
SET		@String1	='Count: ';
SET		@Count		= 500;
SELECT	@String1 + ' ' +  STR(@Count);


-- You can also specify the length and the number of decimal places.
-- STR(value,length,decimal place) length: includes decimal point (.); default 10 char

SELECT	STR(123.45, 6, 2);
GO

---------

USE SQLDemo2014
GO

SELECT	'Project: '	+	RTRIM(ProjectName)	+	'/Inputted by: '	+	UpdatedBy
FROM	finance.Project;


