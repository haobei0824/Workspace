const express = require('express');

const home = express.Router();

home.get('/index', (req, res) => {
    res.send('欢迎来到博客首页页面')
});

home.get('/list', (req, res) => {
    res.send('欢迎来到博客List页面')
});

module.exports = home;