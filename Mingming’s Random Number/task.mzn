%NOIP2006-J T1
%input

int: n;
array[1..n] of int: random;
%输入文件有 2 行，第 1 行为 1 个正整数，表示所生成的随机数的个数:N 第 2 行有 N 个用空格隔开的正整数，为所产生的随机数。

%description

var set of 1..1000:random_set;
var 1..n: num;
%他先用计算机生成了N个1到1000之间的随机整数（N≤100）

constraint random_set=array2set(random);
%对于其中重复的数字，只保留一个，把其余相同的数去掉

constraint num=card(random_set);
array[0..n] of var int: out;
constraint forall(i in 1..num)(out[i] in random_set);
constraint forall(i in 1..num-1)(out[i]<out[i+1]);
%然后再把这些数从小到大排序，按照排好的顺序去找同\学做调查。

%solve

solve satisfy;

%output

output[show(num)++"\n"];
%第1行为1个正整数M，表示不相同的随机数的个数
output["\(out[i]) " | i in 1..fix(num)];
%第2行为M个用空格隔开的正整数，为从小到大排好序的不相同的随机数。