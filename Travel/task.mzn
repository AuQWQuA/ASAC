%NOIP2018-S D2T1
%input

int: n;
int: m;
array[1..m,1..2] of int: road;

%description

array[1..2*n] of var 1..n: route;
var 1..2*n: length;
constraint route[length]=route[1];
%当小 Y 回到起点时，她可以选择结束这次旅行或继续旅行。
constraint forall(i in 1..n)(exists(k in 1..length)(route[k]=i));
%小 Y 要求在旅行方案中，每个城市都被访问到。
constraint forall(i in 2..length)(forall(j in 1..i-2)(route[i]!=route[j]) 
\/ if min(j in 1..i-2 where route[j]=route[i-1])(j)>=2 then route[i]=route[min(j in 1..i-2 where route[j]=route[i-1])(j)-1] endif);
%每次可以选择一条与当前城市相连的道路，走向一个没有去过的城市，或者沿着第一次访问该城市时经过的道路后退到上一个城市。
constraint forall(i in 2..length)
(exists(k in 1..m)((route[i]=road[k,1] /\ route[i-1]=road[k,2]) \/ (route[i]=road[k,2] /\ route[i-1]=road[k,1])));

array[1..n] of var 1..n: first;
constraint forall(i,j in 1..n where i<j)
(min(k in 1..length where route[k]=first[i])(k)<min(k in 1..length where route[k]=first[j])(k));
%为了让自己的旅行更有意义，小 Y 决定在每到达一个新的城市（包括起点）时，将它的编号记录下来。她知道这样会形成一个长度为 𝑛 的序列。
var int: score;
constraint score=sum(i in 1..n)(pow(n,n-i)*first[i]);

%solve

solve minimize score;

%output

output[show(first)];