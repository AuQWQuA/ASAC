%CSP-J 2019 T4
%input

int: n;
int: m;
int: q;
array[1..m,1..2] of int: belt;
array[1..q,1..2] of int: order;

%description

int: L=max(i in 1..q)(order[i,2]);
predicate connected(var int: x,var int: y)=
exists(i in 1..m)((belt[i,1]==x /\ belt[i,2]==y) \/ (belt[i,2]==x /\ belt[i,1]==y));
%某些工人之间存在双向的零件传送带

array[1..q,1..n,0..L] of var int: produce;

constraint forall(i in 1..q,j in 1..n,k in 0..L)(produce[i,j,k]>=0);
constraint forall(i in 1..q)(produce[i,order[i,1],order[i,2]]=1);
%现在给出q张工单，第i张工代表示编号为ai的工人想生产一个第Li阶段的零件。

constraint forall(i in 1..q)(forall(j,k in 1..n where j!=k /\ connected(j,k))(forall(l in 1..order[i,2])(produce[i,j,l]=produce[i,k,l-1])));
%如果第x号工人想生产一个被加工到L(L>1)阶段的零件，则所有与x号工人有传送带直接相连的工人，都需要为x号工人提供一个原材料。

%solve

solve satisfy;

%output

output[(if fix(produce[i,1,0])>0 then "YES" else "NO" endif) ++ "\n" | i in 1..q];

