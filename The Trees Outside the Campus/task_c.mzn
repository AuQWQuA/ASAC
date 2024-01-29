% NOIP2005-J T2
% input

int: L;
int: M;
array[1..M, {1, 2}] of int: spot;
%由于马路上有一些区域要用来建地铁。这些区域用它们在数轴上的起始点和终止点表示。

%description

array[0..L] of var bool: index;
%我们可以把马路看成一个数轴，马路的一端在数轴 0 的位置，另一端在 L 的位置；数轴上的每个整数点，即 0，1，2，……，L，都种有一棵树。
var int: cnt;

cnt = sum([index[i] | i in 0..L]);
%你的任务是计算将这些树都移走后，马路上还有多少棵树。

constraint forall(i in 0..L)((index[i] = 0)\/(forall(j in 1..M)((i < spot[j, 1]) \/ (i > spot[j, 2]))));
%现在要把这些区域中的树（包括区域端点处的两棵树）移走。

%solve

solve maximize cnt;

%output

output[show(cnt)];
%输出文件包括一行，这一行只包含一个整数，表示马路上剩余的树的数目。