const art = require('art-template');
const path = require('path');


const indexTemplate = path.join(__dirname, 'views', 'index.art');
const html = art(indexTemplate, {
    name: '张三',
    age: 20
})

console.log(html);