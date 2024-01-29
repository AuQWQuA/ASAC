% NOIP2011-J T1
% input

int: n;

% description

array[1..10] of var int: digits;

predicate reverse_num(var int: num, array[1..10] of var int: digits, var int: i) =
  if i > 10 then true 
  else
    (digits[i] = num mod 10) /\ reverse_num(num div 10, digits, i + 1)
  endif;

% Given an integer, reverse its digits to obtain a new number.

constraint reverse_num(abs(n), digits, 1);

%solve

solve satisfy;

% output

output[if n > 0 then "" elseif n == 0 then "0" else "-" endif];
% The highest digit of the new number should not be zero unless the given original number is zero.

output[if (fix(sum([digits[j] | j in 1..i])) != 0 /\ fix(sum([digits[j] | j in i..10])) != 0) then show(digits[i]) else "" endif | i in 1..10];
