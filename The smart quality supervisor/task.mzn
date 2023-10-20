%NOIP2011-S D2T2
%input

int: n;
int: m;
int: S;
array[1..n,1..2] of int: ores;
array[1..m,1..2] of int: intervals;

%description

var int: Y;
var int: W;
constraint Y=sum(i in 1..m)
(sum(j in 1..n where ores[j,1]>=W /\ j>=intervals[i,1] /\ j<=intervals[i,2])(1)*sum(j in 1..n where ores[j,1]>=W /\ j>=intervals[i,1] /\ j<=intervals[i,2])(ores[j,2]));
%对于一个区间[Li，Ri]，计算矿石在这个区间上的检验值 Yi
%这批矿产的检验结果 Y 为各个区间的检验值之和

%solve

solve minimize (abs(S-Y));
%所以他想通过调整参数 W 的值，让检验结果尽可能的靠近标准值 S，即使得 S-Y 的绝对值最小

%output

output[show(abs(S-Y))];