%NOIP2008-S T4
%input

int: n;
array[1..n] of int: numbers;

%description

array[1..2*n+1,1..n] of var int: stack1;
array[1..2*n+1,1..n] of var int: stack2;

enum op={a,b,c,d};

array[1..2*n] of var op: action;

predicate push(array[1..n] of var int:before, array[1..n] of var int: after, var int: element)=
after[1]=element /\ forall(i in 1..n-1)(after[i+1]=before[i]);

predicate pop(array[1..n] of var int:before, array[1..n] of var int: after, var int: element)=
forall(i in 2..n)(after[i-1]=before[i]) /\ element=before[1] /\ after[n]=0;

array[1..n] of var int: out;

constraint forall(i in 1..n)(stack1[1,i]=0 /\ stack1[2*n+1,i]=0 /\ stack2[1,i]=0 /\ stack2[2*n+1,i]=0);
%初始和结束栈都是空的
constraint forall(i in 1..2*n)(
let{
var int: t;
var int: u;
constraint t=count(j in 1..i-1)(action[j]=a \/ action[j]=c);
constraint u=count(j in 1..i-1)(action[j]=b \/ action[j]=d);
} in if action[i]=a then push(stack1[i,1..n],stack1[i+1,1..n],numbers[t+1]) /\ stack2[i,1..n]=stack2[i+1,1..n]
%操作a 如果输入序列不为空，将第一个元素压入栈S1
elseif action[i]=c then push(stack2[i,1..n],stack2[i+1,1..n],numbers[t+1]) /\ stack1[i,1..n]=stack1[i+1,1..n]
%操作c 如果输入序列不为空，将第一个元素压入栈S2
elseif action[i]=b then pop(stack1[i,1..n],stack1[i+1,1..n],out[u+1]) /\ stack2[i,1..n]=stack2[i+1,1..n]
%操作b 如果栈S1不为空，将S1栈顶元素弹出至输出序列
else pop(stack2[i,1..n],stack2[i+1,1..n],out[u+1]) /\ stack1[i,1..n]=stack1[i+1,1..n] 
%操作d 如果栈S2不为空，将S2栈顶元素弹出至输出序列
endif);

constraint forall(i in 1..n)(out[i]=i);

%solve

solve satisfy;

%output

output[show(action)];









