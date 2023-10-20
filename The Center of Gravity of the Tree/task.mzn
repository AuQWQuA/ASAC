%CSP2019-S D2T3
%input
include "alldifferent.mzn";
int: n;
array[1..n-1,1..2] of int: edge;

array[1..n-1,1..2] of var set of 1..n: subtree;

predicate connect_without(var int: a,var int: b,var set of 1..n-1: e)=
let{
var 1..n-1: len;
array[1..n-1] of var 1..n-1: route;
array[1..n] of var 1..n: node;
constraint alldifferent(route);
constraint alldifferent(node);
constraint forall(i in 1..len)((edge[route[i],1]=node[i] /\ edge[route[i],2]=node[i+1]) 
\/ (edge[route[i],2]=node[i] /\ edge[route[i],1]=node[i+1]));
constraint node[1]=a /\ node[len+1]=b;
} in forall(i in 1..len)(not (route[i] in e));

%predicate center(var set of 1..n: node_set,var 1..n: c)=


constraint forall(i in 1..n-1)(edge[i,1] in subtree[i,1] /\ edge[i,2] in subtree[i,2] /\ forall(j,k in subtree[i,1] where j!=k)(connect_without(j,k,{i})) /\ forall(j,k in subtree[i,2] where j!=k)(connect_without(j,k,{i})) );

array[1..n-1,1..2,1..n] of var set of 1..n: subsubtree;
array[1..n-1,1..2] of var 1..n: center;
constraint forall(i in 1..n-1,j in 1..2)(forall(k in 1..n)(forall(x,y in subsubtree[i,j,k] where x!=y)
(connect_without(x,y,{t| t in 1..n-1 where edge[t,1]!=center[i,j] /\ edge[t,2]!=center[i,j]} union {i})) /\ card(subsubtree[i,j,k])<=n div 2) 
/\ sum(k in 1..n where card(subsubtree[i,j,k])>0)(1) = sum(l in 1..n-1 where l!=i /\ (edge[l,1]=center[i,j] \/ edge[l,2]=center[i,j]))(1));

constraint forall(i in 1..n-1,j in 1..2)(center[i,j] in subtree[i,j]);



solve satisfy;
output[show(center)];




