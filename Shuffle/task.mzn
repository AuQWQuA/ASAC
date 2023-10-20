% NOIP2018-J T3
%input

int: n;
int: m;
array[1..n] of int: T;

%description

int: upper_bound=max(T)+m;
int: max_times=min(max(T) div m +1,n);
var 1..max_times: times;
array[1..max_times] of var 0..upper_bound: departure;

var int: object;

constraint forall(i in 1..times-1)(departure[i+1]-departure[i] >= m);
constraint object=sum(i in 1..n)(min(j in 1..times where departure[j]>=T[i])(departure[j]-T[i]));
%摆渡车从人大附中出发、把车上的同学送到人民大学、再回到人大附中（去接其他同学），这样往返一趟总共花费 𝑚 分钟（同学上下车时间忽略不计）。

%solve

solve::int_search(array1d(departure),input_order, indomain, complete)
minimize object;

%output

output["\(object)"];


