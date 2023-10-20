% NOIP2015-S D1T2
% input

int: N;
array [1 .. N] of int: T;

% description

var 1 .. N: turns;
var 1 .. N: x;
array [0 .. N] of var int: y;
constraint y[0] = x /\ y[turns] = x;
%当有人从别人口中得知自己的生日时，游戏结束。
constraint forall(i in 1 .. turns)(y[i] = T[y[i - 1]]);
%之后每一轮中，所有人会同时将自己当前所知的生日信息告诉各自的信息传递对象

% solve

solve minimize turns;

% output

output["turns=" ++ show(turns)];