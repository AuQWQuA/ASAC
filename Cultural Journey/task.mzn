% NOIP2012-J T4
int: N;
int: K;
int: M;
int: S;
int: T;
array[1 .. N] of 1 .. K: C;
array[1 .. K,1 .. K] of 0 .. 1: A;
array[1 .. M] of 1 .. N: U;
array[1 .. M] of 1 .. N: V;
array[1 .. M] of int: D;

%description

var 1 .. K: L; 

array[1 .. K-1] of var 1..M: X; 
array[1 .. K-1] of var 0..1: Z; 
array[1 .. K] of var 1..N: Y; 


constraint forall(i in 1 .. L-1)((Y[i] = U[X[i]] /\ Z[i] = 0) \/ (Y[i] = V[X[i]] /\ Z[i] = 1)); 
constraint forall(i in 1 .. L-1)((Y[i + 1] = V[X[i]] /\ Z[i] = 0) \/ (Y[i + 1] = U[X[i]] /\ Z[i] = 1)); 

constraint Y[1] = S /\ Y[L] = T;
%这位使者游历的起点和终点

constraint forall(i in 1 .. L-1,j in i+1 .. L)(C[Y[j]] != C[Y[i]]); 
%但他不愿意学习任何一种文化超过一次

constraint forall(i in 1 .. L-1,j in i+1 .. L)(A[C[Y[j]],C[Y[i]]] = 0); 
%即如果他学习了某种文化，则他不能到达排斥这种文化的其他国家

var int: dist;
dist = sum(i in 1..L-1)(D[X[i]]);

%solve

solve minimize dist;

%output

output["dist=" ++ show(dist)];
