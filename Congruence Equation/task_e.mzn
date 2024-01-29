% NOIP2012-S D2T1
% input

int: a;
int: b;

% description

var int: x;
constraint x > 0;
constraint (a * x) mod b = 1;
% Solve the congruence equation ax ≡ 1 (mod b) for the smallest positive integer solution x.

%solve

solve minimize x;

% output

output[show(x)];
