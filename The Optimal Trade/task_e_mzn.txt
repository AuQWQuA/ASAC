%NOIP2009-S T3
%input

int: n;
int: m;
array[1..n] of int: price;
array[1..m,1..3] of int: roads;

%description

array[1..2*n] of var 1..n: travel;
var 2..2*n: steps;
var 1..2*n: buy;
var 1..2*n: sell;
var int: income;

predicate available(var int: departure,var int: destination)=
exists(i in 1..m)((departure=roads[i,1] /\ destination=roads[i,2]) 
\/ (departure=roads[i,2] /\ destination=roads[i,1] /\ roads[i,3]=2));

constraint travel[1]=1 /\ travel[steps]=n;
% In C country, there are n cities numbered from 1 to n. Aron decides to start from city 1 and end his journey in city n.

constraint forall(i in 1..steps-1)(available(travel[i],travel[i+1]));
constraint buy<steps /\ sell<steps /\ buy<sell;
% He will choose to buy his favorite item, a crystal ball, in one city he passes through, and sell it in another city he passes through later, using the price difference as his travel expenses.

constraint income=price[travel[sell]]-price[travel[buy]];

%solve

solve maximize income;
% Please tell Aron how much he can earn at most.

%output

output[if fix(income)<0 then "0" else "\(income)" endif];
