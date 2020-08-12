// 引入express框架
const express = require('express');
// 创建网站服务器
const app = express();

// 接收所有请求的中间件，如果没有执行next，后面所有的响应都执行不到
app.use((req, res, next) => {
    console.log('请求走了app.use中间件');
    next()
})

// get的响应函数，是按照顺序执行的
// response A没有执行next()，则response B是执行不到的
app.get('/request', (req, res) => {
    res.send(req.name)
    console.log('response A')
})

app.get('/request', (req, res, next) => {
    req.name = "张三";
    console.log('response B')
    next();
})



// 监听端口
app.listen(3000);
console.log('网站服务器启动成功');