%NOIP2016-S D2T1
%input

int: T;
int: K;
array[1..T] of int: n;
array[1..T] of int: m;

%description

function var int: factorial(var int: x)=
if x==0 then 1 else
product([i | i in 1..x]) endif;

array[1..T] of var int: ans;

constraint forall(t in 1..T)(ans[t]=count(i in 1..n[t],j in 1..m[t] where j<=i)
(factorial(i) div ((factorial(j)*factorial(i-j))) mod K=0));
%小葱想知道如果给定 n,m 和 k，对于所有的 0<=i<=n,0<=j<=min(i, m)0≤i≤n,0≤j≤min(i,m) 有多少对(i,j) 满足 C(i,j)是k的倍数

%solve

solve satisfy;

%output

output[show(ans)];

