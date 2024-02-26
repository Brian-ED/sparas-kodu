// If you want a local test server that accepts any URL and just dumps the request to the console, you can use node:

const http = require("http");

const hostname = "0.0.0.0";
const port = 3000;

const server = http.createServer((req, res) => {
  console.log(`\n${req.method} ${req.url}`);
  console.log(req.headers);

  req.on("data", function(chunk) {
    console.log("BODY: " + chunk);
  });
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  if ("toto"==req.headers["user-agent"]) {
    res.end("\"Host\": \"localhost:3000\", \"User-Agent\": \"toto\" \"Hello\": \"World\" \"Content-Type\": \"application/json\"");
  } else {
    res.end("\"Host\": \"localhost:3000\", \"User-Agent\": \"curl/bqn\" ");
  }
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
