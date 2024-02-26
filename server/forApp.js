// If you want a local test server that accepts any URL and just dumps the request to the console, you can use node:

const http = require("http");
const fs = require("fs");

const hostname = "0.0.0.0";
const port = 3000;

const server = http.createServer((req, res) => {
  console.log(`\n${req.method} ${req.url}`);
  console.log(req.headers);
  console.log(fs.readdirSync("./"))
  req.on("data", function(chunk) {
    console.log("BODY: " + chunk);

    let jsonData = fs.readFileSync("data.json")

    let jsonObj = JSON.parse(jsonData.toString())
    jsonObj["test"]=chunk
    fs.writeFileSync("data.json",JSON.stringify(jsonObj))
  });
  res.statusCode = 201;
  res.setHeader("Content-Type", "text/plain");
  res.end("Hellooo from server");
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
