%NOIP2004-J T4
%input

include "alldifferent.mzn";
int: N;
int: M;
array[1..N] of 1..N: init_finger;
%输入文件包括三行，第一行有一个正整数 N，表示火星人手指的数目(1 <= N <= 10000)。 第二行是一个正整数 M，表示要加上去的小整数(1 <= M <= 100)。下一行是 1 到 N 这 N 个整数的一个排列

%description

int: max_size=product([i | i in 1..N]);
array[1..max_size,1..N] of var 1..N: fingers;

var int:ans;

predicate larger(array[1..N] of var 1..N: l,array[1..N] of var 1..N: r,var int:pointer)=
if pointer=N+1 then false
else l[pointer]>r[pointer] \/ (l[pointer]=r[pointer] /\ larger(l,r,pointer+1)) endif;

constraint forall(i in 1..max_size)(alldifferent(fingers[i,1..N]));
%这些手指排成一列，分别编号为1，2，3……

constraint forall(i in 1..max_size-1)(larger(fingers[i+1,1..N],fingers[i,1..N],1));
constraint let{
var int:i;
constraint forall(j in 1..N)(init_finger[j]=fingers[i,j]);
} in ans=i+M;
%把火星人用手指表示的数与科学家告诉你的数相加，并根据相加的结果改变火星人手指的排列顺序。

%solve

solve satisfy;

%output

output[show(fingers[fix(ans),1..N])];
%输出文件只有一行，这一行含有N个整数，表示改变后的火星人手指的排列顺序。每两个相邻的数中间用一个空格分开，不能有多余的空格。