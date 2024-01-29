% NOIP2015-S D1T2
% input

int: N;
array[1..N] of int: T;

% description

var 1..N: turns;
var 1..N: x;
array[0..N] of var int: y;
constraint y[0] = x /\ y[turns] = x;
% The game ends when someone hears their own birthday from someone else's mouth.
constraint forall(i in 1..turns)(y[i] = T[y[i - 1]]);
% In each subsequent round, everyone simultaneously tells their current knowledge of birthdays to their respective information carriers.

% solve

solve minimize turns;

% output

output["turns=" ++ show(turns)];
