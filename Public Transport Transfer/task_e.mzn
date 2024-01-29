% CSP2019-J T2
include "all_different.mzn";

% input

int: n;
array[1..n] of int: ty;
array[1..n] of int: price;
array[1..n] of int: time;

% description

array[1..n, 1..n] of var bool: used;
array[1..n] of var int: take;
var int: total;

predicate propagate(int: i, int: j) = 
  if(ty[i] == 0) then (if j == i then true else if i > 1 then used[i-1, j] else false endif endif)
  else (if i == 1 then false else if j == i \/ j == take[i] then false else used[i-1, j] endif endif)
  endif;
  
predicate could(int: i, var int: j) = (j == i) \/ (ty[j] == 0 /\ time[i] - time[j] <= 45 /\ price[j] >= price[i] /\ used[i-1, j]);
% After taking the subway once, you can get a discount ticket, which is valid for 45 minutes. Within the validity period, you can use this discount ticket to take a bus for free, as long as the bus fare does not exceed the subway fare.

predicate couldnot(int: i, var int: j) = forall(k in 1..j-1) (not could(i, k));
predicate take_bus(int: i) = could(i, take[i]) /\ couldnot(i, take[i]);
% When taking the bus, if you can use a discount ticket, you will definitely use it. If there are multiple discount tickets that meet the conditions, the one obtained earliest will be used first.

constraint forall(i in 1..n)(1 <= take[i] /\ take[i] <= i);
constraint total == sum(i in 1..n)(if take[i] == i then price[take[i]] else 0 endif);
constraint forall(i in 1..n)(if ty[i] == 0 then take[i] == i endif);
constraint forall(i in 1..n) (forall(j in 1..i) (used[i, j] == propagate(i, j)));
constraint forall(i in 1..n)(if ty[i] == 1 then take_bus(i) endif);

% solve

solve satisfy;

% output

output["\(total)"];
