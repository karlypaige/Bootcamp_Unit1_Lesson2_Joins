SELECT
	t.trip_id,
	substr(t.start_date, 1, 10) start_date,
	substr(t.end_date, 1, 10) end_date,
	t.duration,
	w.events
FROM 
	trips t
INNER JOIN 
	weather w
ON substr(t.start_date, 1, 10) = w.Date
	OR substr(t.end_date, 1, 10) = w.Date
WHERE 
	w.events = 'Rain'
GROUP BY t.trip_id
ORDER BY t.duration DESC
LIMIT 3