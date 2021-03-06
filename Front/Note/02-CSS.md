# 02-CSS

## 1.1 基础选择器总结

| 选择器    | 作用              | 缺点           | 使用情况  | 用法                   |
| ------ | --------------- | ------------ | ----- | -------------------- |
| 标签选择器  | 可以选出所有相同的标签，比如p | 不能差异化选择      | 较多    | p { color：red;}      |
| 类选择器   | 可以选出1个或者多个标签    | 可以根据需求选择     | 非常多   | .nav { color: red; } |
| id选择器  | 一次只能选择器1个标签     | 只能使用一次       | 不推荐使用 | #nav {color: red;}   |
| 通配符选择器 | 选择所有的标签         | 选择的太多，有部分不需要 | 不推荐使用 | * {color: red;}      |

## 1.1 复合选择器总结

| 选择器     | 作用           | 特征         | 使用情况 | 隔开符号及用法                     |
| ------- | ------------ | ---------- | ---- | --------------------------- |
| 后代选择器   | 用来选择元素后代     | 是选择所有的子孙后代 | 较多   | 符号是**空格** .nav a            |
| 子代选择器   | 选择 最近一级元素    | 只选亲儿子      | 较少   | 符号是**>**   .nav>p           |
| 交集选择器   | 选择两个标签交集的部分  | 既是 又是      | 较少   | **没有符号**  p.one             |
| 并集选择器   | 选择某些相同样式的选择器 | 可以用于集体声明   | 较多   | 符号是**逗号** .nav, .header     |
| 链接伪类选择器 | 给链接更改状态      |            | 较多   | 重点记住 a{} 和 a:hover  实际开发的写法 |

## 2 CSS外观属性总结

| 属性              | 表示   | 注意点                                    |
|:--------------- |:---- |:-------------------------------------- |
| color           | 颜色   | 我们通常用  十六进制   比如 而且是简写形式 #fff          |
| line-height     | 行高   | 控制行与行之间的距离                             |
| text-align      | 水平对齐 | 可以设定文字水平的对齐方式                          |
| text-indent     | 首行缩进 | 通常我们用于段落首行缩进2个字的距离   text-indent: 2em; |
| text-decoration | 文本修饰 | 记住 添加 下划线  underline  取消下划线  none      |

## 3 标签显示模式：display属性

标签以什么方式进行显示，比如div 自己占一行， 比如span 一行可以放很多个

- 块级元素(block-level)：<h>, <div>, <p>, <ul>

- 行内元素(inline-level): <span>,<a>

- 行内块元素（inline-block),不会占据1行，可以设置宽度高度：img, input

## 4 行高line-height

## 5 背景background

| 属性                    | 作用       | 值                                                            |
| --------------------- |:-------- |:------------------------------------------------------------ |
| background-color      | 背景颜色     | 预定义的颜色值/十六进制/RGB代码                                           |
| background-image      | 背景图片     | url(图片路径)                                                    |
| background-repeat     | 是否平铺     | repeat/no-repeat/repeat-x/repeat-y                           |
| background-position   | 背景位置     | length/position    分别是x  和 y坐标， 切记 如果有 精确数值单位，则必须按照先X 后Y 的写法 |
| background-attachment | 背景固定还是滚动 | scroll/fixed                                                 |
| 背景简写                  | 更简单      | 背景颜色 背景图片地址 背景平铺 背景滚动 背景位置;  他们没有顺序                          |
| 背景透明                  | 让盒子半透明   | background: rgba(0,0,0,0.3);   后面必须是 4个值                     |

## 6 CCS三大特性

- CSS层叠性

- CSS继承性

- CSS优先级

### 6.1 CSS层叠性

原则：

- 样式冲突，遵循的原则是**就近原则。** 那个样式离着结构近，就执行那个样式。
- 样式不冲突，不会层叠

### 5.2 CSS继承性

子标签会继承父标签的某些样式，如文本颜色和字号。

想要设置一个可继承的属性，只需将它应用于父元素即可。

### 5.3 CSS优先级

定义CSS样式时，经常出现两个或更多规则应用在同一元素上，此时，

- 选择器相同，则执行层叠性
- 选择器不同，就会出现优先级的问题。
