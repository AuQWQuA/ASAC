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
%设 C 国 n 个城市的标号从 1~ n，阿龙决定从 1 号城市出发，并最终在 n 号城市结束自己的旅行。

constraint forall(i in 1..steps-1)(available(travel[i],travel[i+1]));
constraint buy<steps /\ sell<steps /\ buy<sell;
%他会选择一个经过的城市买入他最喜欢的商品——水晶球，并在之后经过的另一个城市卖出这个水晶球，用赚取的差价当做旅费。
constraint income=price[travel[sell]]-price[travel[buy]];

%solve

solve maximize income;
%请你告诉阿龙，他最多能赚取多少旅费

%output

output[if fix(income)<0 then "0" else "\(income)" endif];
