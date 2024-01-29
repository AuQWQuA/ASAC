% NOIP2006-J T2
%input

int: n;
int: m;
array[1..m] of int: V;
array[1..m] of int: P;
%输入文件的第1行，为两个正整数，用一个空格隔开:N m(其中 N(<30000)表示总钱数，m(<25)为希望购买物品的个数。)
%在第 2 行到第 m+1 行中，第 j 行给出了编号为 j-1 的物品的基本数据
%每行有 2 个非负整 数v p(其中v表示该物品的价格(v<=10000)，p表示该物品的重要度(1~5))

%description

array[1..m] of var 0..1: buy;
constraint (sum(i in 1..m)(V[i]*buy[i])) <= n;
%他希望在不超过N元（可以等于N元）的前提下

var int: obj=(sum(i in 1..m)(V[i]*P[i]*buy[i]));
%设第j件物品的价格为v[j]，重要度为w[j]，共选中了k件物品，编号依次为j1，j2，……，jk，则所求的总和为：v[j1]*w[j1]+v[j2]*w[j2]+ …+v[jk]*w[jk]。（其中*为乘号）

%solve
solve maximize obj;
%使每件物品的价格与重要度的乘积的总和最大。

%output

output["\(obj)\n"]
%输出文件只有一个正整数，为不超过总钱数的物品的价格与重要度乘积的总和的最大值