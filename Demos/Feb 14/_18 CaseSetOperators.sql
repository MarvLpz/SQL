-- Using CASE

USE	HealthCareCustom 
GO

SELECT	 FirstName + ' ' + LastName	AS	EnrolleeName
		,CASE	 Gender 
			WHEN	'F' THEN 'Female'
			WHEN	'M' THEN 'Male'
		 ELSE	'Unknown'
		 END AS	Gender
		, Age 
FROM	 Enrollee
GO 


SELECT	 TransactionId
		,CASE 
			WHEN	RoomandBoardDays >  20	THEN 'More than 20 days'
 			WHEN	RoomandBoardDays <= 20 and RoomandBoardDays > 10  THEN 'More than 10 days'
		 ELSE	'10 days and below'
		 END AS	BoardDays 
FROM MedicalClaim;  
GO


-- Using UNION 

USE	HealthCareVendor 
GO

SELECT	 'Column1'
		,'Column2' 
--FROM	 Household  

UNION ALL

SELECT	 Firstname
		,Lastname
FROM	 Dependent
GO 


-- Using UNION ALL

USE	HealthCareVendor 
GO


SELECT	 Firstname
		,Lastname 
FROM	 Household  

UNION

SELECT	 Firstname
		,Lastname
FROM	 Dependent

