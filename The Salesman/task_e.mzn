%NOIP2015-J T4
%input

int: n;
array[1..n] of int: S;
array[1..n] of int: A;

%description

array[1..n, 1..n] of var 0..1: choose;
array[1..n] of var 1..n: r; 
array[1..n] of var int: c;

predicate valid(var 1..n: i) =
  choose[i, r[i]] == 1 /\ sum(j in 1..r[i]) (choose[i, j]) == i;
% Ah Ming will enter from the entrance and sell products to residents of Screw Street's X houses in sequence, and then walk back the same way.

predicate cost(var 1..n: i, var int: w) =
  w == sum(j in 1..r[i]) (choose[i, j] * A[j]) + S[r[i]] * 2;
% Ah Ming accumulates 1 fatigue point for every 1 meter he walks. Selling products to the i-th household accumulates Ai fatigue points.

constraint forall (i in 1.. n) (valid(i) /\ cost(i, c[i]));

%solve

solve maximize sum(i in 1..n) (c[i]);
% For different X's, without taking unnecessary detours, how many fatigue points can he accumulate at most?

%output

output["\(c)"];
