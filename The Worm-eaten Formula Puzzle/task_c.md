#  虫食算

## 题目描述

所谓虫食算，就是原先的算式中有一部分被虫子啃掉了，需要我们根据剩下的数字来判定被啃掉的数字。来看一个简单的例子：

$$\begin{aligned}
 \verb!43#9865#045! \\
+\qquad \verb!8468#6633! \\[-1em]\underline{\kern{8em}} \\
 \verb!44445509678! \\
\end{aligned}$$

其中 `#` 号代表被虫子啃掉的数字。根据算式，我们很容易判断：第一行的两个数字分别是 $5$ 和 $3$，第二行的数字是 $5$。

现在，我们对问题做两个限制：

首先，我们只考虑加法的虫食算。这里的加法是 $n$ 进制加法，算式中三个数都有 $n$ 位，允许有前导的 $0$。

其次，虫子把所有的数都啃光了，我们只知道哪些数字是相同的，我们将相同的数字用相同的字母表示，不同的数字用不同的字母表示。如果这个算式是 $n$ 进制的，我们就取英文字母表的前 $n$ 个大写字母来表示这个算式中的 $0$ 到 $n - 1$ 这 $n$ 个不同的数字：但是这 $n$ 个字母并不一定顺序地代表 $0$ 到 $n-1$。输入数据保证 $n$ 个字母分别至少出现一次。

$$\begin{aligned}
 \verb!BADC! \\
+\quad \verb!CBDA! \\[-1em]\underline{\kern{4em}} \\
 \verb!DCCC! \\
\end{aligned}$$

上面的算式是一个4进制的算式。很显然，我们只要让 $\verb!ABCD!$ 分别代表 $0123$，便可以让这个式子成立了。你的任务是，对于给定的 $n$ 进制加法算式，求出 $n$ 个不同的字母分别代表的数字，使得该加法算式成立。输入数据保证有且仅有一组解。

## 输入格式

输入的第一行是一个整数 $n$，代表进制数。

第二到第四行，每行有一个由大写字母组成的字符串，分别代表两个加数以及和。这 $3$ 个字符串左右两端都没有空格，从左到右依次代表从高位到低位，并且恰好有 $n$ 位。

## 输出格式

输出一行 $n$ 个用空格隔开的整数，分别代表 $A,B, \dots$ 代表的数字。

## 样例 #1

### 样例输入 #1

```
5
ABCED
BDACE
EBBAA
```

### 样例输出 #1

```
1 0 3 4 2
```

## 提示

#### 数据规模与约定

- 对于 $30\%$ 的数据，保证 $n \le 10$；
- 对于 $50\%$ 的数据，保证 $n \le 15$；
- 对于 $100\%$ 的数据，保证 $1 \leq n \leq 26$。