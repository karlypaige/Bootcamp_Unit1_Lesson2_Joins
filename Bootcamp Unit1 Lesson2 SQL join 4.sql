 -- What's the length of the longest trip for each day it rains anywhere? 

 --create a sub-table containing only the rows for the days it rained.
 WITH 
	longest_trip
 AS (
 SELECT 
	t.trip_id id,
	w.Date date, 
	t.duration duration
FROM 
	trips t
 JOIN 
	weather w
 ON 
	substr(t.start_date, 1, 10) = w.Date
	OR substr(t.end_date, 1, 10) = w.Date
 WHERE 
	w.Events = 'Rain'
 GROUP BY 
	date, id
)

--join sub-table to itself to select onlt the maximum values in the duration column
SELECT *
FROM longest_trip WHERE (id, date, duration) IN
( SELECT id, date, MAX(duration)
  FROM longest_trip
  GROUP BY date
  ORDER BY date
)