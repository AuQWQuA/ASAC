% NOIP2016-J T1

% input
int: n;
array[1..3,1..2] of int: pencil;

% description

int: max_single=max(i in 1..3)(ceil(pencil[i,2]/pencil[i,1]));
var 0..max_single*n: cost;
constraint
  ((cost div pencil[1, 2]) * pencil[1, 1] >= n)
  \/
  ((cost div pencil[2, 2]) * pencil[2, 1] >= n)
  \/
  ((cost div pencil[3, 2]) * pencil[3, 1] >= n);
% 商店不允许将铅笔的包装拆开，因此P老师可能需要购买超过n支铅笔采购给小朋友们发礼物

% solve

solve minimize cost;

% output

output["cost=" ++ show(cost)];