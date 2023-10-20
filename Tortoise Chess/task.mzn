%NOIP2010-S T2
include "alldifferent.mzn";
%input

int: N;
int: M;
array[1..N] of int: score;
array[1..M] of int: cards;

%description

array[1..M] of var 1..M: order;
array[1..M+1] of var 1..N: stay;
var int: total_score;

constraint alldifferent(order);
%每张卡片只能使用一次
constraint stay[1]=1 /\ stay[M+1]=N;
%棋盘第 1 格是唯一的起点，第 N 格是终点，游戏要求玩家控制一个乌龟棋子从起点出发走到终点。
constraint forall(i in 1..M)(stay[i+1]=stay[i]+cards[order[i]]);
%玩家每次需要从所有的爬行卡片中选择一张之前没有使用过的爬行卡片，控制乌龟棋子前进相应的格子数
constraint total_score=sum([score[stay[i]] | i in 1..M+1]);
%玩家最终游戏得分就是乌龟棋子从起点到终点过程中到过的所有格子的分数总和

%solve

solve maximize total_score;

%output

output[show(total_score)];



