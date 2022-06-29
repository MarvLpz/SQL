
-- Stored Procedures 
-- is a group of Transact-SQL statements compiled into a single execution plan.


USE HealthCareVendor;
GO

CREATE PROCEDURE sp_InsertEmployee (
	 @EmployeeID	VARCHAR(15)
	,@FirstName		VARCHAR(20)
	,@LastName		VARCHAR(30))
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION  
			INSERT INTO Employee (
				 EmployeeID
				,FirstName
				,LastName )
			VALUES 
				(@EmployeeID	,@FirstName	,@LastName)
	    COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT	 ERROR_NUMBER()		AS	ErrorNumber
				,ERROR_MESSAGE()	AS	ErrorMessage;
	END CATCH
END;
GO



DROP PROCEDURE sproc_InsertProject

-- Error/Exception Handling

CREATE PROCEDURE sproc_InsertProject (
	 @LocationId	INT
	,@ProjectName	VARCHAR(30)
	,@UpdatedBy		VARCHAR(30))
AS
BEGIN 
     SET NOCOUNT ON
     BEGIN TRY
		BEGIN TRANSACTION    -- Start the transaction
			INSERT INTO finance.Project (
				 LocationId
				,ProjectName
				,LastUpdate
				,UpdatedBy )
			VALUES
				(@LocationId	,@ProjectName	,GETDATE()	,@UpdatedBy) 
	    COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	    -- there was an error
		ROLLBACK TRANSACTION  
	    SELECT	 ERROR_NUMBER()		AS	ErrorNumber
				,ERROR_MESSAGE()	AS	ErrorMessage;	   
	END CATCH
END
GO

-- Let's test

sproc_InsertProject '17', 'Petron Mega Plaza','USER055';    -- Try this code, error will occur due to constraint

sproc_InsertProject '2', 'Petron Mega Plaza','USER055';    -- This code will work because there is a '2' location code


SELECT	*
FROM	finance.Project    -- inspect table



-- Retrieving Error Information (Books Online example)
 
CREATE PROCEDURE usp_ExampleProc
AS
	SELECT	*
	FROM	NonexistentTable;
GO
BEGIN TRY
	EXECUTE usp_ExampleProc;
END TRY
BEGIN CATCH
	SELECT	 ERROR_NUMBER()		AS	ErrorNumber
			,ERROR_MESSAGE()	AS	ErrorMessage;
END CATCH;
GO


-- Using TRY..CATCH

CREATE	PROCEDURE sproc_DeleteCurrency
	@CurrencyCode	INT
AS 
BEGIN 
	SET NOCOUNT ON 
	BEGIN TRANSACTION
		BEGIN TRY  
  			DELETE	dbo.Currency 
			WHERE	CurrencyCode = @CurrencyCode
			COMMIT TRANSACTION   
		END TRY 
		BEGIN CATCH  
			ROLLBACK TRANSACTION   
			RETURN ERROR_NUMBER()  	
		END CATCH 
END 
GO

