% NOIP2015-S D1T1
% input

include "all_different.mzn";
int: N;

% description

array[1..N, 1..N] of var 1..N*N: square;
constraint alldifferent(square);
constraint square[1, N div 2 + 1] = 1;
% Start by placing 1 in the middle of the first row.

constraint forall(i in 2..N*N)(
  let{
    var 1..N: x;
    var 1..N: y;
    constraint square[x, y] = i-1;
  } in 
  (
    (x=1 /\ y!=N /\ square[N, y+1]=i) \/ 
    % If (K - 1) is in the first row but not in the last column, place K in the last row, one column to the right of (K - 1).
    (x!=1 /\ y=N /\ square[x-1, 1]=i) \/
    % If (K - 1) is in the last column but not in the first row, place K in the first column, one row above (K - 1).
    (x=1 /\ y=N /\ square[x+1, y]=i) \/
    % If (K - 1) is in the first row and last column, place K directly below (K - 1).
    (x!=1 /\ y!=N /\ (square[x-1, y+1]=i \/ (square[x-1, y+1]<i /\ square[x+1, y]=i) ))
    % If (K - 1) is neither in the first row nor in the last column, if the upper right corner of (K - 1) is not filled, place K there; otherwise, place K directly below (K - 1).
  )
);

%solve

solve satisfy;

%output

output["\(square[i, j])" ++ if j==N then "\n" else " " endif | i in 1..N, j in 1..N];
