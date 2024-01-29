%NOIP2006-S T1
%input

int: N;
array[1..N] of int: beads;
%输入文件的第一行是一个正整数 N(4≤N≤100)，表示项链上珠子的个数。第二行是 N 个用 空 格 隔 开 的 正 整 数 ， 所 有 的 数 均 不 超 过 1 0 0 0 。 第 i 个 数 为 第 i 颗 珠 子 的 头 标 记 ( 1 ≤ i ≤ N )， 当i<N时，第i颗珠子的尾标记应该等于第i+1颗珠子的头标记。第N颗珠子的尾标记应该 等于第 1 颗珠子的头标记。

%description

function var int: precede(var int: j, var int: len)=
if j>1 then j-1 else len endif;


function var int: follow(var int: j,var int: len)=
if j<len then j+1 else 1 endif;

array[1..N,1..N] of var int: steps;
array[1..N] of var 1..N: choose;
constraint forall(i in 2..N)(choose[i]<=N-i+1);
constraint steps[1,1..N]=beads;
constraint forall(i in 1..N-1)(forall(j in 1..choose[i]-1)(steps[i+1,j]=steps[i,j]));
constraint forall(i in 1..N-1)(forall(j in choose[i]+1..N-i+1)(steps[i+1,j-1]=steps[i,j]));
%需要时，Mars人就用吸盘夹住相邻的两颗珠子，通过聚合得到能量，直到项链上只剩下一颗珠子为止。

var int:ans;
constraint ans=sum([steps[i,choose[i]] * steps[i,precede(choose[i],N-i+1)] * steps[i,follow(choose[i],N-i+1)] | i in 1..N-1]);
%如果前一颗能量珠的头标记为m，尾标记为r，后一颗能量珠的头标记为r，尾标记为n，则聚合后释放的能量为 （Mars单位），新产生的珠子的头标记为m，尾标记为n。

%solve

solve maximize ans;
%请你设计一个聚合顺序，使一串项链释放出的总能量最大。

%output

output[show(ans)];
%输出文件只有一行，是一个正整数 E(E≤2.1*109)，为一个最优聚合顺序所释放的总能量。