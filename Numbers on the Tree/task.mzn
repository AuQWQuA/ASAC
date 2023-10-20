%CSP2019-S D1T3
%input

include "all_different.mzn";
int: T;
array[1..T] of int: n;
int: sum_n=sum(n);
array[1..sum_n] of int: node;
array[1..sum_n-T,1..2] of int: edge;

%description

int: max_n=max(n);
array[1..T] of int: begin_n=[sum(j in 1..i-1)(n[j]) | i in 1..T];
array[1..sum_n] of var 1..max_n-1: delete;
constraint forall(t in 1..T)(forall(j in begin_n[t]+1..begin_n[t]+n[t]-1)(delete[j]<=n[t]-1));
constraint forall(t in 1..T)(alldifferent(delete[begin_n[t]+1..begin_n[t]+n[t]-1]));
array[1..sum_n,1..max_n] of var int: state;
constraint forall(t in 1..T)(state[begin_n[t]+1,1..n[t]]=node[begin_n[t]+1..begin_n[t]+n[t]]);

constraint forall(t in 1..T)(forall(i in begin_n[t]+2..begin_n[t]+n[t])(state[i,edge[delete[i],1]]=state[i-1,edge[delete[i],2]] 
/\ state[i,edge[delete[i],2]]=state[i-1,edge[delete[i],1]] /\ 
forall(k in 1..n[t] where k!=edge[delete[i],2] /\ k!=edge[delete[i],1])(state[i,k]=state[i-1,k])));

array[1..sum_n] of var int: p;
constraint forall(t in 1..T)(forall(j in 1..n[t])(state[begin_n[t]+n[t],p[j]]=j));
array[1..T] of var int: score;
constraint forall(i in 1..T)(score[i]=sum(j in 1..n[i])(pow(2,n[i]-j)*p[j+begin_n[i]]));

%solve

solve::int_search(state,first_fail,indomain)
 minimize sum(score);

%output

output[show(p)];