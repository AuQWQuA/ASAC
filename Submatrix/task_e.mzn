% NOIP2014-J T4
% Input

int: N;
int: M;
int: R;
int: C;
array[1 .. N, 1 .. M] of int: a;

% Description

array[1 .. R] of var int: b;
array[1 .. C] of var int: c;

constraint 1 <= b[1] /\ b[R] <= N;
constraint forall(i in 1 .. R-1)(b[i] < b[i+1]);
constraint 1 <= c[1] /\ c[C] <= M; 
constraint forall(i in 1 .. C-1)(c[i] < c[i+1]);
% Submatrix: A new matrix formed by selecting certain rows and columns from an original matrix 
% (while preserving the relative order of rows and columns) is called a submatrix of the original matrix.

var int: score;

score = sum(i in 1 .. R-1, j in 1 .. C)(abs(a[b[i], c[j]] - a[b[i + 1], c[j]]))
      + sum(i in 1 .. R, j in 1 .. C-1)(abs(a[b[i], c[j]] - a[b[i], c[j + 1]]));
% Matrix Score: The sum of the absolute differences between each pair of adjacent elements in the matrix.

% Solve

solve minimize score;
% Please select an r-row c-column submatrix from this matrix such that the score of this submatrix is minimized, and output this score.

% Output

output ["score=" ++ show(score)];
