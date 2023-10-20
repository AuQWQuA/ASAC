%NOIP2012-S D2T2
%input

int: n;
int: m;
array[1..n] of int: r;
array[1..m] of int: d;
array[1..m] of int: s;
array[1..m] of int: t;

%description

array[0..m,1..n] of var int: state;

constraint state[0,1..n]=r;
var 0..m: num;
constraint forall(i in 1..num)(forall(j in s[i]..t[i])(state[i,j]=state[i-1,j]-d[i]));
constraint forall(i in 1..num)(forall(j in 1..n where not(j >=s[i] /\ j<=t[i]))(state[i,j]=state[i-1,j]));
%表示某租借者需要从第sj天到第tj天租借教室（包括第sj天和第tj天），每天需要租借dj个教室。
constraint forall(i in 1..num,j in 1..n)(state[i,j]>=0);
%如果在分配的过程中遇到一份订单无法完全满足，则需要停止教室的分配，通知当前申请人修改订单。

%solve

solve maximize num;

%output

output[if fix(num)==m then "0" 
else "-1\n\(fix(num+1))" endif
];




