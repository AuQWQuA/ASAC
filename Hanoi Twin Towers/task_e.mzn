% NOIP2007-J T4
% input

int: n;

% Description

array[1..3, 1..2 * n] of var int: column;

int: infty = 1000;
int: max_steps = 100;

constraint forall(i in 1..n)(column[1, i * 2 - 1] = i /\ column[1, i * 2] = i);
% There are 2n disks with holes in the middle placed on pillar A. There are n different sizes of disks, each with two identical disks.
constraint forall(i in 1..2 * n)(column[2, i] = infty /\ column[3, i] = infty);

var 1..max_steps: steps;
array[0..max_steps, 1..3, 1..2 * n] of var int: state;
array[1..max_steps, 1..2] of var 1..3: action;

constraint forall(i in 1..steps)(action[i, 1] != action[i, 2]);
constraint forall(i in 1..steps, j in 1..3, k in 1..2 * n - 1)(state[i, j, k] <= state[i, j, k + 1]);
% Disks on pillars A, B, and C must be kept in ascending order (smaller on top).
constraint state[0, 1..3, 1..2 * n] = column;
constraint forall(i in 1..n)(state[steps, 3, i * 2 - 1] = i /\ state[steps, 3, i * 2] = i);
constraint forall(i in 1..2 * n)(state[steps, 1, i] = infty /\ state[steps, 2, i] = infty);

predicate move(var int: from, var int: to, array[1..3, 1..2 * n] of var int: before, array[1..3, 1..2 * n] of var int: after) =
  forall(i in 1..3 where i != from /\ i != to)(before[i, 1..2 * n] = after[i, 1..2 * n]) /\
  forall(i in 1..2 * n - 1)(after[from, i] = before[from, i + 1]) /\ after[from, 2 * n] = infty /\
  forall(i in 1..2 * n - 1)(after[to, i + 1] = before[to, i]) /\ after[to, 1] = before[from, 1];
% Only one disk can be moved at a time.

constraint forall(i in 1..steps)(move(action[i, 1], action[i, 2], state[i - 1, 1..3, 1..2 * n], state[i, 1..3, 1..2 * n]));

%solve

solve::int_search(array1d(action), input_order, indomain, complete)
  minimize steps;
% An is the minimum number of moves required to solve the Tower of Hanoi puzzle with 2n disks. For the given n, output An.

%output

output[show(steps)];
