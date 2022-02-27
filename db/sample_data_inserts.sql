INSERT INTO `event_type` (`event_type`) VALUES ('Main');
INSERT INTO `event_type` (`event_type`) VALUES ('Workshop');
INSERT INTO `event_type` (`event_type`) VALUES ('Talk');
INSERT INTO `event_type` (`event_type`) VALUES ('Food');
INSERT INTO `event_type` (`event_type`) VALUES ('Activity');

-- Or more concisely
-- INSERT INTO `event_type` (`event_type`) VALUES ('Main'), ('Workshop'), ('Talk'), ('Food'), ('Activity');


INSERT INTO `event_location` (`event_location`) VALUES ('Auditorium');
INSERT INTO `event_location` (`event_location`) VALUES ('Gym');
INSERT INTO `event_location` (`event_location`) VALUES ('Room 138A');
INSERT INTO `event_location` (`event_location`) VALUES ('Room 138B');
INSERT INTO `event_location` (`event_location`) VALUES ('Room 136');
INSERT INTO `event_location` (`event_location`) VALUES ('Lower Cafe');

-- Or more concisely
-- INSERT INTO `event_location` (`event_location`) VALUES ('Auditorium'), ('Gym'),('Room 138A'), ('Room 138B'), ('Room 136'),('Lower Cafe');


INSERT INTO event
        (`event_name`, `event_location_id`, `event_type_id`, `event_dt`, `event_duration`, `event_description`) 
VALUES 
        ('Opening Ceremony', (SELECT event_location_id from event_location where event_location = 'Auditorium'), (SELECT event_type_id from event_type where event_type = 'Main'), '2021-05-02 10:30:00', 25, 'The opening ceremony will be rad! Don\'t miss it. Or you\'re technically late.'),
        ('Hacktime',  (SELECT event_location_id from event_location where event_location = 'Gym'), (SELECT event_type_id from event_type where event_type = 'Main'), '2021-05-02 11:00:00', NULL, 'Hacking happens all day, all night. Consider the gym home base.'),
        ('Presentations and Judging',  (SELECT event_location_id from event_location where event_location = 'Gym'), (SELECT event_type_id from event_type where event_type = 'Main'), '2021-05-03 9:00:00', 30, 'Time to show your project to the judges! Be at your table with your team - and some duct tape, just in case.'),
        ('Closing Awards Ceremony',  (SELECT event_location_id from event_location where event_location = 'Auditorium'), (SELECT event_type_id from event_type where event_type = 'Main'), '2021-05-03 11:00:00', 30, 'We wrap it all up with some awards.'),

        ('Beginner HTML/CSS/JS',  (SELECT event_location_id from event_location where event_location = 'Room 138A'), (SELECT event_type_id from event_type where event_type = 'Workshop'), '2021-05-02 12:30:00', 90, 'Never done web dev before? Jump start your first static web project with us.'),
        ('Basic Hosting with Github Pages',  (SELECT event_location_id from event_location where event_location = 'Room 138A'), (SELECT event_type_id from event_type where event_type = 'Workshop'), '2021-05-02 17:30:00', 45, 'Use Github Pages to host a static web project. No prior experience with Git or Github necessary.'),
        
        ('Introduction to Express for Web Dev',  (SELECT event_location_id from event_location where event_location = 'Room 138B'), (SELECT event_type_id from event_type where event_type = 'Workshop'), '2021-05-02 12:30:00', 75, 'Learn how to make basic web servers with NodeJS and Express'),
        ('SQL Crash Course',  (SELECT event_location_id from event_location where event_location = 'Room 138B'), (SELECT event_type_id from event_type where event_type = 'Workshop'), '2021-05-02 14:30:00', 60, 'Learn justtt enough SQL to set up a database for your next project.'),
        ('Handlebars for Templating (Express Pt 2A)',  (SELECT event_location_id from event_location where event_location = 'Room 138B'), (SELECT event_type_id from event_type where event_type = 'Workshop'), '2021-05-02 16:00:00', 45, 'Explore the power of server-side templating with Handlebars'),
        ('Auth with Google Auth (Express Pt 2B)',  (SELECT event_location_id from event_location where event_location = 'Room 136'), (SELECT event_type_id from event_type where event_type = 'Workshop'), '2021-05-02 16:00:00', 45, 'Add user logins via Google to your Express web project!'),

        ('White hat, black hat',  (SELECT event_location_id from event_location where event_location = 'Auditorium'), (SELECT event_type_id from event_type where event_type = 'Talk'), '2021-05-02 19:00:00', 45, 'Hear from a former NSA hacker about the good, the bad, and the sketchy in the world of hacking (and general development).'),
        ('Planning the next HackBCA',  (SELECT event_location_id from event_location where event_location = 'Room 138A'), (SELECT event_type_id from event_type where event_type = 'Talk'), '2021-05-03 10:30:00', 30, 'Loved the event? Chat with the organizers to get involved with planning next year!'),

        ('Lunch',  (SELECT event_location_id from event_location where event_location = 'Gym'), (SELECT event_type_id from event_type where event_type = 'Food'), '2021-05-02 10:55:00', NULL, 'Pick up a bagged lunch and start hacking!'),
        ('Dinner',  (SELECT event_location_id from event_location where event_location = 'Lower Cafe'), (SELECT event_type_id from event_type where event_type = 'Food'), '2021-05-02 18:00:00', NULL, 'Catering from Chipotle! Fuel up before getting back to business'),
        ('Breakfast',  (SELECT event_location_id from event_location where event_location = 'Lower Cafe'), (SELECT event_type_id from event_type where event_type = 'Food'), '2021-05-03 07:30:00', NULL, 'Grab a bagel and some very needed coffee.'),
        ('Midnight Pizza',  (SELECT event_location_id from event_location where event_location = 'Gym'), (SELECT event_type_id from event_type where event_type = 'Food'), '2021-05-03 00:00:00', NULL, 'A timely and cheesy slice to keep you going. Served in the gym where everyone is crushing it.'),

        ('Powerpoint Karaoke',  (SELECT event_location_id from event_location where event_location = 'Room 138A'), (SELECT event_type_id from event_type where event_type = 'Activity'), '2021-05-02 22:00:00', 45, 'How good are your pitch skills... when you don\'t even know what you\'re pitching?'),
        ('Cup Stacking Competition',  (SELECT event_location_id from event_location where event_location = 'Lower Cafe'), (SELECT event_type_id from event_type where event_type = 'Activity'), '2021-05-03 01:00:00', 30, 'CUP STACKING CUP STACKING CUP STACKING')
        
        ;


