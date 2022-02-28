INSERT INTO project
        (`project_name`, `project_location_id`, `project_type_id`, `project_dt`, `project_owner`, `project_dt_proposed`, `project_description`) 
VALUES 
        (?, 
        ?, 
        ?, 
        STR_TO_DATE(?, '%m-%d-%Y %h:%i %p'), 
        ? ,
        STR_TO_DATE(?, '%m-%d-%Y'),
        ?);
