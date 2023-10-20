%NOIP2008-S T1
%input

string: str;

%description

int: n=string_length(str);
array[1..n] of var 1..n: times=[ sum(j in 1..n where str[j]=str[i])(1) | i in 1..n];
var int: maxn=max(times);
var int: minn=min(times);

function var bool: prime(int: num)=
if num=0 \/ num=1 then false 
else
forall(i in 2..num-1)(num mod i!=0)
endif;

%solve

solve satisfy;
var bool: ans=prime(fix(maxn)-fix(minn));
var string: out=if fix(ans) then "Lucky Word\n" ++ show(fix(maxn)-fix(minn)) else "No Answer\n0" endif;
%output

output[fix(out)];

