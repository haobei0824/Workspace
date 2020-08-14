// 引入express框架
const express = require('express');
// 创建网站服务器
const app = express();

const homeRouter = require('./route/home');
const adminRouter = require('./route/admin');

app.use('/home', homeRouter);
app.use('/admin', adminRouter);


// 端口监听
app.listen(3000);