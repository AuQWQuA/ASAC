% NOIP2012-J T4

int: N;
int: K;
int: M;
int: S;
int: T;
array[1 .. N] of 1 .. K: C;
array[1 .. K, 1 .. K] of 0 .. 1: A;
array[1 .. M] of 1 .. N: U;
array[1 .. M] of 1 .. N: V;
array[1 .. M] of int: D;

% description

var 1 .. K: L; 

array[1 .. K-1] of var 1..M: X; 
array[1 .. K-1] of var 0..1: Z; 
array[1 .. K] of var 1..N: Y; 

constraint forall(i in 1 .. L-1)((Y[i] = U[X[i]] /\ Z[i] = 0) \/ (Y[i] = V[X[i]] /\ Z[i] = 1)); 
constraint forall(i in 1 .. L-1)((Y[i + 1] = V[X[i]] /\ Z[i] = 0) \/ (Y[i + 1] = U[X[i]] /\ Z[i] = 1)); 

constraint Y[1] = S /\ Y[L] = T;
% The starting and ending points of the ambassador's journey.

constraint forall(i in 1 .. L-1,j in i+1 .. L)(C[Y[j]] != C[Y[i]]);
% But he doesn't want to learn any culture more than once.

constraint forall(i in 1 .. L-1,j in i+1 .. L)(A[C[Y[j]],C[Y[i]]] = 0);
% That is, if he learns a certain culture, he cannot visit countries that reject this culture.

var int: dist;
dist = sum(i in 1..L-1)(D[X[i]]);

%solve

solve minimize dist;

%output

output["dist=" ++ show(dist)];
