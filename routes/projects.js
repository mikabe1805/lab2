var express = require('express');
var router = express.Router();

/* GET events "home" page - a list of all events. */
router.get('/', function(req, res, next) {
  res.render('projects', { title: 'Projects', style: "tables"});
});

router.get('/create', function(req, res, next) {
  res.render('projectform', {title: "Create Project", style: "newevent"})
})

router.get('/:project_id', function(req, res, next) {
  let project_id = req.params.project_id
  // GET FROM DATABASE: Select query where project_id = project_id from URL
  //For now, lets pretend
  let project_data = {project_id: project_id,
                  project_name: "Opening Ceremony", 
                  project_location: "Auditorium",
                  project_date: "May 1 (Sat)",
                  project_time: "10:30 AM",
                  project_owner: "Mika Be",
                  project_type: "Main",
                  project_dt_proposed: "2022-01-12",
                  project_interest: "100",
                  project_description: "Be there!"}

  res.render('project', { title: 'Project Details', 
                      styles: ["tables", "project"], 
                      project_id : project_id, 
                      project_data: project_data});
});

router.get('/:project_id/modify', function(req, res, next) {
  res.render('projectform', {title: "Modify Project", style: "newproject"})
})

module.exports = router;
