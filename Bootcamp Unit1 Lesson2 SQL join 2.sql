-- which station is full most often

WITH 
	availability
AS (
	SELECT  
		stns.station_id station,
		((CAST(stts.bikes_available as FLOAT)/stns.dockcount)*100) percent
	FROM
		stations stns
	JOIN 
		status stts
	ON stns.station_id = stts.station_id
)

SELECT 
	avail.percent percent,
	COUNT(avail.percent) frequency,
	stns.name name
FROM 
	availability avail
JOIN 
	stations stns
ON stns.station_id = avail.station

GROUP BY    
	stns.name, 
	avail.percent 
ORDER BY 
	percent DESC,
	frequency DESC
LIMIT 1  