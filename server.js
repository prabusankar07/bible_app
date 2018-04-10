var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var request = require('request');
var http = require('http');
var path = require('path');
var app = express();
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(express.static(__dirname + '/images'));
var port = process.env.PORT || 1130;
var configDB = require('./server/config/database');
var connection = mysql.createPool(configDB());
connection.getConnection(function(err, connection) {
  if (!err) {
    console.log("Database is connected ... ");
  } else {
    console.log(err);
  }
});
var user = express.Router();
require('./server/routes/userRoutes.js')(user, connection);
app.use('/user', user);

var display = express.Router();
require('./server/routes/displayContent.js')(display, connection);
app.use('/display', display);

app.listen(port, function(req, res) {
  console.log('server is running on port ' + port);
});