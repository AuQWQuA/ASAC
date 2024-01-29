% NOIP2018-S D2T1
% Input
int: n;
int: m;
array[1..m, 1..2] of int: road;

% Description
array[1..2*n] of var 1..n: route;
var 1..2*n: length;
constraint route[length] = route[1];
% When Little Y returns to the starting point, she can choose to end the trip or continue traveling.
constraint forall(i in 1..n)(exists(k in 1..length)(route[k] = i));
% Little Y requires that in the travel plan, every city is visited.
constraint forall(i in 2..length)(forall(j in 1..i-2)(route[i] != route[j]) 
\/ if min(j in 1..i-2 where route[j] = route[i-1])(j) >= 2 then route[i] = route[min(j in 1..i-2 where route[j] = route[i-1])(j) - 1] endif);
% Each time, she can choose a road connected to the current city and move to a city she hasn't visited yet, or backtrack to the previous city along the road she passed when visiting that city for the first time.
constraint forall(i in 2..length)
(exists(k in 1..m)((route[i] = road[k, 1] /\ route[i-1] = road[k, 2]) \/ (route[i] = road[k, 2] /\ route[i-1] = road[k, 1])));

array[1..n] of var 1..n: first;
constraint forall(i, j in 1..n where i < j)
    (min(k in 1..length where route[k] = first[i])(k) < min(k in 1..length where route[k] = first[j])(k));
% To make her trip more meaningful, Little Y decides to record the city's number each time she arrives at a new city (including the starting point). She knows that this will form a sequence of length 𝑛.

var int: score;
constraint score = sum(i in 1..n)(pow(n, n - i) * first[i]);

% Solve
solve minimize score;

% Output
output[show(first)];
