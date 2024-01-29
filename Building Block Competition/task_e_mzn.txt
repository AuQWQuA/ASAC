% NOIP2013-S D2T1
% input

int: n;
array[1..n] of int: h;
% The building can be seen as composed of n blocks, each with a width of 1. The final height of the ith block needs to be hi.
int: max_action = n * max(h);

% description

predicate build(array[1..n] of var int: before, array[1..n] of var int: after, var int: left, var int: right)
= forall(i in 1..left-1)(before[i] = after[i]) /\ forall(i in left..right)(before[i] + 1 = after[i]) /\ 
forall(i in right+1..n)(before[i] = after[i]);
% Next, in each operation, the children can choose a continuous interval [L, R], and then increase the height of all blocks between the Lth block and the Rth block (including the Lth and Rth blocks) by 1.

var 0..max_action: actions;
array[0..max_action,1..2] of var 1..n: left_right;
array[0..max_action,1..n] of var int: state;
constraint forall(i in 1..n)(state[0,i] = 0);
% Before starting the construction, there are no blocks (it can be seen as n blocks with a height of 0).
constraint forall(i in 1..actions)(build(state[i-1,1..n],state[i,1..n],left_right[i,1],left_right[i,2]));
constraint forall(i in 1..n)(state[actions,i] = h[i]);

% solve

solve minimize actions;
% Minimize the number of operations required for construction.

% output

output[show(actions)];
