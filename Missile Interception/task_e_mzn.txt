% NOIP2010-J T3
%input

int: x1;
int: y1;
int: x2;
int: y2;
int: N;
array[1..N, 1..2] of int: position;

var int: r1s;
var int: r2s;
constraint r1s >= 0 /\ r2s >= 0;
% Only two systems are operational.

constraint forall(i in 1..N)((pow(position[i, 1]-x1, 2)+pow(position[i, 2]-y1, 2) <= r1s) \/ (pow(position[i, 1]-x2, 2)+pow(position[i, 2]-y2, 2) <= r2s));
% The current requirement is to intercept all missiles.

%solve

solve minimize r1s+r2s;
% The cost of usage for the day is the sum of the squares of the working radii of all systems.

%output

output[show(r1s+r2s)];
