INSERT INTO event
        (`event_name`, `event_location_id`, `event_type_id`, `event_dt`, `event_duration`, `event_description`) 
VALUES 
        (?, 
        ?, 
        ?, 
        STR_TO_DATE(?, '%m-%d-%Y %h:%i %p'), 
        ? ,
        ?);
