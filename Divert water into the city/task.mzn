%NOIP2010-S T4
%input

int: N;
int: M;
array[1..N,1..M] of int: height;

%description

enum water={store,trans,empty};
%水利设施有两种，分别为蓄水厂和输水站。
array[1..N,1..M] of var water: build;

predicate water_flow(var 1..N: x,var 1..M: y)=
(x>1 /\ height[x-1,y]>height[x,y] /\ build[x-1,y]!=empty)
\/ (x<N /\ height[x+1,y]>height[x,y] /\ build[x+1,y]!=empty)
\/ (y>1 /\ height[x,y-1]>height[x,y] /\ build[x,y-1]!=empty)
\/ (y<M /\ height[x,y+1]>height[x,y] /\ build[x,y+1]!=empty);

constraint forall(i in 1..N,j in 1..M)
(if build[i,j]=store then i=1 
%只有与湖泊毗邻的第 1 行的城市可以建造蓄水厂。
elseif build[i,j]=trans then water_flow(i,j)
%故一座城市能建造输水站的前提，是存在比它海拔更高且拥有公共边的相邻城市，已经建有水利设施。
else true endif);

var int: desert_water;
constraint desert_water=count(j in 1..M)(build[N,j]=trans \/ build[N,j]=store);
%由于第 N 行的城市靠近沙漠，是该国的干旱区，所以要求其中的每座城市都建有水利设施。
var int: store_num;
constraint store_num=count(j in 1..M)(build[1,j]=store);

%solve

solve maximize desert_water*M-store_num;

%output

output[if fix(desert_water)==M then "1\n" else "0\n" endif];
output[if fix(desert_water)==M then "\(fix(store_num))" else "\(fix(M-desert_water))" endif];