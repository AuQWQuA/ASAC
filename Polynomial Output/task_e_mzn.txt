% NOIP2009-J T1
% input

int: n;
array[1..n+1] of int: coefficient;

% description

output[if(coefficient[i] < 0) then "-" else (if(coefficient[i] == 0 \/ i == 1) then "" else "+" endif) endif
% If the coefficient of the nth term in the polynomial is negative, the polynomial starts with a "-" sign. If the coefficient of the nth term is positive, there is no leading "+" sign. If the term is the constant term (n==1), there is no leading sign.
 ++ if(abs(coefficient[i]) == 1 \/ coefficient[i] == 0 ) then "" else show(abs(coefficient[i])) endif 
% For terms other than the highest degree term, connect this term to the previous term with a "+" or "-" sign, depending on whether the coefficient is positive or negative.
 ++ if(coefficient[i] == 0) then "" else ("x" ++ if(n-i+1 == 1) then "" else "^" ++ show(n-i+1) endif) endif
% Followed by a positive integer to represent the absolute value of the coefficient (if a term with a degree greater than 0 has an absolute coefficient of 1, there is no need to output "1").
|i in 1..n];

%solve

solve satisfy;

% output

output[if(coefficient[n+1] == 0) then "" else (if(coefficient[n+1] > 0) then "+" else "-" endif) ++ show(abs(coefficient[n+1])) endif];
% If the exponent of x is 0, only the coefficient needs to be output.
