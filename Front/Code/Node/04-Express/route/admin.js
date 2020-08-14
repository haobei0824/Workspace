const express = require('express');

const admin = express.Router();

admin.get('/index', (req, res) => {
    res.send('欢迎来到博客管理页面')
});

admin.get('/login', (req, res) => {
    res.send('欢迎来到博客login页面')
});

module.exports = admin;