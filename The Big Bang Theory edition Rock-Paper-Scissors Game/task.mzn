%NOIP2014-S D1T1
%input

int: N;
int: NA;
int: NB;

array[1..NA] of int: loopA;
array[1..NB] of int: loopB;

%description

enum match={win,lose,draw};

array[1..5,1..5] of var match: table=[|draw,lose,win,win,lose|
win,draw,lose,win,lose|
lose,win,draw,lose,win|
lose,lose,win,draw,win|
win,win,lose,lose,draw|];
%这五种手势的胜负关系如表一所示，表中列出的是甲对乙的游戏结果。
%0 表示“剪刀”，1 表示“石头”，2 表示“布”，3 表示“蜥蜴人”， 4 表示“斯波克”。

array[0..N-1] of var int: A;
array[0..N-1] of var int: B;
var int: scoreA;
var int: scoreB;

constraint forall(i in 0..N-1)(A[i]=loopA[(i mod NA) +1] /\ B[i]=loopB[(i mod NB) +1]);
constraint scoreA=sum(i in 0..N-1)(if table[A[i]+1,B[i]+1]==win then 1 else 0 endif);
constraint scoreB=sum(i in 0..N-1)(if table[B[i]+1,A[i]+1]==win then 1 else 0 endif);
%已知小 A 和小 B 一共进行 N 次猜拳。每一次赢的人得 1 分，输的得 0 分；平局两人都得 0 分。

%solve

solve satisfy;

%output

output["\(scoreA) \(scoreB)"];



