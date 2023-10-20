%NOIP2006-S T2
%input

int: N;
int: m;
%输入文件的第 1 行，为两个正整数，用一个空格隔开:
array[1..m,1..3] of int: items;
%从第 2 行到第 m+1 行，第 j 行给出了编号为 j-1 的物品的基本数据，每行有 3 个非负整数

%description


array[1..m] of var 0..1: choose;

var int: ans;

constraint forall(i in 1..m)(if choose[i]=1 then (if items[i,3]!=0 then choose[items[i,3]]=1 endif) endif);
%如果要买归类为附件的物品，必须先买该附件所属的主件。
constraint sum([if choose[i]=1 then items[i,1] else 0 endif | i in 1..m]) <= N;
%他希望在不超过N元（可以等于N元）的前提下
constraint ans=sum([if choose[i]=1 then items[i,1] * items[i,2] else 0 endif | i in 1..m]);
%使每件物品的价格与重要度的乘积的总和最大。

%solve

solve maximize ans;

%output

output["\(ans)"];
%输出文件只有一个正整数，为不超过总钱数的物品的价格与重要度乘积的总和的最大值