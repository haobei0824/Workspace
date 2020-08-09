const http = require('http');
const url = require('url');
const server = http.createServer();

server.on('request', function(req, res) {
    res.end('Hello Node');
    let { query, pathname } = url.parse(req.url, true);
});


server.listen(3000);
console.log('服务器启动成功');