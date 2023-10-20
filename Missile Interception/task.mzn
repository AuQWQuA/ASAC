%NOIP2010-J T3
%input

int: x1;
int: y1;
int: x2;
int: y2;
int: N;
array[1..N,1..2] of int: position;

var int: r1s;
var int: r2s;
constraint r1s>=0 /\ r2s>=0;
%只有两套系统投入工作。

constraint forall(i in 1..N)((pow(position[i,1]-x1,2)+pow(position[i,2]-y1,2)<=r1s) \/ (pow(position[i,1]-x2,2)+pow(position[i,2]-y2,2)<=r2s));
%现在的要求是拦截所有的导弹

%solve

solve minimize r1s+r2s;
%而当天的使用代价，就是所有系统工作半径的平方和。

%output

output[show(r1s+r2s)];