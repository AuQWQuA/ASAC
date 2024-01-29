%NOIP2014-J T2
%input

int: A;
int: B;
int: L;

%description

predicate mutuality(var int: x,var int: y)=
let{
var int: m=min(x,y);
} in forall(i in 2..m)(not(x mod i==0/\y mod i==0));


var 1..L: A_s;
var 1..L: B_s;
%请你将 A 比 B 化简为 A’比 B’，要求在 A’和 B’均不大于 L
constraint A_s/B_s>=A/B;
%A’/B’ ≥ A/B

constraint mutuality(A_s,B_s);
%且A’和 B’互质的前提下

%solve

solve minimize A_s*B-A*B_s;
%且 A’/B’ - A/B 的值尽可能小。

%output

output["\(A_s) \(B_s)"];