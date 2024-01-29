% NOIP2018-S D1T1
% input

int: n;
array[1..n] of int: d;

% description

int: max_action = n * max(d);

predicate fill(array[1..n] of var int: before, array[1..n] of var int: after, var int: left, var int: right)
= forall(i in 1..left-1)(before[i] = after[i]) /\ forall(i in left..right)(before[i] - 1 = after[i]) /\
forall(i in right+1..n)(before[i] = after[i]);
% ChunChun can choose a continuous interval [L, R] every day, and fill each block in this interval to reduce its sinking depth by 1.

var 0..max_action: actions;
array[0..max_action, 1..2] of var 1..n: left_right;

array[0..max_action, 1..n] of var int: state;
constraint forall(i in 1..n)(state[0, i] = d[i]);

constraint forall(i in 1..actions)(fill(state[i-1, 1..n], state[i, 1..n], left_right[i, 1], left_right[i, 2]));
constraint forall(i in 1..n)(state[actions, i] = 0);
% The goal is to reduce the sinking depth of the entire road to 0 in the shortest possible time.

%solve

solve minimize actions;

%output

output[show(actions)];
