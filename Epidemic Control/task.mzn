%NOIP2012-S D2T3
%input

include "alldifferent.mzn";
int: n;
array[1..n-1] of int: u;
array[1..n-1] of int: v;
array[1..n-1] of int: w;
%u、v、w，每两个整数之间用一个空格隔开，表示从城市 u 到城市 v 有一条长为 w 的道路
int: m;
array[1..m] of int: army;
%分别表示这 m 个军队所驻扎的城市的编号。

%description

predicate if_leaf(var int: c)=
not(exists(i in 1..n-1)(u[i]=c) /\ exists(j in 1..n-1)(v[j]=c)) /\ c!=1;

function var int: length(var int: c1,var int: c2) =
let{
var 1..n: num;
array[1..n] of var 1..n: route;
constraint all_different(route);
constraint route[1]=c1;
constraint route[num]=c2;
constraint forall(i in 1..num-1)(exists(j in 1..n-1)((route[i]=u[j] /\ route[i+1]=v[j]) \/ (route[i]=v[j] /\ route[i+1]=u[j])));
var int: l;
constraint l=sum(i in 1..n-1 
where exists(j in 1..num-1)(route[j]=u[i] /\ route[j+1]=v[i]) \/ exists(j in 1..num-1)(route[j]=v[i] /\ route[j+1]=u[i]))
(w[i]);
} in l;
%一支军队经过一条道路从一个城市移动到另一个城市所需要的时间等于道路的长度（单位：小时）

array[1..m] of var 1..n: camp;
array[1..n] of var bool: city;
constraint city[1]=false;
%首都是不能建立检查点的。
constraint forall(i in 1..n)(if i in array2set(camp) then city[i]=true else city[i]=false endif);
constraint forall(i in 1..n where if_leaf(i))(
let{
var 1..n: num;
array[1..n] of var 1..n: route;
constraint all_different(route);
constraint route[1]=1;
constraint route[num]=i;
constraint forall(k in 1..num-1)(exists(j in 1..n-1)((route[k]=u[j] /\ route[k+1]=v[j]) \/ (route[k]=v[j] /\ route[k+1]=u[j])));
var bool: b;
constraint b->(exists(k in 1..num)(city[route[k]]=true));
%使得从首都到边境城市的每一条路径上都至少有一个检查点，边境城市也可以建立检查点
} in b);

array[1..m] of var int: time;
constraint forall(i in 1..m)(time[i]=length(army[i],camp[i]));
var int: max_time;
constraint max_time=max(time);
%请问最少需要多少个小时才能控制疫情。注意：不同的军队可以同时移动。

%solve

solve minimize max_time;

%output

output[show(max_time)];
