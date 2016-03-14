var express = require('express');
var http = require("http");
var app = express();
var port = process.env.PORT || 3000;

app.use('/scripts', express.static(__dirname +
  '/scripts'));
app.use('/css', express.static(__dirname +
  '/css'));
app.use(express.static(__dirname));

http.createServer(app).listen(port);
console.log("Express is listening on port " + port);

app.get("/hello", function (req, res) {
    res.send("Hello World!");
});

app.get("/goodbye", function (req, res) {
    res.send("Goodbye World!");
});