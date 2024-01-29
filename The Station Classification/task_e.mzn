% NOIP2013-J T4
%input

int: n;
int: m;
array[1..m] of int: s;
array[1..m] of set of int: pset;

%description

array[1..n] of var 1..n: level;
array[1..m] of var 1..n: split;
array[1..m] of var 1..n: start;
array[1..m] of var 1..n: end;
var set of 1..n: level_set;

set of int: all_station = 1..n;

constraint forall(i in 1..m)(
  forall(station in pset[i])(
    start[i] <= station /\ end[i] >= station
  )
);

constraint forall(i in 1..m)(
  forall(station in pset[i])(
    level[station] >= split[i]
  )
);

constraint forall(i in 1..m)(
  forall(station in (all_station diff pset[i]))(
    if (station >= start[i] /\ station <= end[i])
    then level[station] < split[i] endif
  )
);
% If this train stops at station x, then all levels greater than or equal to station x between the starting station and the ending station must be stopped.

constraint forall(l in level)(l in level_set);

%solve

solve minimize (card(level_set));

%output

output [show(card(level_set))];