INSERT into user_type_code (user_type)
VALUES ("student"), ("teacher"), ("presenter"), ("external student");

INSERT INTO `user` (`first_name`,`last_name`,`email`,`academy`,`class`,`user_type_code`,`admin`) 
VALUES
("Tekakwitha","Schwarz","teksch23@bergen.org","ATCS",2023,(SELECT user_type_code from user_type_code  where user_type = "student"),1),
("Antton","Pierre","antpie25@bergen.org","ACAHA",2025,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Emanuel","Sieger","emasie22@bergen.org","AVPA",2022,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Sharlene","MacLeoid","shamac24@bergen.org","AEDT",2024,(SELECT user_type_code from user_type_code  where user_type = "student"),1),
("Mile","Hadzic","milhad22@bergen.org","AAST",2022,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Alboin","Beyer","albbey25@bergen.org","ABF",2025,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Tonya","Carlsson","toncar24@bergen.org","ATCS",2024,(SELECT user_type_code from user_type_code  where user_type = "student"),1),
("Josefina","Plank","jospla23@bergen.org","AAST",2023,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Benedikt","Ewart","benewa22@bergen.org","AMST",2022,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Oona","Mathieu","oonmat25@bergen.org","AVPA",2025,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Hannes","Sheenan","hanshe23@bergen.org","ACAHA",2023,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Irmingard","Morales","irmmor24@bergen.org","AEDT",2024,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Timo","Colijn","timcol25@bergen.org","ABF",2025,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Orazio","Tarr","oratar22@bergen.org","ACAHA",2022,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Anniina","Arias","annari23@bergen.org","AAST",2023,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Hajnalka","Busto","hajbus24@bergen.org","ABF",2024,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Liz","Aylmer","lizayl23@bergen.org","AMST",2023,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Euaristos","MacNevin","euamac24@bergen.org","ATCS",2024,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Bartholomeus","Kecskemeti","barkec25@bergen.org","AVPA",2025,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Irmina","Apostolov","irmapo22@bergen.org","AEDT",2022,(SELECT user_type_code from user_type_code  where user_type = "student"),0),
("Bryan","Respass","bryresll@bergen.org",null,null,(SELECT user_type_code from user_type_code  where user_type = "teacher"),1),
("Matthew","Wang","matwanll@bergen.org",null,null,(SELECT user_type_code from user_type_code  where user_type = "teacher"),1),
("Zinnia","Fransson","zf@email.com",null,null,(SELECT user_type_code from user_type_code  where user_type = "presenter"),0),
("Laine","Kramer","kramer.laine@email.com",null,null,(SELECT user_type_code from user_type_code  where user_type = "presenter"),0),
("Christos","Brassington","cbrass@email.com",null,null,(SELECT user_type_code from user_type_code  where user_type = "presenter"),0),
("Lucinde","Jerkovic","lucjerk@school.edu",null,2022,(SELECT user_type_code from user_type_code  where user_type = "external student"),0),
("Katinka","Iturburua","katitur@school.edu",null,2025,(SELECT user_type_code from user_type_code  where user_type = "external student"),0);

