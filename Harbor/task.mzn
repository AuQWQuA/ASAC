%NOIP2016-J T3
%input

int:n;
array[1..n] of int:time;
array[1..n] of int:passenger;
array[1..n] of set of int:country;

%description

set of int: all_country=array_union(country);
array[1..n] of var set of all_country:union_country;

constraint forall(i in 1..n)
(
  forall(j in 1..i) 
  (
    if time[i]-time[j]<86400 then union_country[i] superset country[j] endif
  )
);
% 小K统计了n艘船的信息，希望你帮忙计算出每一艘船到达时间为止的24小时（24小时=86400秒）内所有乘船到达的乘客来自于多少个不同的国家

%solve

solve minimize sum(i in union_country)(card(i));

%output

output[show(card(union_country[i])) ++  " "|i in 1..n];