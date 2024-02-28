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
const hostname = "0.0.0.0"
let debug = 0
if (process.argv[2]==undefined) debug = 1
const port = 3000

const server = http.createServer((req, res) => {
  if (debug==1) {
    console.log(`\n${req.method} ${req.url}`);
    console.log(req.headers);
  }

  let jsonText = [];
  req.on('data', function(chunk) {
    jsonText.push(chunk);
  });
  req.on('end', function() {
    if (debug==1) {
      console.log('BODY:');
      console.log(JSON.parse(jsonText.join('')))
    }

    let jsonObj = JSON.parse(fs.readFileSync("data.json").toString())
    input = Number(JSON.parse(jsonText.join('')).moved)
    if (isNaN(input)) input = 0;
    jsonObj["userAcc"]    -= input
    jsonObj["savingsAcc"] += input
    if (jsonObj["userAcc"] < 0) {
      jsonObj = reset()
    }
    jsonText = []
    fs.writeFileSync("data.json", JSON.stringify(jsonObj, null, 2))
  });

  let outputData = fs.readFileSync("data.json").toString()
  let x = JSON.stringify(
    {
      type: "cors",
      url: "http://192.168.1.161:3000/",
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
  res.url = "http://192.168.1.161:3000/"
  res.setHeader("content-length", x.length)
  res.setHeader("Access-Control-Allow-Origin", "*")
  res.end(x)
});


server.listen(port, hostname, () => {
  console.log(`port: ${port}`);
});

// OPTIONS /
// {
//   host: '192.168.1.161:3000',
//   'user-agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0',
//   accept: '*/*',
//   'accept-language': 'en-GB,en;q=0.5',
//   'accept-encoding': 'gzip, deflate',
//   'access-control-request-method': 'GET',
//   'access-control-request-headers': 'content-type,user-agent',
//   referer: 'http://brian-e.online/',
//   origin: 'http://brian-e.online',
//   dnt: '1',
//   connection: 'keep-alive'
// }
// 
// GET /
// {
//   host: '192.168.1.161:3000',
//   'user-agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0',
//   accept: '*/*',
//   'accept-language': 'en-GB,en;q=0.5',
//   'accept-encoding': 'gzip, deflate',
//   referer: 'http://brian-e.online/',
//   'content-type': 'application/json',
//   origin: 'http://brian-e.online',
//   dnt: '1',
//   connection: 'keep-alive'
// }
// 
// Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at http://192.168.1.161:3000/. (Reason: CORS request did not succeed). Status code: (null).
// 
// Uncaught (in promise) TypeError: NetworkError when attempting to fetch resource.
// Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at http://192.168.1.161:3000/. (Reason: CORS header ‘Access-Control-Allow-Origin’ missing). Status code: 200.