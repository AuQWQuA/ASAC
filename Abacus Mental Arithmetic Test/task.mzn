% NOIP2014-J T1
%input
int: n;
array [1..n] of int: data;

%description

set of int: ans = { i | i, j, k in data where i = j + k /\ j != k };
%其中有多少个数，恰好等于集合中另外两个（不同的）数之和？

%solve

solve satisfy;

%output

output[show(card(ans))];