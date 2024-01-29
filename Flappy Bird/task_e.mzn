%NOIP2014-S D1T3
%input

int: n;
int: m;
int: k;
array[1..n] of int: X;
array[1..n] of int: Y;
array[1..k,1..3] of int: tube;

%description

array[0..n] of var 1..m: bird;
array[1..n] of var int: tap;
array[0..n-1] of var int: d;

function var int: move(var int: x,var int: y,var int: t)=
if t == 0 then -1 * y
else x * t endif;
% If the screen is tapped, the bird will ascend by height X, and you can tap multiple times in one unit of time, and the effects will stack; if the screen is not tapped, the bird will descend by height Y.

constraint forall(i in 0..n-1)(d[i] = move(X[i+1], Y[i+1], tap[i+1]));
constraint forall(i in 1..n)(tap[i] >= 0);
constraint forall(i in 0..n-1)(bird[i+1] = if bird[i] + d[i] >= m then m else bird[i] + d[i] endif);
% The bird cannot ascend when its height is m.

var 0..k: pass_tube;
array[1..k,1..3] of var int: sorted_tube;
constraint forall(i in 1..k)(exists(j in 1..k)(sorted_tube[i,1..3] = tube[j,1..3]));
constraint forall(i in 1..k-1)(sorted_tube[i+1,1] > sorted_tube[i,1]);
constraint forall(i in 1..pass_tube)(bird[sorted_tube[i,1]] > sorted_tube[i,2] /\ bird[sorted_tube[i,1]] < sorted_tube[i,3]);

var int: score = sum(tap) - pass_tube * m;
% Now, determine if the game can be completed. If yes, output the minimum number of screen taps; otherwise, output the maximum number of gaps the bird can pass through.

%solve

solve minimize score;

%output

output[if fix(pass_tube) == k then "1\n" ++ "\(fix(sum(tap)))" else "0\n" ++ "\(fix(pass_tube))" endif];
