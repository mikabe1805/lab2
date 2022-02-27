var express = require('express');
var router = express.Router();
var db = require('../db/db');

const fs = require('fs');
const path = require('path');

let eventsQuery = fs.readFileSync(path.join(__dirname, "../db/select_events.sql"), "utf-8");

/* GET events "home" page - a list of all events. */
router.get('/', async function(req, res, next) {
  // let promise = db.queryPromise(eventsQuery)
  // promise.then((results) => {
  //   res.render('events', { title: 'Events', style: "tables", events: results});
  // }).catch((err) => {
  //   next(err);
  // });

  try {
    let results = await db.queryPromise(eventsQuery)
    console.log(results);
    res.render('events', { title: 'Events', style: "tables", events: results});
  } catch (err) {
    next(err);
  }
 

});

let event_locations_query = fs.readFileSync(path.join(__dirname, "../db/select_event_locations.sql"), "utf-8");
let event_types_query = fs.readFileSync(path.join(__dirname, "../db/select_event_types.sql"), "utf-8");


router.get('/create', async function(req, res, next) {
  try {

    let event_locations = await db.queryPromise(event_locations_query);
    let event_types = await db.queryPromise(event_types_query);
  
    res.render('eventform', {title: "Create Event", style: "newevent", 
                            event_locations:event_locations, 
                          event_types:event_types})
  } catch(err) {
    next(err);
  }
})

let singleEventQuery = fs.readFileSync(path.join(__dirname, "../db/select_event_single.sql"), "utf-8");

router.get('/:event_id', function(req, res, next) {
  let event_id = req.params.event_id
  // GET FROM DATABASE: Select query where event_id = event_id from URL
  //For now, lets pretend
  // let event_data = {event_id: event_id,
  //                 event_name: "Opening Ceremony", 
  //                 event_location: "Auditorium",
  //                 event_date: "May 1 (Sat)",
  //                 event_time: "10:30 AM",
  //                 event_duration: "30m",
  //                 event_type: "Main",
  //                 event_interest: "100",
  //                 event_description: "Be there!"}
  db.query(singleEventQuery, [event_id], (err, results) => {
    if (err)
      next(err);
    console.log(results);
    let event_data = results[0];
    res.render('event', { title: 'Event Details', 
                      styles: ["tables", "event"], 
                      event_id : event_id, 
                      event_data: event_data});
  });
});


let singleEventForFormQuery = fs.readFileSync(path.join(__dirname, "../db/select_event_single_form.sql"), "utf-8");

router.get('/:event_id/modify', async function(req, res, next) {
  try {

    let event_locations = await db.queryPromise(event_locations_query);
    let event_types = await db.queryPromise(event_types_query);
    //Very much like the get('/:event_id') route... 
    let event_id = req.params.event_id
    let results = await db.queryPromise( singleEventForFormQuery, [event_id]);
    let event_data = results[0];

    res.render('eventform', {title: "Modify Event", style: "newevent", 
                            event_locations:event_locations, 
                          event_types:event_types,
                        event: event_data}); // provide current event data
  } catch(err) {
    next(err);
  }

});

let insertEventQuery = fs.readFileSync(path.join(__dirname, "../db/insert_event.sql"), "utf-8");
// (`event_name`, `event_location_id`, `event_type_id`, `event_dt`, `event_duration`, `event_description`) 
router.post('/', async function(req, res, next) {
  try {
    let results = await db.queryPromise(insertEventQuery, [req.body.event_name, 
      req.body.event_location_id, 
      req.body.event_type_id, 
      `${req.body.event_date} ${req.body.event_time}`,
      req.body.event_duration,
      req.body.event_description
    ]);

  let event_id_inserted = results.insertId;
  res.redirect(`/events/${event_id_inserted}`);
  } catch(err) {
    next(err);
  }
})

let updateEventQuery = fs.readFileSync(path.join(__dirname, "../db/update_event.sql"), "utf-8"); 
router.post('/:event_id', async function(req, res, next) {
  try {
    let results = await db.queryPromise(updateEventQuery, [req.body.event_name, 
      req.body.event_location_id, 
      req.body.event_type_id, 
      `${req.body.event_date} ${req.body.event_time}`,
      req.body.event_duration,
      req.body.event_description,
      req.params.event_id // or req.body.event_id, since its a hidden input in the form
    ]);

  res.redirect(`/events/${req.params.event_id}`);
  } catch(err) {
    next(err);
  }
})

module.exports = router;
