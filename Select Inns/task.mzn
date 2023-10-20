%NOIP2011-S D1T2
%input

int: n;
int: k;
int: p;
array[1..n,1..2] of int: hotel;

%description

array[1..n*n div 2,1..2] of var 1..n: plans;
var 1..n*n div 2: num;

constraint forall(i in 1..num)(plans[i,1]<plans[i,2] /\ hotel[plans[i,1],1]=hotel[plans[i,2],1]
/\ exists(t in plans[i,1]..plans[i,2])(hotel[t,2]<=p));
%分别住在色调相同的两家客栈
%晚上，他们打算选择一家咖啡店喝咖啡，要求咖啡店位于两人住的两家客栈之间（包括他们住的客栈），且咖啡店的最低消费不超过 p。

constraint forall(i,j in 1..num where i!=j)(not(plans[i,1]=plans[j,1] /\plans[i,2]=plans[j,2]));
%他们想知道总共有多少种选择住宿的方案，保证晚上可以找到一家最低消费不超过 p元的咖啡店小聚

%solve

solve maximize num;

%output

output[show(num)];