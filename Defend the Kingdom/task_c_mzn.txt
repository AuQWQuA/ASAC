%NOIP2018-S D2T3
%input

int: n;
int: m;
array[1..n] of int: p;
array[1..n-1,1..2] of int: road;
array[1..m,1..4] of int: request;

%description

array[1..m,1..n] of var 0..1: troop;
%一座城市可以驻扎一支军队，也可以不驻扎军队
array[1..m] of var int: score;
constraint forall(i in 1..m)(if request[i,2]==0 /\ request[i,4]==0 /\ exists(j in 1..n-1)
((road[j,1]=request[i,1] /\ road[j,2]=request[i,3]) \/ (road[j,2]=request[i,1] /\ road[j,1]=request[i,3])) then score[i]=-1 else score[i]>=0 endif);
%。如果国王提出的第j个要求无法满足，则需要输出-1 
constraint forall(i in 1..m)(if score[i]!=-1 then troop[i,request[i,1]]=request[i,2] /\ troop[i,request[i,3]]=request[i,4] endif);
%但是国王又给小 Z 提出了m个要求，每个要求规定了其中两座城市是否驻扎军队。
constraint forall(i in 1..m)(forall(j in 1..n-1)(not(troop[i,road[j,1]]==0 /\ troop[i,road[j,2]]==0)));
%由道路直接连接的两座城市中至少要有一座城市驻扎军队。
constraint forall(i in 1..m where score[i]!=-1)(score[i]=sum(j in 1..n)(troop[i,j]*p[j]));
%在城市里驻扎军队会产生花费，在编号为i的城市中驻扎军队的花费是pi。

%solve

solve minimize sum(score);
%则需要给出在此要求前提下驻扎军队的最小开销。

%output

output[show(score)];
