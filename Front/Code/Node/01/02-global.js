console.log('我是global对象下面的console.log方法输出的内容');
setTimeout(() => {
    console.log('我是延迟后的输出');
}, 1000);

console.log('查看global对象');
console.log(global);
console.log(global.Buffer);