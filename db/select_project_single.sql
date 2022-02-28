SELECT 
	project.project_id as project_id, 
    project_name, 
    project_duration,
    project_type,
    DATE_FORMAT(project_dt, '%Y-%m-%d') as project_date_ymd,
    DATE_FORMAT(project_dt, '%b %d (%a)') as project_date,
    DATE_FORMAT(project_dt, '%l:%i %p') as project_time,
    project_location,
    project_description,
    project_interest
FROM 
	project LEFT JOIN (
		SELECT COUNT(*) as project_interest, project_id 
        FROM project_user_registration
		GROUP BY project_id
	) as project_user_counts ON project.project_id = project_user_counts.project_id,
    project_location, project_type
WHERE
	project.project_location_id = project_location.project_location_id
    and project.project_type_id = project_type.project_type_id
    and project.project_id = ?
LIMIT 1