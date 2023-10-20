%NOIP2008-J T3
%input

int: n;
int: m;

%description

int: bound=pow(2,m);
array[1..bound,1..m+1] of var 1..n: balls;
var int: num;
constraint num>=0 /\ num<bound;

predicate neighbor(var int:a ,var int:b)=
abs(a-b)=1 \/ (a=n /\ b=1) \/ (a=1 /\ b=n);
%每个同学可以把球传给自己左右的两个同学中的一个（左右任意）

constraint forall(i in 1..num)
( balls[i,1]=1 /\ balls[i,m+1]=1 /\ forall(j in 1..m)( neighbor(balls[i,j] ,balls[i,j+1]) ) );
%从小蛮手里开始传的球，传了m次以后，又回到小蛮手里
constraint forall(j,k in 1..num where j<k)( exists(l in 1..m+1)(balls[j,l]!=balls[k,l]) );
%两种传球的方法被视作不同的方法，当且仅当这两种方法中，接到球的同学按接球顺序组成的序列是不同的

%solve

solve maximize num;

%output

output[show(num)++"\n"];
%输出文件ball.out共一行，有一个整数，表示符合题意的方法数。