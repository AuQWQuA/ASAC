%NOIP2013-S D2T2
%input

int: n;
array[1..n] of int: h;
% Dongdong's flowers' heights can be represented as an array of integers h1, h2, … , hn.

%description

var 1..n: m;
array[1..n] of var int: g;
% The heights of the remaining flowers are g1, g2, … , gm
array[1..n] of var 1..n: chosen;
constraint forall(i in 1..m-1)(chosen[i] < chosen[i+1]);
constraint forall(i in 1..m)(g[i] = h[chosen[i]]);

% We hope that at least one of the following two conditions is satisfied
constraint forall(i in 1..m where i mod 2 == 0)(if i-1 > 0 then g[i] > g[i-1] else true endif 
/\ if i+1 <= m then g[i] > g[i+1] else true endif) \/ 
% Condition A: For all i, g_2i > g_2i−1, and g_2i > g_2i+1;
forall(i in 1..m where i mod 2 == 0)(if i-1 > 0 then g[i] < g[i-1] else true endif 
/\ if i+1 <= m then g[i] < g[i+1] else true endif);
% Condition B: For all i, g_2i < g_2i−1, and g_2i < g_2i+1;

%solve

solve maximize m;
% Find the maximum number of flowers Dongdong can leave in place.

%output

output[show(m)];
