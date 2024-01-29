% NOIP2007-S T3
% input

int: n;
int: m;
array[1..n, 1..m] of int: number;

% description

enum choice = {head, tail};
% Each time, elements taken can only be the first or last element of their respective rows.
array[1..n, 1..m] of var choice: take_number;
% Each time, one element must be taken from each row, a total of n elements. After m iterations, all elements in the matrix are taken.

function var int: cal_score(array[1..m] of var int: row, array[1..m] of var choice: actions) =
  sum(i in 1..m)(pow(2,i) * (if actions[i] == head then row[count(j in 1..i)(actions[j] == head)] else row[m + 1 - count(j in 1..i)(actions[j] == tail)] endif));
% Each time an element is taken, it has a score, which is the sum of the scores for taking elements from each row. The score for taking elements from each row is equal to the value of the taken element multiplied by 2^i, where i represents the i-th time an element is taken (starting from 1).

var int: total_score;
constraint total_score = sum(i in 1..n)(cal_score(number[i, 1..m], take_number[i, 1..m]));
% The total score when the game ends is the sum of the scores obtained in m iterations.

%solve

solve maximize total_score;
% Shuai Shuai wants you to help write a program that can calculate the maximum score after taking elements from any matrix.

%output

output[show(total_score)];
