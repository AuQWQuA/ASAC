% NOIP2012-J T1
% input

int: n;

% description

var 2..n-1: m;
constraint n mod m = 0;
% It is known that the positive integer n is the product of two different prime numbers.

%solve

solve maximize m;
% Attempt to find the larger of the two prime numbers.

% output

output[show(m)];
