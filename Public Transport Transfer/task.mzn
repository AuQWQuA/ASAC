%CSP2019-J T2
include "all_different.mzn";

% input

int: n;
array[1..n] of int: ty;
array[1..n] of int: price;
array[1..n] of int: time;

% description

array[1..n,1..n] of var bool: used;
array[1..n] of var int: take;
var int: total;

predicate propagate(int: i, int: j) = 
  if(ty[i] == 0) then (if j == i then true else if i > 1 then used[i-1,j] else false endif endif)
  else (if i == 1 then false else if j == i \/ j == take[i] then false else used[i-1,j] endif endif)
  endif;
  
predicate could(int: i, var int: j) = (j == i) \/ (ty[j] == 0 /\ time[i] - time[j] <= 45 /\ price[j] >= price[i] /\ used[i-1,j]);
%在搭乘一次地铁后可以获得一张优惠票，有效期为45分钟，在有效期内可以消耗这张优惠票，免费搭乘一次票价不超过地铁票价的公交车。

predicate couldnot(int: i, var int: j) = forall(k in 1..j-1) (not could(i, k));
predicate take_bus(int: i) = could(i, take[i]) /\ couldnot(i, take[i]);
%搭乘公交车时，如果可以使用优惠票一定会使用优惠票；如果有多张优惠票满足条件，则优先消耗获得最早的优惠票

constraint forall(i in 1..n)(1 <= take[i] /\ take[i] <= i);
constraint total == sum(i in 1..n)(if take[i] == i then price[take[i]] else 0 endif);
constraint forall(i in 1..n)(if ty[i] == 0 then take[i] == i endif);
constraint forall(i in 1..n) (forall(j in 1..i) (used[i,j] == propagate(i, j)));
constraint forall(i in 1..n)(if ty[i] == 1 then take_bus(i) endif);

% solve

solve satisfy;

%output

output["\(total)"];
