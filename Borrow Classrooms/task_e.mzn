% NOIP2012-S D2T2
% input

int: n;
int: m;
array[1..n] of int: r;
array[1..m] of int: d;
array[1..m] of int: s;
array[1..m] of int: t;

% description

array[0..m,1..n] of var int: state;

constraint state[0,1..n] = r;
var 0..m: num;

constraint forall(i in 1..num)(forall(j in s[i]..t[i])(state[i,j] = state[i-1,j] - d[i]));
constraint forall(i in 1..num)(forall(j in 1..n where not(j >= s[i] /\ j <= t[i]))(state[i,j] = state[i-1,j]));
% Indicates that a renter needs to rent classrooms from day sj to day tj (including day sj and day tj), and they need to rent dj classrooms each day.
constraint forall(i in 1..num, j in 1..n)(state[i,j] >= 0);
% If during the allocation process, an order cannot be completely satisfied, it is necessary to stop the classroom allocation and notify the current applicant to modify the order.

% solve

solve maximize num;

% output

output[if fix(num) == m then "0" 
else "-1\n\(fix(num+1))" endif
];
