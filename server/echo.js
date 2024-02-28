// If you want a local test server that accepts any URL and just dumps the request to the console, you can use node:

const http = require("http");
const fs = require("fs");

function reset(){
  return {
    "userAcc":14523.47,
    "savingsAcc":2367.79
  }
}

fs.writeFileSync("data.json", JSON.stringify(reset(), null, 2))

const hostname = process.argv[2]==undefined? "0.0.0.0": process.argv[2]
const port = 3000

const server = http.createServer((req, res) => {
  console.log(`\n${req.method} ${req.url}`);
  console.log(req.headers);

  req.on("data", function(chunk) {
    console.log("BODY: " + chunk);
  });
  res.statusCode = 200;
  // res.setHeader("Content-Type", "text/plain");
  // console.log(req.headers["user-agent"])

  req.on("data", function(chunk) {
    console.log("BODY: " + chunk);

    let jsonObj = JSON.parse(fs.readFileSync("data.json").toString())
    input = Number(chunk.toString())
    if (isNaN(input)) input = 0;
    jsonObj["userAcc"]    -= input
    jsonObj["savingsAcc"] += input
    if (jsonObj["userAcc"] < 0) {
      jsonObj = reset()
    }
    fs.writeFileSync("data.json", JSON.stringify(jsonObj, null, 2))
  })
  let jsonStr = fs.readFileSync("data.json").toString()
  let outputJSON = JSON.stringify(JSON.parse(jsonStr), null, 2)
  res.end(`{\"Host\":\"localhost:3000\",\"User-Agent\": \"curl/bqn\",\"data\":${outputJSON}}`); 
});


server.listen(port, hostname, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
