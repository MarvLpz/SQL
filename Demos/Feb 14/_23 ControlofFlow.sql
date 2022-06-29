/*	Control-of-flow: WHILE – BREAK – CONTINUE  */

DECLARE	 @Counter1	INT
		,@Counter2	INT 
		
SET		 @Counter1	= 0   
SET		 @Counter2	= 1

WHILE	 @Counter1	<=  3  --outer loop
BEGIN  
	SELECT	'OUTER: ' + CAST(@Counter1 AS VARCHAR) 
	WHILE	@Counter2	<=  2  -- inner loop
	BEGIN
		SELECT	'INNER: ' + CAST(@Counter1 AS VARCHAR)
		SET @Counter2 = @Counter2 + 1 
		IF	@Counter2 = 2
	    BREAK --exits the inner loop
	    ELSE
        CONTINUE  --continue the inner oop
    END
	SET	@Counter1 = @Counter1 + 1 
END
