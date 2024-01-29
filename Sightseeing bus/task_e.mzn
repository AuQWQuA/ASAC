% NOIP2011-S D2T3
% input

int: n;
int: m;
int: k;
array[1..n-1] of int: D;
array[1..m] of int: T;
array[1..m] of int: A;
array[1..m] of int: B;

% description

array[1..n] of var int: arrive_time;
array[1..n] of var int: depart_time;
array[1..n-1] of var int: save_time;

constraint forall(i in 1..n)(arrive_time[i] >= 0);
constraint forall(i in 1..n)(depart_time[i] > 0);

constraint arrive_time[1] = 0;
constraint forall(i in 1..m)(depart_time[A[i]] >= T[i]);
% The bus must wait at each station until all passengers who need to depart from that attraction have boarded before departing for the next attraction.

constraint forall(i in 1..n-1)(arrive_time[i+1] - depart_time[i] > 0);
constraint forall(i in 1..n)(depart_time[i] - arrive_time[i] >= 0);

constraint forall(i in 1..n-1)(arrive_time[i+1] - depart_time[i] + save_time[i] >= D[i]);
% Using an accelerator can reduce Di by 1. The same Di can be repeatedly used with accelerators.
constraint forall(i in 1..n-1)(save_time[i] >= 0);
% However, it must be ensured that Di is greater than or equal to 0 after use.
constraint k >= sum(i in 1..n-1)(save_time[i]);
% So the smart driver ZZ installed k nitrogen accelerators on the bus.

var int: travel_time;
constraint travel_time = sum(i in 1..m)(arrive_time[B[i]] - T[i]);
% A passenger's travel time is equal to the moment he arrives at his destination minus the moment he arrives at the starting point.

%solve

solve minimize(travel_time);

%output

output[show(travel_time)];
