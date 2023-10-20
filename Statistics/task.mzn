%NOIP2010-J T1
%input

int:l;
int:r;

%description

function var int: count_two(var int:x)=
if x = 0 then 0 elseif (x mod 10=2) then (count_two(x div 10)+1) else count_two(x div 10) endif;
%某个给定范围[L, R]的所有整数中，数字 2 出现的次数

var int:answer;
constraint answer=sum([count_two(i) | i in l..r]);

%solve

solve satisfy;

%output

output[show(answer)];