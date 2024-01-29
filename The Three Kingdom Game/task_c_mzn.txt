%NOIP2010-J T4
%input

int :N;
array[1..N,1..N] of int:value;

%description

array[1..N div 2] of var 1..N: my_tactic;
array[1..N div 2] of var 1..N: oppo_tactic;
set of 1..N:full_set=1..N;

var int:oppo_value;
var int:my_value;


function var int: find_max(var set of int:my_set,var set of int:free_set)=
let{
var 1..N: my_pointer;
var 1..N: free_pointer;
constraint my_pointer in my_set /\ free_pointer in free_set;
constraint forall(j in my_set,k in free_set)(value[j,k]<=value[my_pointer,free_pointer]);
} in free_pointer;
%已知计算机一方选择武将的原则是尽量破坏对手下一步将形成的最强组合，它采取的具体策略如下：任何时刻，轮到计算机挑选时，它会尝试将对手军队中的每个武将与当前每个自由武将进行一一配对，找出所有配对中默契值最高的那对武将组合，并将该组合中的自由武将选入自己的军队。

function var int: find_value(var set of int: tactic)=
let{
var int:rtn;
constraint exists(i in tactic, j in tactic)(rtn=value[i,j]);
constraint forall(i in tactic,j in tactic)(rtn>=value[i,j]);
} 
in rtn;
%程序自动从双方军队中各挑出一对默契值最高的武将组合代表自己的军队进行二对二比武

constraint forall(i in 1..N div 2,j in 1..N div 2)(my_tactic[i]!=oppo_tactic[j]);
constraint forall(i in 1..N div 2)(
  oppo_tactic[i]=find_max(array2set(my_tactic[1..i]),full_set diff(array2set(my_tactic[1..i]) union array2set(oppo_tactic[1..i-1])))
);

constraint my_value=find_value(array2set(my_tactic));
constraint oppo_value=find_value(array2set(oppo_tactic));

%solve

solve::int_search(array1d(my_tactic),input_order, indomain, complete) 
maximize my_value;

var int:answer=if(my_value-oppo_value>0) then my_value else 0 endif;
%拥有更高默契值的一对武将组合获胜，表示两军交战，拥有获胜武将组合的一方获胜

%output

output[if fix(my_value-oppo_value)>0 then "1\n\(my_value)" else "0" endif++"\n"];
%小涵想知道，如果计算机在一局游戏中始终坚持上面这个策略，那么自己有没有可能必胜？如果有，在所有可能的胜利结局中，自己那对用于比武的武将组合的默契值最大是多少
