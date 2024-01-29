%NOIP2015-S D1T1
%input

include "all_different.mzn";
int: N;

%description

array[1..N,1..N] of var 1..N*N: square;
constraint alldifferent(square);
constraint square[1,N div 2+1]=1;
%首先将 1 写在第一行的中间
constraint forall(i in 2..N*N)(
let{
var 1..N: x;
var 1..N: y;
constraint square[x,y]=i-1;
} in 
(
(x=1 /\ y!=N /\ square[N,y+1]=i) \/ 
%若 (𝐾 − 1) 在第一行但不在最后一列，则将 𝐾 填在最后一行， (𝐾 − 1) 所在列的右一列；
(x!=1 /\ y=N /\ square[x-1,1]=i) \/
%若 (𝐾 − 1) 在最后一列但不在第一行，则将 𝐾 填在第一列，(𝐾 − 1) 所在行的上一行；
(x=1 /\ y=N /\ square[x+1,y]=i) \/
%若 (𝐾 − 1) 在第一行最后一列，则将 𝐾 填在 (𝐾 − 1) 的正下方；
(x!=1 /\ y!=N /\ (square[x-1,y+1]=i \/ (square[x-1,y+1]<i /\ square[x+1,y]=i) ))
%若 (𝐾 − 1) 既不在第一行，也不在最后一列，如果 (𝐾 − 1) 的右上方还未填数，则将 K 填在(𝐾 − 1)的右上方，否则将 𝐾 填在 (𝐾 − 1) 的正下方
)); 

%solve

solve satisfy;

%output

output["\(square[i,j])" ++ if j==N then "\n" else " " endif | i in 1..N,j in 1..N];