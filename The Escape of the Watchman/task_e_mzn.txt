% NOIP2007-J T3
% Input

int: M;
int: S;
int: T;

% Description

enum action = {run, flash, rest};
% Watchers can run, flash, or rest, and each activity lasts for a certain number of seconds (s).

var 1..T: min_time;
var int: max_dis;

array[1..T] of var action: action_list;
array[0..T] of var int: current_mana;
array[0..T] of var int: current_dis;

constraint current_dis[0] = 0;
constraint current_mana[0] = M;

constraint forall(i in 1..T)(current_mana[i] >= 0);
constraint forall(i in 1..T)(
    if action_list[i] = run then current_mana[i] = current_mana[i-1]
    elseif action_list[i] = flash then current_mana[i] = current_mana[i-1] - 10
    else current_mana[i] = current_mana[i-1] + 4
    endif
);
% Using flash spell consumes 10 mana points. Watcher's mana recovers at a rate of 4 points/s, 
% and it only recovers while resting.

constraint forall(i in 1..T)(
    if action_list[i] = run then current_dis[i] = current_dis[i-1] + 17
    elseif action_list[i] = flash then current_dis[i] = current_dis[i-1] + 60
    else current_dis[i] = current_dis[i-1]
    endif
);
% Watcher's running speed is 17m/s, which is not enough to escape the island. Fortunately, the watcher has a flash spell 
% that can move 60m in 1s.

constraint max_dis = current_dis[T];
var int: score;

constraint if max_dis >= S then current_dis[min_time] >= S /\ current_dis[min_time-1] < S else min_time = T endif;
constraint score = if max_dis >= S then 300000 - min_time else max_dis endif;
% Write a program to help the watcher calculate how to escape the island in the shortest time. If it cannot escape, 
% output the maximum distance the watcher can travel in the remaining time.

% Solve

solve::int_search(array1d(action_list), input_order, indomain, complete)
maximize score;

% Output

output[if fix(max_dis) >= S then "Yes\n\(min_time)" else "No\n\(max_dis)" endif];
% The first line is "Yes" or "No" (case-sensitive), indicating whether the watcher can escape the island.
% The second line contains an integer. If the first line is "Yes" (case-sensitive), it represents the minimum time 
% it takes for the watcher to escape the island. If the first line is "No" (case-sensitive), it represents 
% the maximum distance the watcher can travel.
