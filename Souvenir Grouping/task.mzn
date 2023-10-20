%NOIP2007-J T2
%input

int: w;
int: n;
array[1..n] of int: P;
%第1行包括一个整数w，为每组纪念品价格之和的上限
%第2行为一个整数n，表示购来的纪念品的总件数。 
%第3~n+2行每行包含一个正整数pi (5 <= pi <= w)，表示所对应纪念品的价格。
%description

array[1..n] of var 1..n: setIndex;
array[1..n] of var int: weight;
array[1..n] of var int: num;

weight=[sum([P[j]|j in 1..n where setIndex[j]==i])|i in 1..n];
num=[sum([1|j in 1..n where setIndex[j]==i])|i in 1..n];

var int: object=sum([1|number in num where number>0]);
constraint forall(number in num)(number<=2);
%他要把购来的纪念品根据价格进行分组，但每组最多只能包括两件纪念品

constraint forall(mass in weight)(mass<=w);
%并且每组纪念品的价格之和不能超过一个给定的整数

%solve

solve minimize object;
%为了保证在尽量短的时间内发完所有纪念品，乐乐希望分组的数目最少。

%output

output["\(object)"];
%输出文件仅一行，包含一个整数，即最少的分组数目。


