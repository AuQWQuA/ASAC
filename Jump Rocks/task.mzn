% NOIP2015-S D2T1
%input

int:L;
int:N;
int:M;
array[1..N] of int:D;

%description

array[1..N] of var bool: moved;

var int: predist=min(i in 1..N-1 where moved[i]==false,j in i+1..N where moved[j]==false)(abs(D[i]-D[j]));
var int: predist2=min(i in 1..N where moved[i]==false)(min(D[i],L-D[i]));
var int: mindist=min(predist,predist2);

constraint sum(moved)<=M;
%由于预算限制，组委会至多从起点和终点之间移走 M 块岩石

%solve

solve maximize mindist;
%，使得选手们在比赛过程中的最短跳跃距离尽可能长。

%output

output["mindist=\(mindist)"]