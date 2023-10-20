%NOIP2010-J T2
%input

int: n;
int: m;
array[1..n] of int: w;

%description

array[1..n] of var 1..m:choice;
array[1..n] of var int:start;

constraint forall(i in 1..m)(start[i]=0 /\ choice[i]=i);
%接水开始时，1 到 m 号同学各占一个水龙头，并同时打开水龙头接水。

constraint forall(i in m+1..n)(
let{
array[1..m] of var 1..i-1:latest;
constraint forall(j in 1..m)(forall(k in 1..i-1 where choice[k]=j)(latest[j] >= k) 
/\ exists(k in 1..i-1 where choice[k]=j)(latest[j]=k));
} in forall(j in 1..m)
(start[i]=min([start[latest[l]] + w[latest[l]] | l in 1..m]) /\ 
%当其中某名同学 j 完成其接水量要求 wj 后，下一名排队等候接水的同学 k马上接替 j 同学的位置开始接水。
start[latest[choice[i]]]+w[latest[choice[i]]]<=start[latest[j]] + w[latest[j]] )
);

%solve

solve satisfy;

%output

output[show(max([start[i]+w[i] | i in 1..n]))];