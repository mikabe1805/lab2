
require('dotenv').config()

const mysql = require('mysql');
const util = require('util')

const dbConfig = {
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD, 
  database: process.env.DB_DATABASE,
  connectTimeout: parseInt(process.env.DB_CONNECT_TIMEOUT) || 10000
}


// let connection = mysql.createConnection(dbConfig);
// connection.connect(function(err){
//   if (err) 
//     throw err;
//   console.log("Connected to the MySQL Server!");
// })


// If using just one connection, it can only handle one query at a time.
// If multiple requests come in at once, each must wait for the previous to finish.
// Instead, we should have a pool of connections - multithreaded - and open new connections for each query job 

let pool = mysql.createPool(dbConfig);

// When we want to make a query, the pool.query() method can be used.
// This is a shortcut for the pool.getConnection() -> connection.query() -> connection.release() 
//More efficient use of db connections might do multiple queries on one connection before closing, 
// but this is not super important for small applications.


// This makes a promise-style wrapper for the query() method
pool.queryPromise = util.promisify(pool.query)

module.exports = pool;