% NOIP2007-J T1
% input

include "alldifferent.mzn";
int: n;
array[1..n, 1..3] of int: grades;
% The first line is a positive integer n, indicating the number of students participating in the selection.
% The next n lines, each with 3 numbers separated by spaces, represent the scores of students in Chinese, Mathematics, and English. The 3 numbers in the j-th line represent the scores of the student with the student number j-1 in the order of input. Each student is numbered from 1 to n (exactly the line number of the input data minus 1).

% description

array[1..n] of var 1..n: rank;

predicate prec(array[1..n] of var 1..n: rank, int: i, int: j) =
grades[rank[i], 1] + grades[rank[i], 2] + grades[rank[i], 3] > grades[rank[j], 1] + grades[rank[j], 2] + grades[rank[j], 3]
% First, sort by total score from high to low.
\/ (grades[rank[i], 1] + grades[rank[i], 2] + grades[rank[i], 3] = grades[rank[j], 1] + grades[rank[j], 2] + grades[rank[j], 3] /\ grades[rank[i], 1] > grades[rank[j], 1])
% If two students have the same total score, sort by Chinese score from high to low.
\/ (grades[rank[i], 1] + grades[rank[i], 2] + grades[rank[i], 3] = grades[rank[j], 1] + grades[rank[j], 2] + grades[rank[j], 3] /\ grades[rank[i], 1] = grades[rank[j], 1] /\ rank[i] < rank[j]);
% If two students have the same total score and Chinese score, the student with the smaller student number is ranked first.

constraint alldifferent(rank);
constraint forall(i in 1..n-1)(rank[i] < rank[i+1]);
constraint forall(i, j in 1..n where i < j)(prec(rank, i, j));

%solve

solve satisfy;

%output

output["\(rank[i]) \(grades[rank[i], 1] + grades[rank[i], 2] + grades[rank[i], 3])\n" | i in 1..5];
% Each line consists of two positive integers separated by a space, representing the student number and the total score of the top 5 students.
