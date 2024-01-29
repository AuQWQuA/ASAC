%NOIP2012-S D2T1
%input

int: a;
int: b;

%description

var int: x;
constraint x>0;
constraint (a*x) mod b=1;
%求关于 x 的同余方程 ax ≡ 1 (mod b)的最小正整数解。

%solve

solve minimize x;

%output

output[show(x)];
