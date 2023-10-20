%CSP2019-S D2T1
%input

int: n;
int: m;
array[1..n,1..m] of int: a;

%description
int: max_num=pow(2,n+m+1);
array[1..max_num,1..n,1..2] of var int: plans;
%Emiya 做的每道菜都将使用恰好一种烹饪方法与恰好一种主要食材
var 0..max_num: num;
constraint forall(i in 1..num,j in 1..n)(plans[i,j,1] in 1..n /\ plans[i,j,2] in 1..m);
array[1..max_num] of var 1..n: dish_num;
%Emiya 不会让大家饿肚子，所以将做至少一道菜，即k≥1
constraint forall(i,j in 1..num where i!=j)(dish_num[i]!=dish_num[j] \/ not(forall(k,l in 1..dish_num[i] where plans[i,k,1]=plans[j,l,1])(plans[i,k,2]=plans[j,l,2])));

constraint forall(i in 1..num)(forall(j,k in 1..dish_num[i] where j!=k)(plans[i,j,1]!=plans[i,k,1]));
%Rin 希望品尝不同烹饪方法做出的菜，因此她要求每道菜的烹饪方法互不相同
constraint forall(i in 1..num)(forall(j in 1..dish_num[i])(a[plans[i,j,1],plans[i,j,2]]>0));
constraint forall(i in 1..num)(forall(j in 1..m)(sum(k in 1..dish_num[i] where plans[i,k,2]=j)(1)<=dish_num[i] div 2));
%Yazid 不希望品尝太多同一食材做出的菜，因此他要求每种主要食材至多在一半的菜（即⌊k/2⌋ 道菜）中被使用

array[1..max_num] of var int: methods;
constraint forall(i in 1..num)(methods[i]=product(j in 1..dish_num[i])(a[plans[i,j,1],plans[i,j,2]]));
var int: s;
constraint s=sum(i in 1..num)(methods[i]) mod 998244353;
%Emiya 找到了你，请你帮他计算，你只需要告诉他符合所有要求的搭配方案数对质数 998,244,353998,244,353 取模的结果。

%solve

solve:: int_search(array1d(plans),input_order, indomain, complete)
 maximize num;

%output

output[show(s)];
