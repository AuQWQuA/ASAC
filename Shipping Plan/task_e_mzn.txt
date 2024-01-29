% NOIP2015-S D2T3
% input

include "all_different.mzn";
int: n;
int: m;
array[1..n-1, 1..3] of int: road;
array[1..m, 1..2] of int: plans;

% description

var 1..m: hole;

function var int: travel(var int: start, var int: end) =
let {
    array[1..n-1] of var 1..n-1: route;
    constraint alldifferent(route);
    var 1..n-1: len;
    constraint (road[route[1], 1] = start \/ road[route[1], 2] = start) /\ (road[route[len], 1] = end \/ road[route[len], 2] = end);
    constraint forall(i in 1..len-1) (road[route[i], 2] = road[route[i+1], 1] \/ road[route[i], 1] = road[route[i+1], 1] \/ road[route[i], 1] = road[route[i+1], 2] \/ road[route[i], 2] = road[route[i+1], 2]);
} in sum(i in 1..len)(if route[i] = hole then 0 else road[route[i], 3] endif);
% Allows Little P to transform a certain lane into a wormhole, and the spaceship passing through the wormhole does not consume time.
array[1..m] of var int: time;
constraint forall(i in 1..m)(time[i] = travel(plans[i, 1], plans[i, 2]));
var int: max_time = max(time);
% After the construction of the wormhole, these m transport plans will start simultaneously, and all spaceships will depart together. When these m transport plans are completed, Little P's logistics company completes its phase work.

%solve

solve minimize max_time;
% Find out the shortest time needed for Little P's logistics company to complete its phase work.

%output

output[show(max_time)];
