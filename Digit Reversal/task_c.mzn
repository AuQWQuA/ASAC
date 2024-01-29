%NOIP2011-J T1
%input

int: n;

%description

array[1..10] of var int:digits;
predicate reverse_num(var int:num, array[1..10] of var int:digits, var int: i)=
if i>10 then true else
 (digits[i]=num mod 10) /\ reverse_num(num div 10,digits, i+1)
 endif;
%给定一个整数，请将该数各个位上数字反转得到一个新数。新

constraint reverse_num(abs(n),digits,1);

%solve

solve satisfy;

%output

output[ if n>0 then "" elseif n==0 then "0" else "-" endif];
%即除非给定的原数为零，否则反转后得到的新数的最高位数字不应为零
output[if( fix(sum([digits[j] | j in 1..i]))!=0 /\ fix(sum([digits[j] | j in i..10]))!=0) then show(digits[i]) else "" endif | i in 1..10];
