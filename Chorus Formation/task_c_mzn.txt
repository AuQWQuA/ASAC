%NOIP2004-S T3
%input

int: N;
array[1..N] of int: T;
%输入文件的第一行是一个整数 N(2<=N<=100)，表示同学的总数。第一行有 n 个整数，用空 格分隔，第 i 个整数 Ti(130<=Ti<=230)是第 i 位同学的身高(厘米)。


%description

array[1..N] of var bool: Select;
var int:discard_num=sum(Select);
%音乐老师要请其中的(N-K)位同学出列，使得剩下的 K 位同学排成合唱 队形。

constraint exists(i in 1..N where Select[i]==false)(forall (j in 1..N, k in 1..N)((j>=k)\/Select[j]\/Select[k]\/(((k>i)\/(T[j]<T[k]))/\((j<i)\/(T[j]>T[k])))));
%唱队形是指这样的一种队形：设K位同学从左到右依次编号为1，2…，K，他们的身高分别为T1，T2，…，TK，  则他们的身高满足T1<...<Ti>Ti+1>…>TK(1<=i<=K)。

%solve

solve minimize discard_num;

%output

output ["\(discard_num)"];
%输出文件包括一行，这一行只包含一个整数，就是最少需要几位同学出列。