%NOIP2009-J T4
%input

int:n;
int:m;
int:p;
array[1..n,1..m] of int:coins;
array[1..n] of int:cost;

%description

array[1..m] of var 0..n: strategy;
array[1..m] of var 0..p: runtime;
%每个机器人最多能够在环形马路上行走 p 次

array[1..m] of var 1..n: location;

var 1..m: pointer;
var int:benefit;

constraint forall(i in 1..pointer)(strategy[i]!=0) /\ forall(i in pointer+1..m)(strategy[i]=0);
constraint forall(i in 1..pointer)(runtime[i]!=0) /\ forall(i in pointer+1..m)(runtime[i]=0);
constraint sum(runtime)=m;
%当马路上的机器人行走完规定的次数之后会自动消失，小新必须立刻在任意一个机器人工厂中购买一个新的机器人，并给新的机器人设定新的行走次数。

constraint forall(i in 1..pointer)(forall(j in 1..runtime[i])( location[sum([runtime[k] | k in 1..i-1])+j]=(strategy[i]-2+j) mod n +1 ));
%机器人一旦被购买，便会沿着环形马路按顺时针方向一直行走，在每个单位时间内行走一次，即从当前所在的机器人工厂到达相邻的下一个机器人工厂

constraint benefit=sum([coins[location[i],i] | i in 1..m])- sum([cost[strategy[i]] | i in 1..pointer]);
%并将经过的马路上的所有金币收集给小新

%solve

solve maximize benefit;

%output

output[show(benefit)++"\n"];
