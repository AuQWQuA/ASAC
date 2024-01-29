% NOIP2016 Junior T4
% input

int: n;
int: m;
array[1..m] of 1..n: X;

% description

array[1..m, 1..4] of var int: ans;

int: max_num = m * (m-1) * (m-2) * (m-3) div (4 * 3 * 2 * 1);
array[1..max_num, 1..4] of var 1..m: magic;
var 0..max_num: num;

constraint forall(i, j in 1..num where i != j)(not(forall(k in 1..4)(magic[i, k] = magic[j, k])));
constraint forall(i in 1..num)(
  forall(j in 1..3)(X[magic[i, j]] < X[magic[i, j+1]]) /\
  (X[magic[i, 2]] - X[magic[i, 1]] = 2 * (X[magic[i, 4]] - X[magic[i, 3]])) /\
  (3 * (X[magic[i, 2]] - X[magic[i, 1]]) < (X[magic[i, 3]] - X[magic[i, 2]]))
);
% Four magic items with IDs a, b, c, and d form a magic formation if and only if xa < xb < xc < xd, xb-xa=2(xd-xc), and xb-xa<(xc-xb)/3.

constraint forall(i in 1..m, j in 1..4)(ans[i, j] = sum(k in 1..num where magic[k, j] == i)(1));
% Now, the grand wizard wants to know, for each magic item, the number of times it appears as an A item, B item, C item, and D item in a magic formation.

%solve

solve::int_search(array1d(magic), input_order, indomain, complete) maximize num;

%output

output["\(ans[i,1]) \(ans[i,2]) \(ans[i,3]) \(ans[i,4])\n" | i in 1..m];
