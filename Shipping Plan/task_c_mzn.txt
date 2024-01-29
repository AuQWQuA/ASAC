%NOIP2015-S D2T3
%input

include "all_different.mzn";
int: n;
int: m;
array[1..n-1,1..3] of int: road;
array[1..m,1..2] of int: plans;

%description

var 1..m: hole;

function var int: travel(var int: start,var int: end)=
let{
array[1..n-1] of var 1..n-1: route;
constraint alldifferent(route);
var 1..n-1: len;
constraint (road[route[1],1]=start \/ road[route[1],2]=start) /\ (road[route[len],1]=end \/ road[route[len],2]=end);
constraint forall(i in 1..len-1)
(road[route[i],2]=road[route[i+1],1] \/ road[route[i],1]=road[route[i+1],1] 
\/road[route[i],1]=road[route[i+1],2] \/road[route[i],2]=road[route[i+1],2]);
} in sum(i in 1..len)(if route[i]=hole then 0 else road[route[i],3] endif);
%即允许小P 把某一条航道改造成虫洞，飞船驶过虫洞不消耗时间。
array[1..m] of var int: time;
constraint forall(i in 1..m)(time[i]=travel(plans[i,1],plans[i,2]));
var int: max_time=max(time);
%在虫洞建设完成后，这 m 个运输计划会同时开始，所有飞船一起出发。当这 m 个运输计划都完成时，小 P 的物流公司的阶段性工作就完成了。

%solve

solve minimize max_time;
%试求出小 P 的物流公司完成阶段性工作所需要的最短时间是多少？

%output

output[show(max_time)];


