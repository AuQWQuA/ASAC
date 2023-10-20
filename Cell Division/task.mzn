% NOIP2009-J T3
%input

int: N;
int: m1;
int: m2;
array[1..N] of int: S;

%description

int: max_T=10000;
int: M=pow(m1,m2);
%M 总可以表示为 m1的 m2 次方
array[1..N] of var 1..max_T: time;
constraint forall(i in 1..N)(time[i]=arg_min(t in 1..max_T)(pow(S[i],t) mod M==0));
%Hanks 博士在选定一种细胞开始培养后，总是在得到的细胞“刚好可以平均分入 M 个试管”时停止细胞培养并开始实验。
var int: ans=min(time);
%现在博士希望知道，选择哪种细胞培养，可以使得实验的开始时间最早。

%solve

solve minimize ans;

%output

output[if fix(ans)==max_T then "-1" else show(fix(ans)) endif];