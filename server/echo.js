const http = require("http");
const fs = require("fs");

function reset(){
  return {
    "userAcc":14523.47,
    "savingsAcc":2367.79
  }
}

fs.writeFileSync("data.json", JSON.stringify(reset(), null, 2))

// const hostname = process.argv[2]==undefined? "0.0.0.0": process.argv[2]
const hostname = "192.168.1.161"
let debug = 0
if (process.argv[2]==undefined) debug = 1
const port = 3000

const server = http.createServer((req, res) => {
  if (debug==1) {
    console.log(`\n${req.method} ${req.url}`);
    console.log(req.headers);
  }

  let jsonTexts = []
  req.on('data', function(chunk) {
    jsonTexts.push(chunk.toString())
  })
  req.on('end', function() {
    if (debug==1) {
      console.log('BODY:');
      console.log(jsonTexts)
    }
    if (jsonTexts.join('')[0]=='{') {
      let jsonObj = JSON.parse(fs.readFileSync("data.json").toString())
      input = Number(JSON.parse(jsonTexts.join('')).moved)
      jsonTexts = []
      if (isNaN(input)) input = 0;
      jsonObj["userAcc"]    -= input
      jsonObj["savingsAcc"] += input
      if (jsonObj["userAcc"] < 0) {
        jsonObj = reset()
      }
      fs.writeFileSync("data.json", JSON.stringify(jsonObj, null, 2))
    }
  })

  let outputData = fs.readFileSync("data.json").toString()
  let x = JSON.stringify(
    {
      type: "cors",
      url: "http://www.brian-e.online:3000/",
      redirected: false,
      data: JSON.parse(outputData)
    }, null, 2
  )
  res.statusCode = 200;
  res.ok = true
  res.setHeader("Content-Type", "application/json");
  res.redirected = false
  res.statusText = "OK"
  res.type = "cors"
  res.url = "http://www.brian-e.online:3000/"
  res.setHeader("content-length", x.length)
  res.setHeader("Access-Control-Allow-Origin", "*")
  res.end(x)
});


server.listen(port, hostname, () => {
  console.log(`port: ${port}`);
});
