%NOIP2005-S T3
include "alldifferent.mzn";

%input

int: n;
array[1..n,1..2] of int: like;
%输入文件的第一行是一个整数 n(3 <= n <= 50000)，表示一共有 n 个同学。其后 n 行每行 包括两个不同的正整数，以一个空格隔开，分别表示编号是 1 的同学最希望相邻的两个同学 的编号，编号是 2 的同学最希望相邻的两个同学的编号，......，编号是 n 的同学最希望相邻 的两个同学的编号。

%description

array[1..n,1..n] of var 1..n: shift;
array[1..n] of var 1..n: M;

array[1..n,1..n] of var 1..n: position;

function var int: precede(int: i)=
if i>1 then i-1 else n endif;
function var int: follow(int: i)=
if i<n then i+1 else 1 endif;

predicate move(array[1..n] of var int: before,array[1..n] of var int: after,array[1..n] of var int: shift_list,var 1..n: m)=
forall(i in 1..m-1)(before[shift_list[i]]=after[shift_list[i+1]]) /\ before[shift_list[m]]=after[shift_list[1]] 
/\ forall(j in 1..n where forall(k in 1..m)(j!=shift_list[k]))(after[j]=before[j]);
%这个命令的作用是移动编号是b_1,b_2,…, b_m的这m个同学的位置。要求b_1换到b_2的位置上，b_2换到b_3的位置上，……，要求b_m换到b_1的位置上。

var 1..n: steps;
constraint forall(i in 1..steps)(alldifferent(shift[i,1..n]));
constraint forall(i in 1..n)(alldifferent(position[i,1..n]));
constraint forall(i in 1..n)(position[1,i]=i);
%一开始，同学们按照1,2,…,n1,2,…,n的顺序坐成一圈
constraint forall(i in 1..n)(position[steps,precede(i)]=like[position[steps,i],1] /\ 
position[steps,follow(i)]=like[position[steps,i],2] \/ 
position[steps,precede(i)]=like[position[steps,i],2] /\ 
position[steps,follow(i)]=like[position[steps,i],1]);
%而实际上每个人都有两个最希望相邻的同学。

constraint forall(i in 1..steps-1)(move(position[i,1..n],position[i+1,1..n],shift[i,1..n],M[i]));

var int: ans;
constraint ans=sum([M[i]| i in 1..steps-1]);
%行每个命令都需要一些代价。我们假定如果一个命令要移动mm个人的位置，那么这个命令的代价就是mm。

%solve

solve minimize ans;

%output

output[show(ans)];
%输出文件包括一行，这一行只包含一个整数，为最小的总代价。如果无论怎么调整都不能符 合每个同学的愿望，则输出-1。


