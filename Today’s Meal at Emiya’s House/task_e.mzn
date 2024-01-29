% CSP2019-S D2T1
% Input
int: n;
int: m;
array[1..n, 1..m] of int: a;

% Description
int: max_num = pow(2, n + m + 1);
array[1..max_num, 1..n, 1..2] of var int: plans;
% Emiya will use exactly one cooking method and one main ingredient for each dish he makes.
var 0..max_num: num;
constraint forall(i in 1..num, j in 1..n)(plans[i, j, 1] in 1..n /\ plans[i, j, 2] in 1..m);
array[1..max_num] of var 1..n: dish_num;
% Emiya won't let anyone go hungry, so he will make at least one dish, i.e., k ≥ 1.
constraint forall(i, j in 1..num where i != j)(dish_num[i] != dish_num[j] \/ not(forall(k, l in 1..dish_num[i] where plans[i, k, 1] = plans[j, l, 1])(plans[i, k, 2] = plans[j, l, 2])));

constraint forall(i in 1..num)(forall(j, k in 1..dish_num[i] where j != k)(plans[i, j, 1] != plans[i, k, 1]));
% Rin wants to taste dishes made with different cooking methods, so she requires that the cooking methods for each dish are distinct.
constraint forall(i in 1..num)(forall(j in 1..dish_num[i])(a[plans[i, j, 1], plans[i, j, 2]] > 0));
constraint forall(i in 1..num)(forall(j in 1..m)(sum(k in 1..dish_num[i] where plans[i, k, 2] = j)(1) <= dish_num[i] div 2));
% Yazid doesn't want to taste too many dishes made with the same main ingredient, so he requires that each main ingredient is used in at most half of the dishes (i.e., ⌊k/2⌋ dishes).

array[1..max_num] of var int: methods;
constraint forall(i in 1..num)(methods[i] = product(j in 1..dish_num[i])(a[plans[i, j, 1], plans[i, j, 2]]));
var int: s;
constraint s = sum(i in 1..num)(methods[i]) mod 998244353;
% Emiya found you and asks you to help him calculate the number of valid combinations that satisfy all requirements modulo 998,244,353.

% Solve
solve::int_search(array1d(plans), input_order, indomain, complete)
maximize num;

% Output
output [show(s)];
