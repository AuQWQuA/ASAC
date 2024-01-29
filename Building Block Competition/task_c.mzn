%NOIP2013-S D2T1
%input

int: n;
array[1..n] of int: h;
%大厦可以看成由n块宽度为1的积木组成，第𝑖块积木的最终高度需要是hi。
int: max_action=n*max(h);

%description

predicate build(array[1..n] of var int: before, array[1..n] of var int: after, var int: left, var int: right)
= forall(i in 1..left-1)(before[i]=after[i]) /\ forall(i in left..right)(before[i]+1=after[i]) /\ 
forall(i in right+1..n)(before[i]=after[i]);
%接下来每次操作，小朋友们可以选择一段连续区间[𝐿,𝑅]，然后将第𝐿块到第𝑅块之间（含第 L 块和第 R 块）所有积木的高度分别增加1

var 0..max_action: actions;
array[0..max_action,1..2] of var 1..n: left_right;
array[0..max_action,1..n] of var int: state;
constraint forall(i in 1..n)(state[0,i]=0);
%在搭建开始之前，没有任何积木（可以看成𝑛块高度为 0 的积木）
constraint forall(i in 1..actions)(build(state[i-1,1..n],state[i,1..n],left_right[i,1],left_right[i,2]));
constraint forall(i in 1..n)(state[actions,i]=h[i]);

%solve

solve minimize actions;
%使得建造所需的操作次数最少

%output

output[show(actions)];