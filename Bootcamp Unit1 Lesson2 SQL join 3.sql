SELECT 
	s.dockcount, 
	COUNt(t.start_station)
FROM 
	stations s
JOIN 
	trips t
ON s.name = t.start_station
GROUP BY
	t.start_station  
ORDER BY 
	s.dockcount