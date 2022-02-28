UPDATE project
SET
    project_name = ?,
    project_location_id = ?,  
    project_type_id = ?, 
    project_dt = STR_TO_DATE(?,'%m-%d-%Y %h:%i %p'),
    project_duration = ?, 
    project_description = ?
WHERE
	project_id = ?
;