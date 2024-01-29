%NOIP2011-S D2T2
%input

int: n;
int: m;
int: S;
array[1..n,1..2] of int: ores;
array[1..m,1..2] of int: intervals;

%description

var int: Y;
var int: W;
constraint Y=sum(i in 1..m)
(sum(j in 1..n where ores[j,1]>=W /\ j>=intervals[i,1] /\ j<=intervals[i,2])(1)*sum(j in 1..n where ores[j,1]>=W /\ j>=intervals[i,1] /\ j<=intervals[i,2])(ores[j,2]));
% Calculate the evaluation value Y for a range [Li, Ri] for the ores.
% The evaluation result Y for this batch of minerals is the sum of evaluation values for various intervals.

%solve

solve minimize (abs(S-Y));
% So he wants to adjust the value of parameter W to make the evaluation result as close as possible to the standard value S, minimizing the absolute difference S-Y.

%output

output[show(abs(S-Y))];
