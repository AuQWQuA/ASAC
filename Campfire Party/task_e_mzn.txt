% NOIP2005-S T3
include "alldifferent.mzn";

% input

int: n;
array[1..n, 1..2] of int: like;
% The first line of the input file is an integer n (3 <= n <= 50000), representing the total number of students. Following that, there are n lines, each containing two different positive integers separated by a space. These integers represent the most preferred neighboring students for each student from 1 to n.

% description

array[1..n, 1..n] of var 1..n: shift;
array[1..n] of var 1..n: M;

array[1..n, 1..n] of var 1..n: position;

function var int: precede(int: i) =
  if i > 1 then i - 1 else n endif;

function var int: follow(int: i) =
  if i < n then i + 1 else 1 endif;

predicate move(array[1..n] of var int: before, array[1..n] of var int: after, array[1..n] of var int: shift_list, var 1..n: m) =
  forall(i in 1..m-1)(before[shift_list[i]] = after[shift_list[i+1]]) /\
  before[shift_list[m]] = after[shift_list[1]] /\
  forall(j in 1..n where forall(k in 1..m)(j != shift_list[k]))(after[j] = before[j]);
% This predicate is used to move m students with the numbers b_1, b_2, ..., b_m. It requires b_1 to move to the position of b_2, b_2 to the position of b_3, ..., and b_m to move to the position of b_1.

var 1..n: steps;
constraint forall(i in 1..steps)(alldifferent(shift[i, 1..n]));
constraint forall(i in 1..n)(alldifferent(position[i, 1..n]));
constraint forall(i in 1..n)(position[1, i] = i);
% Initially, the students are seated in a circle in the order of 1, 2, ..., n.

constraint forall(i in 1..n)(position[steps, precede(i)] = like[position[steps, i], 1] /\
  position[steps, follow(i)] = like[position[steps, i], 2] \/
  position[steps, precede(i)] = like[position[steps, i], 2] /\
  position[steps, follow(i)] = like[position[steps, i], 1]);
% In reality, each student has two most preferred neighboring students.

constraint forall(i in 1..steps-1)(move(position[i, 1..n], position[i+1, 1..n], shift[i, 1..n], M[i]));

var int: ans;
constraint ans = sum([M[i] | i in 1..steps-1]);
% Each command requires some cost. We assume that if a command moves mm students, then the cost of that command is mm.

% solve

solve minimize ans;

% output

output[show(ans)];
% The output file consists of a single line containing an integer, which represents the minimum total cost. If it is impossible to satisfy the preferences of each student no matter how they are arranged, then output -1.
