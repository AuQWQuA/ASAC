%NOIP2006-S T3
%input

int: m;
int: n;
array[1..m*n] of int: order;
array[1..n,1..m] of int: machine;
array[1..n,1..m] of int: time;
%输入文件的第 1 行为两个正整数，用一个空格隔开:m n(其中 m(<20)表示机器数，n(<20) 表示工件数)
%第 2 行: m  ́ n 个用空格隔开的数，为给定的安排顺序。
%接下来的 2n 行，每行都是用空格隔开的 m 个正整数，每个数不超过 20。
%其中前 n 行依次表示每个工件的每个工序所使用的机器号，第 1 个数为第 1 个工序的机器号，第 2 个数为第 2 个工序机器号，等等。
%后 n 行依次表示每个工件的每个工序的加工时间。

%description

array[1..m*n] of var int: begin_time;
array[1..m*n] of var int: end_time;
array[1..m*n] of var int: process;

predicate no_overlap(var int: begin1,var int: end1,var int: begin2,var int: end2)=
begin1>=end2 \/ begin2>=end1;


constraint forall(i in 1..m*n)(process[i]=count(j in 1..i)(order[j]=order[i]));
%calculate each process
constraint forall(i in 1..m*n)(end_time[i]-begin_time[i]=time[order[i],process[i]]);
%end-begin=time

constraint forall(i in 1..m*n)(
let{
  var int: max_t=if process[i]==1 then 0
  else max([end_time[j] | j in 1..i-1 where order[j]==order[i]])
  endif;
} in
if forall(j in 1..i-1 where machine[order[j],process[j]]==machine[order[i],process[i]])
(no_overlap(begin_time[j],end_time[j],max_t,max_t+time[order[i],process[i]]))
 then begin_time[i]=max_t
else 
 begin_time[i]=min([end_time[j] | j in 1..i-1 where
 machine[order[j],process[j]]==machine[order[i],process[i]] /\ 
 end_time[j]>=max_t /\
 forall(k in 1..i-1 where machine[order[k],process[k]]==machine[order[i],process[i]])
 (no_overlap(end_time[j],end_time[j]+time[order[i],process[i]],begin_time[k],end_time[k]))
])
endif
);
%对同一个工件，每道工序必须在它前面的工序完成后才能开始；
%同一时刻每一台机器至多只能加工一个工件。

var int:ans;
constraint ans=max(i in 1..m*n)(end_time[i]);

%solve

solve satisfy;

%output

output[show(ans)];
%输出文件只有一个正整数，为最少的加工时间。