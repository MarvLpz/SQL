
-- Arithmetic Operator
DECLARE	 @number1		numeric(5,2)
		,@number2		numeric(5,2) 
		,@Addition		money
		,@Modulo		int 
		,@ProductDiff	money; 
 
SET		 @number1		=	100.45;
SET		 @number2		=	200.10;

SET		 @Addition		=	@number1 + @number2;
SET		 @Modulo		=	75 % 4;
SET		 @ProductDiff	=	@number2- @number1 * 2;

SELECT	 @Addition;
SELECT	 @Modulo;
SELECT	 @ProductDiff 

SET		 @ProductDiff	=	(@number2 - @number1) * 2;
SELECT	 @ProductDiff 