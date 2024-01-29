%NOIP2018-S D1T1
%input

int: n;
array[1..n] of int: d;

%description

int: max_action=n*max(d);

predicate fill(array[1..n] of var int: before, array[1..n] of var int: after, var int: left, var int: right)
= forall(i in 1..left-1)(before[i]=after[i]) /\ forall(i in left..right)(before[i]-1=after[i]) /\ 
forall(i in right+1..n)(before[i]=after[i]);
%春春每天可以选择一段连续区间 [L, R]，填充这段区间中的每块区域，让其下陷深度减少 1。

var 0..max_action: actions;
array[0..max_action,1..2] of var 1..n: left_right;

array[0..max_action,1..n] of var int: state;
constraint forall(i in 1..n)(state[0,i]=d[i]);

constraint forall(i in 1..actions)(fill(state[i-1,1..n],state[i,1..n],left_right[i,1],left_right[i,2]));
constraint forall(i in 1..n)(state[actions,i]=0);
%可以在最短的时间内将整段道路的下陷深度都变为 0 。

%solve

solve minimize actions;

%output

output[show(actions)];