% NOIP2016-S D1T2
% input

include "all_different.mzn";
int: n;
int: m;
array[1..n-1, 1..2] of int: road;
array[1..n] of int: watcher;
array[1..m, 1..2] of int: player;

% description

array[1..m, 1..n-1] of var 1..n-1: route;
array[1..m] of var 1..n-1: time;
array[1..m, 0..n-1] of var 1..n: location;

constraint forall(i in 1..m)(alldifferent(route[i, 1..n-1]));
constraint forall(i in 1..m)((road[route[i, 1], 1] = player[i, 1] \/
                            road[route[i, 1], 2] = player[i, 1]) /\
                            (road[route[i, time[i]], 1] = player[i, 2] \/
                            road[route[i, time[i]], 2] = player[i, 2]));
% Now, there are m players, and the starting point and ending point of the i-th player are s_i and t_i respectively.

constraint forall(i in 1..m)(forall(j in 1..time[i]-1)
                            (road[route[i, j], 2] = road[route[i, j+1], 1] \/
                            road[route[i, j], 1] = road[route[i, j+1], 1] \/
                            road[route[i, j], 1] = road[route[i, j+1], 2] \/
                            road[route[i, j], 2] = road[route[i, j+1], 2]));

constraint forall(i in 1..m)(forall(j in 1..time[i])(
                            (road[route[i, j], 1] = location[i, j-1] /\
                            road[route[i, j], 2] = location[i, j]) \/ 
                            (road[route[i, j], 2] = location[i, j-1] /\
                            road[route[i, j], 1] = location[i, j])));

array[1..n] of var 0..m: watch_num;
constraint forall(i in 1..n)(watch_num[i] = sum(j in 1..m 
                            where 
                            if time[j] >= watcher[i] then location[j, watcher[i]] = i 
                            else false endif)(1));
% The observer at node j will choose to observe the player at the w_j second. A player can be observed by this observer if and only if the player arrives at node j at the w_j second.

%solve

solve minimize sum(time);

%output

output[show(watch_num)];
