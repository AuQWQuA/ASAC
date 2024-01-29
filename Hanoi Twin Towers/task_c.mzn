%NOIP2007-J T4
%input

int: n;

%description

array[1..3,1..2*n] of var int: column;

int: infty=1000;
int: max_steps=100;

constraint forall(i in 1..n)(column[1,i*2-1]=i /\ column[1,i*2]=i);
%在A柱上放有2n个中间有孔的圆盘，共有n个不同的尺寸，每个尺寸都有两个相同的圆盘
constraint forall(i in 1..2*n)(column[2,i]=infty /\ column[3,i]=infty);


var 1..max_steps: steps;
array[0..max_steps,1..3,1..2*n] of var int: state;
array[1..max_steps,1..2] of var 1..3: action;

constraint forall(i in 1..steps)(action[i,1]!=action[i,2]);
constraint forall(i in 1..steps, j in 1..3,k in 1..2*n-1)(state[i,j,k]<=state[i,j,k+1]);
%A、B、C三根细柱上的圆盘都要保持上小下大的顺序
constraint state[0,1..3,1..2*n]=column;
constraint forall(i in 1..n)(state[steps,3,i*2-1]=i /\ state[steps,3,i*2]=i);
constraint forall(i in 1..2*n)(state[steps,1,i]=infty /\ state[steps,2,i]=infty);

predicate move(var int: from, var int: to, array[1..3,1..2*n] of var int: before,array[1..3,1..2*n] of var int: after) =
forall(i in 1..3 where i!=from /\ i!=to)(before[i,1..2*n]=after[i,1..2*n])
/\ forall(i in 1..2*n-1)(after[from,i]=before[from,i+1]) /\ after[from,2*n]=infty
/\ forall(i in 1..2*n-1)(after[to,i+1]=before[to,i]) /\ after[to,1]=before[from,1];
%每次只能移动一个圆盘

constraint forall(i in 1..steps)(move(action[i,1],action[i,2],state[i-1,1..3,1..2*n],state[i,1..3,1..2*n]));

%solve

solve::int_search(array1d(action),input_order, indomain, complete)
minimize steps;
%An为2n个圆盘完成上述任务所需的最少移动次数，对于输入的n，输出An

%output

output[show(steps)];



