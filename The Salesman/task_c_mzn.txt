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
%阿明会从入口进入，依次向螺丝街的 X 家住户推销产品，然后再原路走出去。

predicate cost(var 1..n: i, var int: w) =
  w == sum(j in 1..r[i]) (choose[i, j] * A[j]) + S[r[i]] * 2;
%阿明每走 1 米就会积累 1 点疲劳值，向第 i 家住户推销产品会积累 Ai点疲劳值

constraint forall (i in 1.. n) (valid(i) /\ cost(i, c[i]));

%solve

solve maximize sum(i in 1..n) (c[i]);
%对于不同的 X，在不走多余的路的前提下，他最多可以积累多少点疲劳值。

%output

output["\(c)"];