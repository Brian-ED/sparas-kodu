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

  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
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
  let outputData = fs.readFileSync("data.json").toString()
  
  console.log(`{\"host\":\"192.168.1.161:3000\",\"User-Agent\": \"curl/bqn\",\"data\":""}`); 
  console.log(
    JSON.stringify(
      {
        "data":JSON.parse(outputData)
      }, null, 2
    )
  )
  
  res.end(JSON.stringify(
      {
        host:"192.168.1.161:3000",
        "data":JSON.parse(outputData)
      }, null, 2
    )
  )
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