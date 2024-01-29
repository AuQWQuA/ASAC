% NOIP2009-J T4
% input

int: n;
int: m;
int: p;
array[1..n, 1..m] of int: coins;
array[1..n] of int: cost;

% description

array[1..m] of var 0..n: strategy;
array[1..m] of var 0..p: runtime;
% Each robot can walk on a circular road up to p times.

array[1..m] of var 1..n: location;

var 1..m: pointer;
var int: benefit;

constraint forall(i in 1..pointer)(strategy[i] != 0) /\ forall(i in pointer+1..m)(strategy[i] = 0);
constraint forall(i in 1..pointer)(runtime[i] != 0) /\ forall(i in pointer+1..m)(runtime[i] = 0);
constraint sum(runtime) = m;
% When a robot finishes its specified number of walks on the road, it will disappear automatically. Shinchan must immediately purchase a new robot from any robot factory and set a new number of walks for the new robot.

constraint forall(i in 1..pointer)(forall(j in 1..runtime[i])(location[sum([runtime[k] | k in 1..i-1]) + j] = (strategy[i] - 2 + j) mod n + 1));
% Once purchased, a robot will walk clockwise along the circular road, walking one unit each unit of time, i.e., from the current robot factory to the next adjacent robot factory.

constraint benefit = sum([coins[location[i], i] | i in 1..m]) - sum([cost[strategy[i]] | i in 1..pointer]);
% All the coins on the road that the robot passes through are collected by Shinchan.

%solve

solve maximize benefit;

%output

output[show(benefit) ++ "\n"];