INSERT INTO `event_user_registration` (`user_id`, `event_id`) 
VALUES 
((SELECT user_id FROM user WHERE email = "shamac24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Auth with Google Auth (Express Pt 2B)")),
((SELECT user_id FROM user WHERE email = "toncar24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "timcol25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Lunch")),
((SELECT user_id FROM user WHERE email = "emasie22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Beginner HTML/CSS/JS")),
((SELECT user_id FROM user WHERE email = "irmmor24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "kramer.laine@email.com"), (SELECT event_id FROM event WHERE event_name = "SQL Crash Course")),
((SELECT user_id FROM user WHERE email = "albbey25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "annari23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "barkec25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Beginner HTML/CSS/JS")),
((SELECT user_id FROM user WHERE email = "irmapo22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "oonmat25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Powerpoint Karaoke")),
((SELECT user_id FROM user WHERE email = "lizayl23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "lizayl23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Opening Ceremony")),
((SELECT user_id FROM user WHERE email = "antpie25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Handlebars for Templating (Express Pt 2A)")),
((SELECT user_id FROM user WHERE email = "annari23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Handlebars for Templating (Express Pt 2A)")),
((SELECT user_id FROM user WHERE email = "oratar22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "oonmat25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Breakfast")),
((SELECT user_id FROM user WHERE email = "timcol25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Hacktime")),
((SELECT user_id FROM user WHERE email = "irmmor24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Hacktime")),
((SELECT user_id FROM user WHERE email = "benewa22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "bryresll@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "lucjerk@school.edu"), (SELECT event_id FROM event WHERE event_name = "Basic Hosting with Github Pages")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Opening Ceremony")),
((SELECT user_id FROM user WHERE email = "emasie22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Breakfast")),
((SELECT user_id FROM user WHERE email = "antpie25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Basic Hosting with Github Pages")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "White hat, black hat")),
((SELECT user_id FROM user WHERE email = "irmapo22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Midnight Pizza")),
((SELECT user_id FROM user WHERE email = "toncar24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "annari23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "oratar22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Midnight Pizza")),
((SELECT user_id FROM user WHERE email = "lizayl23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Auth with Google Auth (Express Pt 2B)")),
((SELECT user_id FROM user WHERE email = "oratar22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "White hat, black hat")),
((SELECT user_id FROM user WHERE email = "toncar24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Basic Hosting with Github Pages")),
((SELECT user_id FROM user WHERE email = "shamac24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Midnight Pizza")),
((SELECT user_id FROM user WHERE email = "lucjerk@school.edu"), (SELECT event_id FROM event WHERE event_name = "Midnight Pizza")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Auth with Google Auth (Express Pt 2B)")),
((SELECT user_id FROM user WHERE email = "barkec25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Hacktime")),
((SELECT user_id FROM user WHERE email = "oratar22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "antpie25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Powerpoint Karaoke")),
((SELECT user_id FROM user WHERE email = "irmapo22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Closing Awards Ceremony")),
((SELECT user_id FROM user WHERE email = "toncar24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Breakfast")),
((SELECT user_id FROM user WHERE email = "hajbus24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Opening Ceremony")),
((SELECT user_id FROM user WHERE email = "irmapo22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Powerpoint Karaoke")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Closing Awards Ceremony")),
((SELECT user_id FROM user WHERE email = "timcol25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Auth with Google Auth (Express Pt 2B)")),
((SELECT user_id FROM user WHERE email = "bryresll@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Lunch")),
((SELECT user_id FROM user WHERE email = "benewa22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Closing Awards Ceremony")),
((SELECT user_id FROM user WHERE email = "annari23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Powerpoint Karaoke")),
((SELECT user_id FROM user WHERE email = "oratar22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Opening Ceremony")),
((SELECT user_id FROM user WHERE email = "irmapo22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "timcol25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Powerpoint Karaoke")),
((SELECT user_id FROM user WHERE email = "emasie22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Closing Awards Ceremony")),
((SELECT user_id FROM user WHERE email = "antpie25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Auth with Google Auth (Express Pt 2B)")),
((SELECT user_id FROM user WHERE email = "lucjerk@school.edu"), (SELECT event_id FROM event WHERE event_name = "Handlebars for Templating (Express Pt 2A)")),
((SELECT user_id FROM user WHERE email = "hajbus24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "SQL Crash Course")),
((SELECT user_id FROM user WHERE email = "jospla23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Beginner HTML/CSS/JS")),
((SELECT user_id FROM user WHERE email = "timcol25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "SQL Crash Course")),
((SELECT user_id FROM user WHERE email = "emasie22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "hajbus24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Lunch")),
((SELECT user_id FROM user WHERE email = "kramer.laine@email.com"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "annari23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "SQL Crash Course")),
((SELECT user_id FROM user WHERE email = "kramer.laine@email.com"), (SELECT event_id FROM event WHERE event_name = "Opening Ceremony")),
((SELECT user_id FROM user WHERE email = "euamac24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "hanshe23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Basic Hosting with Github Pages")),
((SELECT user_id FROM user WHERE email = "timcol25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Cup Stacking Competition")),
((SELECT user_id FROM user WHERE email = "hanshe23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "bryresll@bergen.org"), (SELECT event_id FROM event WHERE event_name = "White hat, black hat")),
((SELECT user_id FROM user WHERE email = "annari23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Breakfast")),
((SELECT user_id FROM user WHERE email = "teksch23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "White hat, black hat")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "lizayl23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Cup Stacking Competition")),
((SELECT user_id FROM user WHERE email = "oonmat25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Basic Hosting with Github Pages")),
((SELECT user_id FROM user WHERE email = "toncar24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "kramer.laine@email.com"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "jospla23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "albbey25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "bryresll@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Breakfast")),
((SELECT user_id FROM user WHERE email = "hajbus24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "bryresll@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Midnight Pizza")),
((SELECT user_id FROM user WHERE email = "benewa22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Lunch")),
((SELECT user_id FROM user WHERE email = "euamac24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Beginner HTML/CSS/JS")),
((SELECT user_id FROM user WHERE email = "kramer.laine@email.com"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "lizayl23@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Breakfast")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Introduction to Express for Web Dev")),
((SELECT user_id FROM user WHERE email = "antpie25@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "kramer.laine@email.com"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "emasie22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Planning the next HackBCA")),
((SELECT user_id FROM user WHERE email = "oratar22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Cup Stacking Competition")),
((SELECT user_id FROM user WHERE email = "euamac24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Opening Ceremony")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Dinner")),
((SELECT user_id FROM user WHERE email = "katitur@school.edu"), (SELECT event_id FROM event WHERE event_name = "Cup Stacking Competition")),
((SELECT user_id FROM user WHERE email = "matwanll@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "shamac24@bergen.org"), (SELECT event_id FROM event WHERE event_name = "Presentations and Judging")),
((SELECT user_id FROM user WHERE email = "emasie22@bergen.org"), (SELECT event_id FROM event WHERE event_name = "SQL Crash Course"));
