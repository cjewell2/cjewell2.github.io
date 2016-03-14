var http = require("http");
var port = (process.env.PORT || 3000);
//this line causes the app to fail on CF
//var host = (process.env.VCAP_APP_HOST || 'localhost');
var server;

server = http.createServer(function (req, res) {
    res.writeHead(200, {"Content-Type": "text/html"});
    res.end("<h2>Welcome to Node.js!</h2>\n");
});

server.listen(port);
console.log("Server running on port", port);
