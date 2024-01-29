%NOIP2012-J T1
%input

int: n;

%description

var 2..n-1: m;
constraint n mod m = 0;
%已知正整数 n 是两个不同的质数的乘积

%solve

solve maximize m;
%试求出较大的那个质数。

%output

output[show(m)];