% NOIP2010-J T2
% input

int: n;
int: m;
array[1..n] of int: w;

% description

array[1..n] of var 1..m: choice;
array[1..n] of var int: start;

constraint forall(i in 1..m)(start[i] = 0 /\ choice[i] = i);
% When water collection starts, students from 1 to m each occupy a water tap and simultaneously open the water tap to collect water.

constraint forall(i in m+1..n)(
let{
array[1..m] of var 1..i-1: latest;
constraint forall(j in 1..m)(forall(k in 1..i-1 where choice[k] = j)(latest[j] >= k) 
/\ exists(k in 1..i-1 where choice[k] = j)(latest[j] = k));
} in forall(j in 1..m)
(start[i] = min([start[latest[l]] + w[latest[l]] | l in 1..m]) /\ 
% When one of the students j completes their water collection requirement wj, the next student k in the queue immediately takes over the position of student j to start collecting water.
start[latest[choice[i]]] + w[latest[choice[i]]] <= start[latest[j]] + w[latest[j]] )
);

%solve

solve satisfy;

%output

output[show(max([start[i] + w[i] | i in 1..n]))];
