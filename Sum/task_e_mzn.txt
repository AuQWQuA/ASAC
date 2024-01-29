% NOIP2015-J T3
% Input

int: n;
int: m;
array[1..n] of int: color;
array[1..n] of int: number;

% Description

var int: total;
var int: res;

constraint total == sum(i in 1..n) (sum(j in i+1..n) (sum(k in j+1..n) (if color[i] == color[k] /\ k-j==j-i then (i+k)*(number[i]+number[k]) else 0 endif)));
% The score for a triplet that satisfies the above condition is defined as (x + z) * (number[x] + number[z]). 
% The score for the entire paper strip is defined as the sum of scores for all triplets that satisfy the condition.

constraint 0 <= res /\ res <= 10006;
constraint (total - res) mod 10007 == 0;

% Solve

solve satisfy;

% Output

output ["\(res)"];
