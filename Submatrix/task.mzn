% NOIP2014-J T4
% input

int: N;
int: M;
int: R;
int: C;
array [1 .. N,1 .. M] of int: a;

% description

array [1 .. R] of var int: b;
array [1 .. C] of var int: c;

constraint 1 <= b[1] /\ b[R] <= N;
constraint forall(i in 1 .. R-1)(b[i] < b[i+1]);
constraint 1 <= c[1] /\ c[C] <= M; 
constraint forall(i in 1 .. C-1)(c[i] < c[i+1]);
%子矩阵：从一个矩阵当中选取某些行和某些列交叉位置所组成的新矩阵（保持行与列的相对顺序）被称为原矩阵的一个子矩阵。

var int: score;

score = sum(i in 1 .. R-1,j in 1 .. C)(abs(a[b[i], c[j]] - a[b[i + 1], c[j]]))
      + sum(i in 1 .. R,j in 1 .. C-1)(abs(a[b[i], c[j]] - a[b[i], c[j + 1]]));
%矩阵的分值：矩阵中每一对相邻元素之差的绝对值之和。

%solve

solve minimize score;
%请你从这个矩阵中选出一个 r 行 c 列的子矩阵，使得这个子矩阵的分值最小，并输出这个分值。

%output

output["score=" ++ show(score)];
