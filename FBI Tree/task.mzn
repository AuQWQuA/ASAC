%NOIP2004-J T3
%input

int: N;
array[1..pow(2,N)] of 0..1: number;
%输入文件的第一行是一个整数 N(0 <= N <= 10)，第二行是一个长度为 2N 的“01”串。

%description

int: node_num=pow(2,N+1)-1;
array[1..node_num] of var int: tree;

predicate build_tree(int: left,int: right, var int: idx) =
if left==right then 
(if number[left]==1 then tree[idx]=0
else tree[idx]=1 endif)
else
((if count(i in left..right)(number[i]==0)==0 then tree[idx]=0 
elseif count(i in left..right)(number[i]==1)==0 then tree[idx]=1
else tree[idx]=2 endif) 
/\ build_tree(left,(left+right-1) div 2,idx+1) 
/\ build_tree((left+right-1) div 2 + 1, right ,idx+right-left+1)) endif;
%若串S的长度大于1，将串S从中间分开，分为等长的左右子串S1和S2；由左子串S1构造R的左子树T1，由右子串S2构造R的右子树T2。

array[1..node_num] of var int: last;
predicate last_order(int: left,int: right,int: last_left,int: last_right) =
if left==right then last[last_left]=tree[left]
else
(last[last_right]=tree[left]
/\ last_order(left+1,(right+left) div 2,last_left,(last_left+last_right) div 2-1)
/\ last_order((right+left) div 2 + 1,right,(last_left+last_right) div 2,last_right-1)) endif;
%并输出它的后序遍历序列。

constraint build_tree(1,pow(2,N),1);
constraint last_order(1,node_num,1,node_num);

%solve

solve satisfy;

%output

output[if fix(last[i])==0 then "I" elseif fix(last[i])==1 then "B" else "F" endif | i in 1..node_num];
%我们可以把由“0”和“1”组成的字符串分为三类：全“0”串称为B串，全“1”串称为I串，既含“0”又含“1”的串则称为F串。
