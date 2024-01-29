% NOIP2014-S D2T1
% Input

int: d;
int: n;
array[1..n, 1..2] of int: public_loc;
array[1..n] of int: public_num;

% Description

int: max_plans = 100;

predicate cover_spot(array[1..2] of var int: loc, array[1..2] of var int: center) =
    max(i in 1..2)(abs(loc[i] - center[i])) <= d;
% The coverage range of the wireless transmitter is a square with side length 2*d centered at that point. The coverage 
% range includes the boundaries of the square.

array[1..max_plans, 1..2] of var 0..128: ans;
% Assume that the city layout is formed by a grid of 129 east-west streets and 129 north-south streets that are strictly 
% parallel, and the distance between adjacent parallel streets is a constant value of 1. The east-west streets are numbered 
% from north to south as 0,1,2...128, and the north-south streets are numbered from west to east as 0,1,2...128.
var 1..max_plans: plans;
constraint forall(i, j in 1..plans where i != j)(not(ans[i, 1] == ans[j, 1] /\ ans[i, 2] == ans[j, 2]));
var int: num;
constraint num > 0;
constraint forall(t in 1..plans)(num = sum(i in 1..n where cover_spot(public_loc[i, 1..2], ans[t, 1..2]))(public_num[i]));

var int: score;
constraint score = max_plans * num + plans;

% Solve

solve maximize score;
% They hope you can help them find suitable installation locations in the city to maximize the coverage of public places.

% Output

output["\(plans) \(num)"];
