% NOIP2014-S D2T3
% input

int: n;
int: m;
array[1..n+1] of int: coefficient;

% description

array[1..m] of var bool: if_solution;
constraint forall(i in 1..m) (if_solution[i] = (sum([coefficient[j+1] * pow(i, j) | j in 0..n]) == 0));
% Find integer solutions for this equation within the range [1, m].
var int: solution_num = count(i in 1..m)(if_solution[i]);

%solve

solve satisfy;

% output

output[show(solution_num) ++ "\n"];
% The first line outputs the number of integer solutions for the equation within the range [1, m].
output[if fix(if_solution[i]) then "\(i)\n" else "" endif | i in 1..m];
% Following that, each line contains an integer, representing one of the integer solutions of the equation within [1, m].
