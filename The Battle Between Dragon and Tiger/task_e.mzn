% NOIP2018-J T2
% Input

int: n;
array[1..n] of int: num;
int: m;
int: p1;
int: s1;
int: s2;

% Description

var 1..n: p2;
var int: left;
var int: right;

constraint left = sum(i in 1..(m-1))(num[i] * (m - i)) + 
                      if p1 < m then s1 * (m - p1) else 0 endif + 
                      if p2 < m then s2 * (m - p2) else 0 endif;
constraint right = sum(i in (m+1)..n)(num[i] * (i - m)) + 
                      if p1 > m then s1 * (p1 - m) else 0 endif +
                      if p2 > m then s2 * (p2 - m) else 0 endif;
% They use the mth camp as a boundary, with engineers on the left belonging to the Dragon faction 
% and engineers on the right belonging to the Tiger faction. 
% Engineers in the mth camp are undecided and do not belong to either side.
% The morale of a camp is defined as: the number of engineers in that camp × the distance from that camp to the mth camp. 
% The power of a side participating in the game is defined as: the sum of morale of all camps belonging to that side.
% During the game, at some point, reinforcements suddenly appeared in camp p1, with s1 engineers in total.
% As a friend of Xuan Xuan and Kai Kai, you know that if the morale difference between the Dragon and Tiger factions becomes too large, 
% Xuan Xuan and Kai Kai will not want to continue playing. To keep the game going, 
% you need to choose a camp p2 and send all your s2 engineers to camp p2 in order to minimize the morale difference between the two sides.

% Solve

solve minimize abs(left - right);

% Output

output ["p2=" ++ show(p2)];
