SELECT 
	project.project_id as project_id, 
    project_name, 
    project_location_id,
    project_type_id,
    DATE_FORMAT(project_dt, '%m-%d-%Y') as project_date_mdy,
    DATE_FORMAT(project_dt, '%l:%i %p') as project_time,
    project_duration,
    project_description
FROM 
	project 
WHERE
	project.project_id = ?
LIMIT 1