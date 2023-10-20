%NOIP2011-J T4
%input

include "all_different.mzn";
int: n;
array[1..n] of string: expr_str;

%description

array[1..4] of string: symbol_type=["+","*","(",")"];
array[1..n] of int: expr_int=
[if expr_str[i]=="+" then 1 elseif expr_str[i]=="*" then 2 elseif expr_str[i]=="(" then 3 else 4 endif | i in 1..n];

int: symbol_count=count(i in 1..n)(expr_int[i]==1 \/ expr_int[i]==2);
int: num_count=symbol_count + 1;
int: max_plans=pow(2,num_count);
array[1..max_plans,1..num_count] of var 0..1: number;
var 0..max_plans: plan_num;

constraint forall(i,j in 1..plan_num where i!=j)(not(forall(t in 1..num_count)(number[i,t]=number[j,t])));

array[1..symbol_count] of var 1..n: symbol_loc;
constraint forall(i in 1..symbol_count)(expr_int[symbol_loc[i]]==1 \/ expr_int[symbol_loc[i]]==2);
constraint forall(i in 1..symbol_count-1)(symbol_loc[i]<symbol_loc[i+1]);

array[1..symbol_count] of var 1..symbol_count: priority;

function var int: bracket_num(var int: loc) =
sum(i in 1..loc-1 where expr_int[i]==3)(1) - sum(i in 1..loc-1 where expr_int[i]==4)(1);

constraint alldifferent(priority);
constraint forall(i,j in 1..symbol_count where i!=j /\ bracket_num(symbol_loc[i]) > bracket_num(symbol_loc[j]))(priority[i]<priority[j]);
%先计算括号内的，再计算括号外的
constraint forall(i,j in 1..symbol_count where i!=j /\ bracket_num(symbol_loc[i]) == bracket_num(symbol_loc[j]) /\ expr_int[symbol_loc[i]]==1 /\ expr_int[symbol_loc[j]]==2)(priority[i]>priority[j]);
%“×”运算优先于“⊕”运算，即计算表达式时，先计算×运算，再计算⊕运算。

function var int: add(var 0..1: a, var 0..1: b) =
if a==0 /\ b==0 then 0 else 1 endif;

function var int: mult(var 0..1: a, var 0..1: b) =
if a==1 /\ b==1 then 1 else 0 endif;

array[1..max_plans,0..symbol_count,1..num_count] of var 0..1: state;
constraint forall(i in 1..plan_num)(state[i,0,1..num_count]=number[i,1..num_count]);

constraint forall(i in 1..plan_num,j in 0..symbol_count-1)
(forall(t in 1..symbol_count where priority[t]==j+1)(
if expr_int[t]==1 
then state[i,j+1,t]=add(state[i,j,t],state[i,j,t+1]) /\ state[i,j+1,t+1]=add(state[i,j,t],state[i,j,t+1]) 
else state[i,j+1,t]=mult(state[i,j,t],state[i,j,t+1]) /\ state[i,j+1,t+1]=mult(state[i,j,t],state[i,j,t+1]) 
endif /\
forall(l in 1..num_count where l!=t /\ l!=t+1)(state[i,j+1,l]=state[i,j,l]) ));

constraint forall(i in 1..plan_num)(sum(t in 1..num_count)(state[i,symbol_count,t])=0);
%请问有多少种填法可以使得表达式的值为 0。

%solve

solve maximize plan_num;

%output

output[show(plan_num mod 10007)];
