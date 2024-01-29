% NOIP2014-J T1
%input
int: n;
array [1..n] of int: data;

%description

set of int: ans = { i | i, j, k in data where i = j + k /\ j != k };
% How many numbers are exactly equal to the sum of two other (different) numbers in the set?

%solve

solve satisfy;

%output

output[show(card(ans))];