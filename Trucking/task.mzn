%NOIP2013-S D1T3
%input

int: n;
int: m;
% A 国有 n 座城市和 m 条道路。

array[1..m] of int: x;
array[1..m] of int: y;
array[1..m] of int: weight;
%从 x 号城市到 y 号城市有一条限重为 z 的道路

int: q;
%有 q 辆货车需要运货。

array[1..q] of int: start;
array[1..q] of int: end;
%一辆货车需要从 x 城市运输货物到 y 城市，注意：x 不等于 y

%description

array[1..n,1..n] of var bool: connection;
constraint forall(i in 1..m)(connection[x[i],y[i]]=true /\ connection[y[i],x[i]] /\ forall(j in 1..n)(connection[j,x[i]]=connection[j,y[i]] /\ connection[x[i],j]=connection[y[i],j]));

array[1..q,1..n] of var 1..n: route;
array[1..q,1..n] of var 1..m: roads;
array[1..q] of var 1..n: len;

constraint forall(i in 1..q where connection[start[i],end[i]])(
route[i,1]=start[i] /\
route[i,len[i]]=end[i] /\
forall(j in 1..len[i]-1)(exists(k in 1..m)( (x[k]=route[i,j] /\ y[k]=route[i,j+1] /\ roads[i,j]=k) \/ (y[k]=route[i,j] /\ x[k]=route[i,j+1] /\ roads[i,j]=k) ))
);

array[1..q] of var int: truck;
constraint forall(i in 1..q where connection[start[i],end[i]])
(truck[i]=min(j in 1..len[i]-1)(weight[roads[i,j]]));
%每辆车在不超过车辆限重的情况下

%solve

solve ::int_search(array1d(route),input_order, indomain, complete)
maximize sum(i in 1..q where connection[start[i],end[i]])(truck[i]);
%最多能运多重的货物

%output

output[if fix(connection[start[i],end[i]]) then "\(fix(truck[i]))" else "-1" endif ++ "\n" | i in 1..q]
%对于每一辆货车，它的最大载重是多少，如果货车不能到达目的地，输出-1。