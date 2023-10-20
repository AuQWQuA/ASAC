% NOIP2014-J T3
%input

int :N;
int :I;
int :J;

%description

array [1 .. 4,1 .. 2] of var int: d;
constraint d[1,1] = 0 /\ d[1,2] = 1 /\ d[2,1] = 1 /\ d[2,2] = 0 /\ d[3,1] = 0 /\ d[3,2] = -1 /\ d[4,1] = -1 /\ d[4,2] = 0;

array [0 .. N+1,0 .. N+1] of var int: a;

array [1 .. N,1 .. N] of var int: b;
array [1 .. N,1 .. N] of var int: c;

constraint forall(i in 1 .. N,j in 1 .. N)((a[i,j] >= 1) /\ (a[i,j] <= N*N));
constraint forall(i in 1 .. N,j in 1 .. N,ii in 1 .. N,jj in 1 .. N)(((i = ii) /\ (j = jj)) \/ (a[i,j] != a[ii,jj]));
constraint forall(i in 0 .. N+1)(a[0,i] = 0 /\ a[N+1,i] = 0 /\ a[i,0] = 0 /\ a[i,N+1] = 0); 

constraint a[1,1] = 1;
constraint c[1,1] = 1;

constraint forall(i in 1 .. N,j in 1 .. N)(
(a[i,j] = N*N) \/ 
((a[i + d[c[i,j],1],j + d[c[i,j],2]] < a[i,j]) /\ (b[i,j] = (c[i,j] mod 4) + 1)) \/
((a[i + d[c[i,j],1],j + d[c[i,j],2]] > a[i,j]) /\ (b[i,j] =  c[i,j]))
);
%从矩阵的左上角（第 1 行第 1 列）出发，初始时向右移动；如果前方是未曾经过的格子，则继续前进，否则右转；重复上述操作直至经过矩阵中所有格子。

constraint forall(i in 1 .. N,j in 1 .. N)((a[i,j] = N*N) \/ (c[i + d[b[i,j],1],j + d[b[i,j],2]] = b[i,j]));
constraint forall(i in 1 .. N,j in 1 .. N)((a[i,j] = N*N) \/ (a[i + d[b[i,j],1],j + d[b[i,j],2]] = a[i,j] + 1));

%solve

solve satisfy;

%output

output["ans=" ++ show(a[I,J])];
