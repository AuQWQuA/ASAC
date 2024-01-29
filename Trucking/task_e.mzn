% NOIP2013-S D1T3
% Input
int: n;
int: m;
% Country A has n cities and m roads.

array[1..m] of int: x;
array[1..m] of int: y;
array[1..m] of int: weight;
% There is a road with a weight limit of z from city x to city y.

int: q;
% There are q trucks that need to transport goods.

array[1..q] of int: start;
array[1..q] of int: end;
% A truck needs to transport goods from city x to city y, note that x is not equal to y.

% Description
array[1..n, 1..n] of var bool: connection;
constraint forall(i in 1..m)(connection[x[i], y[i]] = true /\ connection[y[i], x[i]] /\ forall(j in 1..n)(connection[j, x[i]] = connection[j, y[i]] /\ connection[x[i], j] = connection[y[i], j]));

array[1..q, 1..n] of var 1..n: route;
array[1..q, 1..n] of var 1..m: roads;
array[1..q] of var 1..n: len;

constraint forall(i in 1..q where connection[start[i], end[i]])(
    route[i, 1] = start[i] /\
    route[i, len[i]] = end[i] /\
    forall(j in 1..len[i]-1)(exists(k in 1..m)((x[k] = route[i, j] /\ y[k] = route[i, j+1] /\ roads[i, j] = k) \/ (y[k] = route[i, j] /\ x[k] = route[i, j+1] /\ roads[i, j] = k)))
);

array[1..q] of var int: truck;
constraint forall(i in 1..q where connection[start[i], end[i]])
    (truck[i] = min(j in 1..len[i]-1)(weight[roads[i, j]]));
% Each truck carries a maximum weight without exceeding the vehicle weight limit

%solve

solve :: int_search(array1d(route), input_order, indomain, complete)
    maximize sum(i in 1..q where connection[start[i], end[i]])(truck[i]);
% Find the maximum weight that can be transported

% Output
output[if fix(connection[start[i], end[i]]) then "\(fix(truck[i]))" else "-1" endif ++ "\n" | i in 1..q]
% For each truck, output its maximum load capacity, or -1 if the truck cannot reach the destination.
