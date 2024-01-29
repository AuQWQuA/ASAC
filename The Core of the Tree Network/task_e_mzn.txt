% NOIP2007-S T4
include "alldifferent.mzn";

% Input
int: n;
int: s;
array[1..n-1, 1..3] of int: edge;

% Description

function array[0..n-1] of var 0..n-1: find_route(var int: a, var int: b) =
let {
    array[0..n-1] of var 0..n-1: tmp;
    var 0..n-1: len;
    array[1..n] of var 1..n: route;

    constraint all_different(tmp[1..n-1]);
    constraint route[1] = a;
    constraint route[len+1] = b;
    constraint forall(i in 1..len)((edge[tmp[i], 1] = route[i] /\ edge[tmp[i], 2] = route[i+1]) \/ (edge[tmp[i], 1] = route[i+1] /\ edge[tmp[i], 2] = route[i]));
    constraint tmp[0] = len;
} in tmp;
% In a tree network, there exists a unique simple path between any two nodes a and b.

function var int: get_distance(array[0..n-1] of var 0..n-1: roads) =
if roads[0] == 0 then 0 else sum(i in 1..roads[0])(edge[roads[i], 3]) endif;
% The distance d(a, b) between endpoints a and b of a path is the sum of the lengths of all edges on that path.

function var int: get_point_distance(var int: p, array[0..n-1] of var 0..n-1: roads) =
let {
    var 0..n-1: len;
    constraint len = roads[0];
    array[1..n, 1..2] of var int: p_distance;
    constraint forall(i in 1..len, j in 1..2)(p_distance[i, j] = get_distance(find_route(edge[roads[i], j], p)));
    var int: tmp;
    constraint tmp = min(i in 1..len, j in 1..2)(p_distance[i, j]);
} in tmp;
% The distance from a point v to a path P is the distance from v to the nearest node on P: d(v, P) = min{d(v, u), u is a node on path P}.

function var int: find_diameter() =
max(i, j in 1..n where i != j)(get_distance(find_route(i, j)));

var int: diameter;
constraint diameter = find_diameter();

predicate if_diameter(array[0..n-1] of var 0..n-1: roads) =
get_distance(roads) = diameter;
% The longest path in a tree network is called the diameter of the tree network.

function var int: ECC(array[0..n-1] of var 0..n-1: roads) =
let {
    array[1..n] of var int: ecc_distance;
    constraint forall(i in 1..n)(ecc_distance[i] = get_point_distance(i, roads))
} in max(ecc_distance);
% Eccentricity ECC(F): The distance from the node in the tree network that is farthest from path F to path F, 
% i.e., ECC(F) = max{d(v, F), v∈V}.

var 1..n: begin;
var 1..n: end;
array[0..n-1] of var 0..n-1: dia_roads = find_route(begin, end);
constraint if_diameter(dia_roads);

var int: length = dia_roads[0];
var 1..n-1: core_begin;
var 1..n-1: core_end;
constraint core_begin <= core_end /\ core_end <= length;
% Find a path F that is a segment of a diameter (with both ends as nodes in the tree network).

array[0..n-1] of var 0..n-1: core;
constraint core[0] = core_end - core_begin;
constraint forall(i in 1..core_end-core_begin)(core[i] = dia_roads[i+core_begin-1]);
constraint get_distance(core) <= s;
% The length of the path F should not exceed s (it can be equal to s).

var int: ans = ECC(core);

% Solve

solve minimize ans;
% Minimize the eccentricity ECC(F).

% Output

output [show(ans)];
