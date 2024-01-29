% NOIP2014-S D1T2
% input

int: n;
array[1..n-1,1..2] of int: roads;
array[1..n] of int: W;

% description

function var int: distance(var int: node1, var int: node2) =
let{
  array[0..n] of var 1..n: route;
  var 1..n-1: len;
  constraint route[0] = node1;
  constraint route[len] = node2;
  constraint forall(i in 0..len-1)(exists(j in 1..n-1)((route[i] = roads[j,1] /\ route[i+1] = roads[j,2]) \/ (route[i+1] = roads[j,1] /\ route[i] = roads[j,2])));
} in len;

% The distance between two nodes (u, v) on the graph is defined as the shortest distance from node u to node v.

array[1..n,1..n] of var int: matrix;

constraint forall(i,j in 1..n where i != j)(matrix[i,j] = distance(i,j));

var int: max_weight = max(i,j in 1..n where matrix[i,j] == 2)(W[i] * W[j]);
var int: sum_weight = sum(i,j in 1..n where matrix[i,j] == 2)(W[i] * W[j]) mod 10007;
% If their distance is 2, they will generate a joint weight of Wu × Wv.
% The question is to find the maximum joint weight among all ordered pairs of points on graph G that can generate joint weights. Also, find the sum of all joint weights. Since the sum can be large, output it modulo 10007.

%solve

solve satisfy;

%output

output["\(max_weight) \(sum_weight)"];
