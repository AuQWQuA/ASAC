%NOIP2009-S T2
%input

int: n;
array[1..n,1..4] of int: numbers;

%description

int: L=100;

predicate gcd(int: a, var int: b,var int: x)=
a mod x=0 /\ b mod x=0 /\
forall(i in 1..a)(not(a mod i=0 /\b mod i=0 /\ i>x));

predicate lcm(int: a, var int: b,var int: x)=
a*b mod x=0 /\ gcd(a,b,a*b div x);

array[1..n,1..L] of var int: ans;
array[1..n] of var 0..L: p;

constraint forall(i in 1..n)(forall(j in 1..p[i])
(gcd(numbers[i,1],ans[i,j],numbers[i,2]) /\ lcm(numbers[i,3],ans[i,j],numbers[i,4])  ));
%x 和 a0 的最大公约数是 a1；
%x 和 b0 的最小公倍数是 b1。

constraint forall(t in 1..n)(forall(i,j in 1..p[t] where i!=j)(ans[t,i]!=ans[t,j]));

%solve

solve maximize sum(p);

%output

output[show(p)];



