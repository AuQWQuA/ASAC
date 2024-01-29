%input

1..10000: L;
1..10000: R;

%description

function var int: count_number(var int: x) = 
if x == 0 then 0 else if x mod 10 == 2 then (1 + count_number(x div 10)) else count_number(x div 10) endif endif;

var int: number_2 = sum(digit in L..R)(count_number(digit));

%solve
solve satisfy;
%output
output [show(number_2)];