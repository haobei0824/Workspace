// 引入express框架
const express = require('express');
// 创建网站服务器
const app = express();
/**
 * 
 *  app.use
 *  app.get
 *  这些方法，按照方法一次匹配，匹配到了就执行
 *  如果某个回调里没有执行next()，后面的就执行不到了
 */

// 网站公告
// app.use((req, res, next) => {
// 	res.send('当前网站正在维护...')
// })

// app.use('/admin', (req, res, next) => {
//     // 用户没有登录
//     let isLogin = true;
//     // 如果用户登录
//     if (isLogin) {
//         // 让请求继续向下执行
//         next()
//     } else {
//         // 如果用户没有登录 直接对客户端做出响应
//         res.send('您还没有登录 不能访问/admin这个页面')
//     }
// })

app.get('/admin', (req, res, next) => {
    res.send('您已经登录 可以访问当前页面')
    next();
})

app.use((req, res, next) => {
    console.log('app.use log')
        // 为客户端响应404状态码以及提示信息
    res.send('当前访问的页面是不存在的')
})



// 监听端口
app.listen(3000);
console.log('网站服务器启动成功');