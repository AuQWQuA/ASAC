% CSP-J 2019 T4
% input

int: n;
int: m;
int: q;
array[1..m, 1..2] of int: belt;
array[1..q, 1..2] of int: order;

% description

int: L = max(i in 1..q)(order[i, 2]);
predicate connected(var int: x, var int: y) =
  exists(i in 1..m)((belt[i, 1] == x /\ belt[i, 2] == y) \/ (belt[i, 2] == x /\ belt[i, 1] == y));
% There are bidirectional part conveyor belts between some workers.

array[1..q, 1..n, 0..L] of var int: produce;

constraint forall(i in 1..q, j in 1..n, k in 0..L)(produce[i, j, k] >= 0);
constraint forall(i in 1..q)(produce[i, order[i, 1], order[i, 2]] = 1);
% Now, we have q work orders, where the i-th work order represents worker ai wanting to produce a part at stage Li.

constraint forall(i in 1..q)(
  forall(j, k in 1..n where j != k /\ connected(j, k))(
    forall(l in 1..order[i, 2])(produce[i, j, l] = produce[i, k, l-1])
  )
);
% If worker x wants to produce a part processed to stage L (L > 1), then all workers directly connected to worker x 
% through conveyor belts need to provide raw materials for worker x.

%solve

solve satisfy;

%output

output[(if fix(produce[i, 1, 0]) > 0 then "YES" else "NO" endif) ++ "\n" | i in 1..q];
