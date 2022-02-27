UPDATE event
SET
    event_name = ?,
    event_location_id = ?,  
    event_type_id = ?, 
    event_dt = STR_TO_DATE(?,'%m-%d-%Y %h:%i %p'),
    event_duration = ?, 
    event_description = ?
WHERE
	event_id = ?
;