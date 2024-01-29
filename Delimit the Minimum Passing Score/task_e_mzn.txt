% NOIP2009-J T2
% input

include "alldifferent.mzn";
int: n;
int: m;
array[1..n] of int: id;
array[1..n] of int: score;

% description

var 1..100: split;
var int: num = floor(m * 1.5);
var int: actual;
array[1..n] of var 1..n: pass;

constraint count([score[i] >= split | i in 1..n]) = actual;
% If you plan to admit m volunteers, the interview score line is the score of the candidate ranked m * 150% (rounded down).

constraint actual >= num;
constraint alldifferent(pass);
constraint forall(i in 1..actual)(score[pass[i]] >= split);
% The final candidates who enter the interview are all candidates with scores not lower than the interview score line.

constraint forall(i in 1..actual-1)(
  score[pass[i]] > score[pass[i+1]] 
  \/ 
  (score[pass[i]] = score[pass[i+1]] /\ id[pass[i]] < id[pass[i+1]])
);
% Output in descending order of test scores, if scores are the same, output in ascending order of registration number.

%solve

solve maximize split;

%output

output[show(split) ++ " " ++ show(actual) ++ "\n"];
output[show(id[pass[i]]) ++ " " ++ show(score[pass[i]]) ++ "\n" | i in 1..fix(actual)];
