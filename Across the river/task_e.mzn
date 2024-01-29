% NOIP2005-S T2
% input

int: L;  
% Input the length of the single-plank bridge.

int: S;
int: T;
int: M;
array[1..M] of int: stones;
% Input three integers S, T, and M. S represents the minimum distance the frog can jump in one leap, T represents the maximum distance, and M represents the number of stones on the bridge. The values satisfy 1 <= S <= T <= 10, and 1 <= M <= 100. The third line contains M distinct positive integers representing the positions of these M stones on the number axis. It is guaranteed that there are no stones at the starting and ending points of the bridge. All adjacent integers are separated by a space.

% description

array[1..L] of var 0..L: steps;
var 1..L: step_num;
var int: ans;
set of int: stone_set = array2set(stones);

constraint steps[1] = 0;
% The point with coordinates 0 represents the starting point of the bridge, and the point with coordinates L represents the ending point of the bridge.
constraint steps[step_num] >= L;
% The frog starts from the starting point of the bridge and keeps jumping towards the ending point. The distance of one jump is any positive integer between SS and TT (including S, T).
constraint forall(i in 1..step_num-1)(steps[i+1] - steps[i] <= T /\ steps[i+1] - steps[i] >= S);

% Your task is to determine the minimum number of stones the frog needs to step on in order to cross the bridge.

constraint ans = card(stone_set intersect array2set(steps));

% solve

solve minimize ans;

% output

output[show(ans)];
% The output file contains only one integer, which represents the minimum number of stones the frog needs to step on to cross the bridge.
