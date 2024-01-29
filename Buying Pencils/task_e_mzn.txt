% NOIP2016-J T1

% input
int: n;
array[1..3,1..2] of int: pencil;

% description

int: max_single = max(i in 1..3)(ceil(pencil[i,2] / pencil[i,1]));
var 0..max_single * n: cost;

constraint
  ((cost div pencil[1, 2]) * pencil[1, 1] >= n)
  \/
  ((cost div pencil[2, 2]) * pencil[2, 1] >= n)
  \/
  ((cost div pencil[3, 2]) * pencil[3, 1] >= n);
% The store does not allow the packaging of pencils to be opened, so P teacher may need to buy more than n pencils to purchase gifts for the children.

% solve

solve minimize cost;

% output

output["cost=" ++ show(cost)];
