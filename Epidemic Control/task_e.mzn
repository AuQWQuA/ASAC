%NOIP2012-S D2T3
%input

include "alldifferent.mzn";
int: n;
array[1..n-1] of int: u;
array[1..n-1] of int: v;
array[1..n-1] of int: w;
% u, v, w, separated by a space, represent a road from city u to city v with a length of w.
int: m;
array[1..m] of int: army;
% These m armies are represented by the city numbers where they are stationed.

%description

predicate if_leaf(var int: c) =
    not(exists(i in 1..n-1)(u[i] = c) /\ exists(j in 1..n-1)(v[j] = c)) /\ c != 1;

function var int: length(var int: c1, var int: c2) =
    let {
        var 1..n: num;
        array[1..n] of var 1..n: route;
        constraint all_different(route);
        constraint route[1] = c1;
        constraint route[num] = c2;
        constraint forall(i in 1..num-1)(exists(j in 1..n-1)((route[i] = u[j] /\ route[i+1] = v[j]) \/ (route[i] = v[j] /\ route[i+1] = u[j])));
        var int: l;
        constraint l = sum(i in 1..n-1 where exists(j in 1..num-1)(route[j] = u[i] /\ route[j+1] = v[i]) \/ exists(j in 1..num-1)(route[j] = v[i] /\ route[j+1] = u[i]))
                        (w[i]);
    } in l;
    % The time needed for an army to move from one city to another through a road is equal to the length of the road (in hours).

array[1..m] of var 1..n: camp;
array[1..n] of var bool: city;
constraint city[1] = false;
% The capital city cannot have a checkpoint.

constraint forall(i in 1..n)(if i in array2set(camp) then city[i] = true else city[i] = false endif);
constraint forall(i in 1..n where if_leaf(i))(
    let {
        var 1..n: num;
        array[1..n] of var 1..n: route;
        constraint all_different(route);
        constraint route[1] = 1;
        constraint route[num] = i;
        constraint forall(k in 1..num-1)(exists(j in 1..n-1)((route[k] = u[j] /\ route[k+1] = v[j]) \/ (route[k] = v[j] /\ route[k+1] = u[j])));
        var bool: b;
        constraint b -> (exists(k in 1..num)(city[route[k]] = true));
        % Ensure that there is at least one checkpoint on each path from the capital to a border city, and border cities can have checkpoints.
    } in b);

array[1..m] of var int: time;
constraint forall(i in 1..m)(time[i] = length(army[i], camp[i]));
var int: max_time;
constraint max_time = max(time);
% Find the minimum number of hours needed to control the epidemic. Note: Different armies can move simultaneously.

%solve

solve minimize max_time;

%output

output[show(max_time)];
