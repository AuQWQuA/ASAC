% NOIP2010-J T1
% Input

int: l;
int: r;

% Description

function var int: count_two(var int: x) =
    if x = 0 then 0 elseif (x mod 10 = 2) then (count_two(x div 10) + 1) else count_two(x div 10) endif;
% The number of times the digit 2 appears in all integers in a given range [L, R].

var int: answer;
constraint answer = sum([count_two(i) | i in l..r]);

% Solve

solve satisfy;

% Output

output [show(answer)];
