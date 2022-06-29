
-- T-SQL Operators 

-- SQL Server 2005 and earlier versions: 
-- Declare variable and assign value 
-- ps


--one variable
DECLARE	@StrName		varchar(20) 
SET		@StrName	=	'Peter Pan' 
SELECT	@StrName;


--multiple variables
DECLARE	@FName	varchar(20) 
DECLARE	@LName	varchar(20) 
SET		@FName	=	'Juan' 
SET		@LName	=	'Dela Cruz'
SELECT	@Fname;
SELECT	@Lname;


--
DECLARE	@FirstNum	int, 
		@SecondNum	int
SET		@FirstNum	= 10 
SET		@SecondNum	= 20
SELECT	@FirstNum,
		@SecondNum ;
GO


-- SQL Server 2008: 
-- Declare variable and assign value

--one variable
DECLARE	@StrName	varchar(20)	= 'John Doe' 
SELECT	@StrName
 

 --multiple variables
DECLARE	@FName	varchar(20)	=	'Juan' 
DECLARE	@LName	varchar(20)	=	'Dela Cruz'

SELECT	@Fname
SELECT	@Lname;

--
DECLARE	@FirstNum	int	=	10, 
		@SecondNum	int	=	20

SELECT	@FirstNum, @SecondNum ;




-- Compound Operators (Transact-SQL): 

/*	+= (Add EQUALS)		*/
DECLARE	@x1	int = 27;
SET		@x1	+=	2 ;
SELECT	@x1	AS	Added_2;


/*	-= (Subtract EQUALS)	*/
DECLARE	@x2	int	=	27;
SET		@x2	-= 2 ;
SELECT	@x2	AS	Subtracted_2;


/*	*= (Multiply EQUALS)	*/
DECLARE	@x3	int	=	27;
SET		@x3	*=	2 ;
SELECT	@x3	AS	Multiplied_by_2; 


/*	/= (Divide EQUALS)		*/
DECLARE	@x4	int	=	27;
SET		@x4	/=	2 ;
SELECT	@x4	AS	Divided_by_2;



/*	%= (Modulo EQUALS) 		*/
DECLARE	@x5	int	=	27;
SET		@x5	%=	2 ;
SELECT	@x5	AS	Modulo_of_27_divided_by_2;


/*	&= (Bitwise AND EQUALS) 	*/
DECLARE	@x6	int	=	9;
SET		@x6	&=	13 ;
SELECT	@x6	AS	Bitwise_AND;


/*	^= (Bitwise Exclusive OR EQUALS) 	*/
DECLARE	@x7	int	=	27;
SET		@x7	^=	2 ;
SELECT	@x7	AS	Bitwise_Exclusive_OR;


/*	|= (Bitwise OR EQUALS) 		*/
DECLARE	@x8	int	=	27;
SET		@x8	|=	2 ;
SELECT	@x8	AS	Bitwise_OR;
