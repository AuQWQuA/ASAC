%NOIP2009-J T2  
%input

include "alldifferent.mzn";
int: n;
int: m;
array[1..n] of int :id;
array[1..n] of int :score;

%description

var 1..100: split;
var int: num=floor(m*1.5);
var int: actual;
array[1..n] of var 1..n: pass;

constraint count([score[i]>=split|i in 1..n])=actual;
%如果计划录取m名志愿者，则面试分数线为排名第m*150%（向下取整）名的选手的分数

constraint actual>=num;
constraint alldifferent(pass);
constraint forall(i in 1..actual)(score[pass[i]]>=split);
%最终进入面试的选手为笔试成绩不低于面试分数线的所有选手。

constraint forall(i in 1..actual-1)(score[pass[i]]>score[pass[i+1]] \/ (score[pass[i]]=score[pass[i+1]] /\ id[pass[i]]<id[pass[i+1]]));
%按照笔试成绩从高到低输出，如果成绩相同，则按报名号由小到大的顺序输出。

%solve

solve maximize split;

%output

output[show(split)++" "++show(actual)++"\n"];
output[show(id[pass[i]]) ++" "++ show(score[pass[i]])++"\n" | i in 1..fix(actual)];
