% NOIP2011-S D2T1
% input

int: a;
int: b;
int: k;
int: n;
int: m;

% description

var int: coefficient;

function var int: combinatorial(var int: n, var int: k) =
  factorial(n) div (factorial(k) * factorial(n - k));

function var int: factorial(var int: num) =
  if num == 0 then 1
  else factorial(num - 1) * num
  endif;

constraint coefficient = (combinatorial(k, n) * pow(a, n) * pow(b, m)) mod 10007;
% Calculate the coefficient of the term in the polynomial expansion with n and m as exponents.

% solve

solve satisfy;

% output

output[show(coefficient)];
