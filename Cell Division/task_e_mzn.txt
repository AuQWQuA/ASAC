% NOIP2009-J T3
% input

int: N;
int: m1;
int: m2;
array[1..N] of int: S;

% description

int: max_T = 10000;
int: M = pow(m1, m2);
% M can always be expressed as m1 raised to the power of m2.
array[1..N] of var 1..max_T: time;
constraint forall(i in 1..N)(time[i] = arg_min(t in 1..max_T)(pow(S[i], t) mod M == 0));
% Dr. Hanks always stops cell cultivation and starts the experiment when the obtained cells "can be evenly distributed into M test tubes."
var int: ans = min(time);
% Now, Dr. Hanks wants to know which type of cell culture can minimize the start time of the experiment.

% solve

solve minimize ans;

% output

output[if fix(ans) == max_T then "-1" else show(fix(ans)) endif];
