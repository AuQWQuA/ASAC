% NOIP2016-S D2T1
% input

int: T;
int: K;
array[1..T] of int: n;
array[1..T] of int: m;

% description

function var int: factorial(var int: x) =
  if x == 0 then 1 else
    product([i | i in 1..x]) endif;

array[1..T] of var int: ans;

constraint forall(t in 1..T)(
  ans[t] = count(i in 1..n[t], j in 1..m[t] where j <= i)
  (factorial(i) div ((factorial(j) * factorial(i - j))) mod K = 0)
);
% Xiaocong wants to know if given n, m, and k, for all 0<=i<=n and 0<=j<=min(i, m), how many pairs (i, j) satisfy that C(i, j) is a multiple of k.

%solve

solve satisfy;

%output

output[show(ans)];
