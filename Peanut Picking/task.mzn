%NOIP2004-J T2
%input

int:M;
int:N;
int:K;
array[1..M,1..N] of int: peanuts;
%输入文件的第一行包括三个整数，M, N 和 K，用空格隔开;表示花生田的大小为 M * N(1 <= M, N <= 20)，多多采花生的限定时间为 K(0 <= K <= 1000)个单位时间。
%接下来的 M 行，每行包括 N 个非负整数，也用空格隔开;第 i + 1 行的第 j 个整数 Pij(0 <= Pij <= 500) 表示花生田里植株(i, j)下花生的数目，0 表示该植株下没有花生。

%description

set of int: peanut_set=array_union([array2set(peanuts[i,1..N])| i in 1..M]) diff {0};
var set of peanut_set: pick_set;
enum action={up,down,left,right,pick,wait};

array[1..K] of var action: action_list;
array[0..K,1..2] of var int: position;
var int: num;

predicate move(var action:act,var int:before_x,var int:before_y, var int:after_x,var int:after_y)=
if act=up then before_x=after_x+1 /\ before_y=after_y 
elseif act=down then before_x=after_x-1 /\ before_y=after_y 
elseif act=left then before_x=after_x /\ before_y=after_y+1
elseif act=right then before_x=after_x /\ before_y=after_y-1
else before_x=after_x /\ before_y=after_y
endif;

constraint forall(i in 1..K-1)((position[i,1]>=1 /\ position[i,1]<=M)/\(position[i,2]>=1 /\ position[i,2]<=N));
constraint action_list[1]=down /\ action_list[K]=up;
%1)从路边跳到最靠近路边（即第一行）的某棵花生植株；
%4)从最靠近路边（即第一行）的某棵花生植株跳回路边。

constraint position[0,1]=0 /\ position[K,1]=0;
constraint forall(i in 1..K)(move(action_list[i],position[i-1,1],position[i-1,2],position[i,1],position[i,2]));
%2)从一棵植株跳到前后左右与之相邻的另一棵植株；

constraint forall(i in 1..K)(if peanuts[position[i,1],position[i,2]]=0 then action_list[i]!=pick endif);
constraint forall(i,j in 1..K where i<j /\ action_list[i]=pick /\ action_list[j]=pick)(peanuts[position[i,1],position[i,2]] > peanuts[position[j,1],position[j,2]]);
%3)采摘一棵植株下的花生；

constraint forall(i in 1..K where action_list[i]=pick)(peanuts[position[i,1],position[i,2]] in pick_set);
constraint if peanut_set!=pick_set then min(pick_set)>=max(peanut_set diff pick_set) endif;
%你先找出花生最多的植株，去采摘它的花生；然后再找出剩下的植株里花生最多的，去采摘它的花生

constraint num=sum([peanuts[position[i,1],position[i,2]] | i in 1..K where action_list[i]=pick ]);
%即在限定时间内，多多最多可以采到花生的个数。

%solve

solve maximize num;

%output

output[show(num)];
%输出文件包括一行，这一行只包含一个整数，即在限定时间内，多多最多可以采到花生的个数。