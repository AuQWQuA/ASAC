%NOIP2015-J T1
% input

int: n;

%description

var int: total;
function int: give(int: day, int: cur) = 
  if(day > cur) then give(day - cur, cur + 1) else cur endif;
%当连续 N 天每天收到 N 枚金币后，骑士会在之后的连续 N+1 天里，每天收到 N+1 枚金币

constraint 1 <= n /\ n <= 100000;
constraint total == sum(i in 1..n) (give(i, 1));
%请计算在前 K 天里，骑士一共获得了多少金币。

%solve

solve satisfy;

%output

output["\(total)"];