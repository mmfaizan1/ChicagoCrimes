--Total Number of Crimes Committed between 2015 to 2020 in chicago
SELECT Count(ID) AS 'Total Crimes Committed'
FROM ChicagoPolice..Crimes



--Crimes vs Arrests

SELECT
	COUNT(ID) AS 'Total Crimes', 	
	(SELECT COUNT(Arrest) FROM ChicagoPolice..Crimes WHERE Arrest='Yes' ) AS Arrested,
	(SELECT COUNT(Arrest) FROM ChicagoPolice..Crimes WHERE Arrest='No' ) AS NotArrested
FROM ChicagoPolice..Crimes

--Types of Crimes Committed
SELECT DISTINCT(PrimaryType) AS 'Type of Crimes' 
FROM ChicagoPolice..Crimes


--Total Number of each Type of Crime Committed
SELECT PrimaryType AS 'Type of Crime', COUNT(*) AS 'Total Crimes'
FROM ChicagoPolice..Crimes
GROUP BY PrimaryType
ORDER BY [Total Crimes] Desc

--Maximum number of crimes by Year
SELECT Year AS Year, COUNT(ID) AS 'Total Crimes'
FROM ChicagoPolice..Crimes
GROUP BY Year
ORDER BY [Total Crimes] DESC 


--Types of Places Crimes Happened on
SELECT DISTINCT(LocationDescription) FROM ChicagoPolice..Crimes

--Crimes by Places
SELECT 
	LocationDescription, PrimaryType, COUNT(LocationDescription) AS TotalCrimes
FROM ChicagoPolice..Crimes
GROUP BY LocationDescription, PrimaryType
ORDER BY COUNT(LocationDescription) DESC

--Domestic Crimes
SELECT Count(*) AS TotalDomesticCrimes
FROM ChicagoPolice..Crimes 
WHERE Domestic = 'Yes'

--Total Domestic Crimes By year
SELECT Year, Count(*) AS TotalDomesticCrimes
FROM ChicagoPolice..Crimes
WHERE Domestic = 'Yes'
GROUP BY Year
ORDER BY TotalDomesticCrimes DESC

--Type of Domestic Crimes Per Year
SELECT Year, PrimaryType, Count(*) AS TotalDomesticCrimes
FROM ChicagoPolice..Crimes
WHERE Domestic = 'Yes'
GROUP BY Year, PrimaryType
ORDER BY Year ASC, TotalDomesticCrimes DESC

--District with Highest Crimes
SELECT District, COUNT(ID) AS TotalCases
FROM ChicagoPolice..Crimes
GROUP BY District
ORDER BY TotalCases DESC

--Community Area with Highest crimes
SELECT CommunityArea, COUNT(ID) AS TotalCases
FROM ChicagoPolice..Crimes
GROUP BY CommunityArea
ORDER BY TotalCases DESC

--Wards with Highest Crimes
SELECT Ward, COUNT(ID) AS TotalCases
FROM ChicagoPolice..Crimes
GROUP BY Ward
ORDER BY TotalCases DESC

SELECT * FROM ChicagoPolice..Crimes


