%NOIP2012-J T3
%input

int: n;
int: m;
array[1..n] of int: A;

%description

int: max_num=pow(n,m);
var 0..max_num: num;
array[1..max_num,1..n] of var 0..m: B;

constraint forall(i,j in 1..num where i!=j)(not(forall(k in 1..n)(B[i,k]=B[j,k])));
%一共有多少种不同的摆花方案
constraint forall(i in 1..num)(sum(j in 1..n)(B[i,j])=m);
%他想在花店的门口摆上一排花，共 m 盆
constraint forall(i in 1..num, j in 1..n)(B[i,j]<=A[j]);
%规定第 i 种花不能超过 ai盆

%solve

solve::int_search(array1d(B),input_order, indomain, complete) 
maximize num;

%output

output[show(num)];