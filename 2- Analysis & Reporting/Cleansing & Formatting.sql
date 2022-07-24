SELECT * FROM ChicagoPolice..Crimes

SELECT s.name AS schema_name FROM sys.schemas s





--------------Updating ID Column----------------------------------------------------------------
--Converting ID column datatype
ALTER TABLE ChicagoPolice..Crimes 
ALTER COLUMN ID int




--------------Updating Arrest Column----------------------------------------------------------------
--Converting Arrest column datatype
ALTER TABLE ChicagoPolice..Crimes 
ALTER COLUMN Arrest nvarchar(10)

-- To check if there is another value apart from 0 and 1
SELECT DISTINCT(Arrest) From ChicagoPolice..Crimes

-- If Arrest = 0 then No, If Arrest=1 Then Yes

UPDATE ChicagoPolice..Crimes 
SET Arrest = 
	(
	CASE
		WHEN Arrest=0 Then 'No'
		WHEN Arrest=1 Then 'Yes'
		END
	)





--------------Updating Domestic Column----------------------------------------------------------------
--Converting Domestic column datatype
ALTER TABLE ChicagoPolice..Crimes 
ALTER COLUMN Domestic nvarchar(10)

-- To check if there is another value apart from 0 and 1
SELECT DISTINCT(Domestic) From ChicagoPolice..Crimes

-- If Arrest = 0 then No, If Arrest=1 Then Yes

UPDATE ChicagoPolice..Crimes 
SET Domestic = 
	(
	CASE
		WHEN Domestic=0 Then 'No'
		WHEN Domestic=1 Then 'Yes'
		END
	)


--------------Converting Beat, District, Ward, Community Area, year to int----------------------------------------------------------------
--Altering Columns
ALTER TABLE ChicagoPolice..Crimes
ALTER COLUMN Beat int

ALTER TABLE ChicagoPolice..Crimes
ALTER COLUMN District int

ALTER TABLE ChicagoPolice..Crimes
ALTER COLUMN Ward int

ALTER TABLE ChicagoPolice..Crimes
ALTER COLUMN CommunityArea int

ALTER TABLE ChicagoPolice..Crimes
ALTER COLUMN Year int



--CHECKING DATA TYPE OF COLUMN
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_SCHEMA = 'dbo' AND
     TABLE_NAME   = 'Crimes'
