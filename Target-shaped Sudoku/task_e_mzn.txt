% NOIP2009-S T4
% Input

include "alldifferent.mzn";
array[1..9, 1..9] of int: origin;

% Description

array[1..9, 1..9] of var 1..9: sudoku;
array[1..9, 1..9] of var int: score =
    [|6, 6, 6, 6, 6, 6, 6, 6, 6|
    6, 7, 7, 7, 7, 7, 7, 7, 6|
    6, 7, 8, 8, 8, 8, 8, 7, 6|
    6, 7, 8, 9, 9, 9, 8, 7, 6|
    6, 7, 8, 9, 10, 9, 8, 7, 6|
    6, 7, 8, 9, 9, 9, 8, 7, 6|
    6, 7, 8, 8, 8, 8, 8, 7, 6|
    6, 7, 7, 7, 7, 7, 7, 7, 6|
    6, 6, 6, 6, 6, 6, 6, 6, 6|];

constraint forall(i, j in 1..9)(if origin[i, j] != 0 then sudoku[i, j] = origin[i, j] endif);
constraint forall(i in 1..9)(alldifferent(sudoku[i, 1..9]) /\ alldifferent(sudoku[1..9, i]));
% Each number cannot repeat in each row and each column.
constraint forall(i, j in 1..3)(alldifferent(sudoku[i*3-2..i*3, j*3-2..j*3]));
% Each number cannot repeat in each small 3x3 grid.

var int: total_score;
constraint total_score = sum([score[i, j] * sudoku[i, j] | i, j in 1..9]);
% The total score is the sum of the product of the score in each cell and the number filled in that cell when completing the Sudoku.

% Solve

solve maximize total_score;

% Output

output [show(total_score)];
