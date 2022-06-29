-- SUBQUERIES

-- TABULAR returns multiple rows:
USE HealthCareCustom 
GO

SELECT	 FirstName
		,Age
FROM	 Enrollee
WHERE	 EnrolleeId NOT IN
		 (SELECT	EnrolleeId 
		  FROM		MedicalClaim)


-- Correlated Subqueries 

SELECT	 EnrolleeId
		,Lastname
		,Firstname 
FROM	 Enrollee enr
WHERE	 EXISTS 
		 (SELECT	*
		  FROM	MedicalClaim medclaim
          WHERE	Year(medclaim.ClaimDate) = 2009 
          AND enr.EnrolleeId = medclaim.EnrolleeId)



-- SCALAR returns a single row: 
USE HealthCareVendor 
GO

SELECT	 househld.HouseholdId
		,househld.Lastname
		,househld.Firstname
		,(SELECT	MAX(dep.DateofBirth)
		  FROM		Dependent dep
		  WHERE		househld.HouseholdId = dep.HouseholdId) AS DepYoungestBdate
FROM	 Household househld

GO