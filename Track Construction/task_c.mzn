%NOIP2018-S D1T3
%input

int: n;
int: m;
array[1..n-1,1..3] of int: road;

%description

array[1..m] of var set of 1..n-1: race;
constraint forall(i,j in 1..m where i!=j)(race[i] intersect race[j]={});
%一条赛道是一组互不相同的道路 𝑒1, 𝑒2, … , 𝑒m

predicate connected(var set of 1..n-1: s)=
exists(i,j in 1..n where i!=j)(sum(r in s where road[r,1]=i)(1)+sum(r in s where road[r,2]=i)(1)=1 /\
sum(r in s where road[r,1]=j)(1)+sum(r in s where road[r,2]=j)(1)=1 /\
forall(k in 1..n where k!=i /\ k!=j)(sum(r in s where road[r,1]=k)(1)+sum(r in s where road[r,2]=k)(1)=2
\/ sum(r in s where road[r,1]=k)(1)+sum(r in s where road[r,2]=k)(1)=0));

constraint forall(i in 1..m)(connected(race[i]));
var int: min_len;
constraint min_len=min(i in 1..m)(sum(r in race[i])(road[r,3]));
%一条赛道的长度等于经过的各道路的长度之和。

%solve

solve maximize min_len;
%使得修建的𝑚条赛道中长度最小的赛道长度最大

%output

output[show(min_len)];