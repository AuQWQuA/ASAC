% NOIP2015-J T1
% input

int: n;

%description

var int: total;
function int: give(int: day, int: cur) = 
  if(day > cur) then give(day - cur, cur + 1) else cur endif;
% When receiving N coins each day for N consecutive days, the knight will receive N+1 coins each day for the following N+1 consecutive days.

constraint 1 <= n /\ n <= 100000;
constraint total == sum(i in 1..n) (give(i, 1));
% Calculate how many coins the knight has received in the first K days.

%solve

solve satisfy;

%output

output["\(total)"];
