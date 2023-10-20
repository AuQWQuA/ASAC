%NOIP2014-S D1T2
%input

int: n;
array[1..n-1,1..2] of int: roads;
array[1..n] of int: W;

%description

function var int: distance(var int: node1,var int: node2) =
let{
array[0..n] of var 1..n: route;
var 1..n-1: len;
constraint route[0]=node1;
constraint route[len]=node2;
constraint forall(i in 0..len-1)(exists(j in 1..n-1)((route[i]=roads[j,1] /\ route[i+1]=roads[j,2]) \/ (route[i+1]=roads[j,1] /\ route[i]=roads[j,2])));
} in len;
%图上两点(u, v)的距离定义为 u 点到 v 点的最短距离

array[1..n,1..n] of var int: matrix;

constraint forall(i,j in 1..n where i!=j)(matrix[i,j]=distance(i,j));

var int: max_weight=max(i,j in 1..n where matrix[i,j]==2)(W[i]*W[j]);
var int: sum_weight=sum(i,j in 1..n where matrix[i,j]==2)(W[i]*W[j]) mod 10007;
%若它们的距离为 2，则它们之间会产生Wu×Wv的联合权值
%请问图 G 上所有可产生联合权值的有序点对中，联合权值最大的是多少？所有联合权值之和是多少？
%由于所有联合权值之和可能很大，输出它时要对 10007 取余。

%solve

solve satisfy;

%output

output["\(max_weight) \(sum_weight)"];
