% NOIP2005-J T4
% input

int: n;
int: k;
% The input file contains only one line, with two integers n (1 <= n < 10100) and k (1 <= k <= 100), separated by a space. It represents the required cycle length of the last k digits of n raised to positive integer powers.

% description

int: len = pow(10, k);
array[1..len] of var int: suffix;

constraint forall(i in 1..len)(suffix[i] = pow(n, i) mod pow(10, k));

%solve

solve satisfy;

var set of int: out_set = {i | i in 2..len where suffix[i] = suffix[1]};
% If the cycle length is L, it means that for any positive integer a, the last k digits of n to the power of a and a + L are the same.

% output

output[if (fix(suffix[1]) in array2set(fix(suffix[2..len]))) then "\(min(fix(out_set))-1)" else "-1" endif];
% This line contains only one integer, representing the cycle length. If there is no cycle, output -1.
