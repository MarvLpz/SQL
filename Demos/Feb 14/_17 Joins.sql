-- JOINS

USE SQLDemo2014
GO

-- INNER JOIN 
SELECT		 drate.InsertDate	AS	[Date]
			,cur.CurrencyShortname
			,drate.ExchangeRate
FROM		 DailyRate drate
INNER JOIN	 Currency cur
ON			 drate.CurrencyCode = cur.CurrencyCode
        
SELECT	* FROM Currency
SELECT	* FROM DailyRate


-- INNER JOIN with WHERE

SELECT	*
FROM	dbo.Client;

SELECT	*
FROM	dbo.Account;

SELECT		 accnt.AccountNumber
			,accnt.ClientNumber
			,AccountType
			,AvailableBalance
			,CASE ClientType 
			 WHEN 'I'	THEN	ClientFirstName + ' '  + ClientLastName 
			 ELSE ClientBusinessName
			 END	AS	Client
FROM		 dbo.Account accnt
INNER JOIN	 dbo.Client client 
ON			 accnt.ClientNumber = client.ClientNumber
WHERE		 AccountType	=	'SA';



-- LEFT OUTER JOIN
SELECT			 drate.InsertDate	as	[Date]
				,cur.CurrencyShortname
				,drate.ExchangeRate
FROM			 Currency cur
LEFT OUTER JOIN  DailyRate drate  
ON				 drate.CurrencyCode = cur.CurrencyCode;
-- PHP, CHF and INR will 'return' even there is no matching data from DailyRatge Table


-- RIGHT OUTER JOIN */
-- Lets drop the constraint so we can insert a client without account
ALTER	TABLE		dbo.Client 
DROP	CONSTRAINT	Client_CK_ClientNumber_01
-- Let's insert the Client Name without Account
INSERT	Client
VALUES
	(123	,'Manny'	,'Uy'	,'No'	,NULL	,'Manila'	,'01/01/1973'	,'I')


SELECT				 AccountNumber
					,accnt.ClientNumber
					,AccountType
					,AvailableBalance
					,CASE	ClientType 
					 WHEN	'I'	THEN	ClientFirstName + ' '  + ClientLastName 
					 ELSE	ClientBusinessName
					 END	AS	Client 
FROM				 Account	accnt
RIGHT OUTER JOIN	 Client client 
ON					 accnt.ClientNumber = client.ClientNumber
-- Notice that Mr. Manny No 'returned' even there is no matching record from Account table


-- Compare it with LEFT OUTER JOIN 
SELECT			 AccountNumber
				,accnt.ClientNumber
				,AccountType
				,AvailableBalance
				,CASE	ClientType 
				 WHEN	'I'	THEN	ClientFirstName + ' '  + ClientLastName 
				 ELSE	ClientBusinessName
				 END	AS	Client 
FROM			 Account	accnt
LEFT OUTER JOIN	 Client	client 
ON				 accnt.ClientNumber = client.ClientNumber
-- Mr. No, Manny did not 'return'


-- FULL JOIN
-- Lets add an account number without a client for this demo
-- Lets drop the constraint first
ALTER	TABLE	Account 
DROP	CONSTRAINT	Account_FK_ClientNumber
INSERT	Account
VALUES	
	(2401000010	,8000000099	,'CA'	,0	,401)

-- Let's see the result

SELECT		 AccountNumber
			,accnt.ClientNumber
			,AccountType
			,AvailableBalance
			,CASE	ClientType 
			 WHEN	'I'	THEN	ClientFirstName + ' '  + ClientLastName 
			 ELSE ClientBusinessName
			 END	AS	Client 
FROM		 Account	accnt
FULL JOIN	 Client	client 
ON			 accnt.ClientNumber = client.ClientNumber
-- Notice that FULL join combiles the effect of RIGHT OUTER and LEFT OUTER JOINS
-- It returns record(s) even if there is no mathing records from right against left and vice versa


-- Compare it with  LEFT JOIN
SELECT		 AccountNumber
			,accnt.ClientNumber
			,AccountType
			,AvailableBalance
			,CASE	ClientType 
			 WHEN	'I'	THEN	ClientFirstName + ' '  + ClientLastName 
			 ELSE ClientBusinessName
			 END AS Client 
FROM		 Account accnt
LEFT JOIN	 Client	client 
ON			 accnt.ClientNumber = client.ClientNumber

-- Compare it with  RIGHT JOIN
SELECT		 AccountNumber
			,accnt.ClientNumber
			,AccountType
			,AvailableBalance
			,CASE	ClientType 
			 WHEN	'I'	THEN	ClientFirstName + ' '  + ClientLastName 
			 ELSE	ClientBusinessName
			 END	AS	Client 
FROM		 Account	accnt
RIGHT JOIN	 Client	client
ON			 accnt.ClientNumber = client.ClientNumber


SELECT	*
FROM	dbo.Client;

SELECT	*
FROM	dbo.Account;