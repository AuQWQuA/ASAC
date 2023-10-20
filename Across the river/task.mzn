%NOIP2005-S T2
%input

int: L;
int: S;
int: T;
int: M;
array[1..M] of int: stones;
%输入文件的第一行有一个正整数 L(1 <= L <= 109)，表示独木桥的长度。第二行有三个正 整数 S，T，M，分别表示青蛙一次跳跃的最小距离，最大距离，及桥上石子的个数，其中 1 <= S <= T <= 10，1 <= M <= 100。第三行有M个不同的正整数分别表示这M个石子在数 轴上的位置(数据保证桥的起点和终点处没有石子)。所有相邻的整数之间用一个空格隔开。

%description

array[1..L] of var 0..L: steps;
var 1..L: step_num;
var int:ans;
set of int: stone_set=array2set(stones);

constraint steps[1]=0;
constraint steps[step_num]>=L;
constraint forall(i in step_num+1..L)(steps[i]=0);
%坐标为0的点表示桥的起点，坐标为L的点表示桥的终点。
constraint forall(i in 1..step_num-1)(steps[i+1]-steps[i]<=T /\ steps[i+1]-steps[i]>=S);
%青蛙从桥的起点开始，不停的向终点方向跳跃。一次跳跃的距离是 SS 到 TT 之间的任意正整数（包括 S,TS,T）
constraint ans=card(stone_set intersect array2set(steps));

%solve

solve minimize ans;
%你的任务是确定青蛙要想过河，最少需要踩到的石子数。

%output

output[show(ans)];
%输出文件只包括一个整数，表示青蛙过河最少需要踩到的石子数。
