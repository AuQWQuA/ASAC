% NOIP2016-J T3
% input

int: n;
array[1..n] of int: time;
array[1..n] of int: passenger;
array[1..n] of set of int: country;

% Description

set of int: all_country = array_union(country);
array[1..n] of var set of all_country: union_country;

constraint forall(i in 1..n)
(
  forall(j in 1..i) 
  (
    if time[i] - time[j] < 86400 then union_country[i] superset country[j] endif
  )
);
% Small K has collected information about n ships and wants you to help calculate how many different countries the passengers who arrived by boat from each ship within 24 hours (24 hours = 86400 seconds) before the arrival time come from.

%solve

solve minimize sum(i in union_country)(card(i));

%output

output[show(card(union_country[i])) ++ " " | i in 1..n];
