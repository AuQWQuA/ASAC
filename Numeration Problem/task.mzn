%NOIP2013-J T1
%input

int: n;
int: x;

%description

function var int: appear_times(var int: num,var int: a)=
if num<10 then (num==a)
else appear_times(num div 10,a) + ((num mod 10)==a)
endif;
%数字 x（0 ≤ x ≤ 9）共出现了多少次

var int: ans;
constraint ans=sum(i in 1..n)(appear_times(i,x));

%solve

solve satisfy;

%output

output[show(ans)];
