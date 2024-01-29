%NOIP2009-S T4
%input

include "alldifferent.mzn";
array[1..9,1..9] of int: origin;

%description

array[1..9,1..9] of var 1..9: sudoku;
array[1..9,1..9] of var int: score=
[|6,6,6,6,6,6,6,6,6|
6,7,7,7,7,7,7,7,6|
6,7,8,8,8,8,8,7,6|
6,7,8,9,9,9,8,7,6|
6,7,8,9,10,9,8,7,6|
6,7,8,9,9,9,8,7,6|
6,7,8,8,8,8,8,7,6|
6,7,7,7,7,7,7,7,6|
6,6,6,6,6,6,6,6,6|];

constraint forall(i,j in 1..9)(if origin[i,j]!=0 then sudoku[i,j]=origin[i,j] endif);
constraint forall(i in 1..9)(alldifferent(sudoku[i,1..9]) /\ alldifferent(sudoku[1..9,i]));
%每个数字在每行、每列也不能重复出现
constraint forall(i,j in 1..3)(alldifferent(sudoku[i*3-2..i*3,j*3-2..j*3]));
%每个数字在每个小九宫格内不能重复出现

var int: total_score;
constraint total_score=sum([score[i,j] * sudoku[i,j] | i,j in 1..9]);
%总分数即每个方格上的分值和完成这个数独时填在相应格上的数字的乘积的总和。

%solve

solve maximize total_score;

%output

output[show(total_score)];
