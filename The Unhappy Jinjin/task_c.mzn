%NOIP2004-J T1
%input

array[1..7,1..2] of int: time;
%每行包括两个小于10的非负整数，用空格隔开，分别表示津津在学校上课的时间和妈妈安排她上课的时间。

%description

array[1..7] of var bool: unhappy;
constraint forall(i in 1..7)(unhappy[i]=(time[i,1]+time[i,2]>8));
%但是津津如果一天上课超过八个小时就会不高兴

var int: longest=arg_max(i in 1..7)(time[i,1]+time[i,2]);
%而且上得越久就会越不高兴
%如果有两天或两天以上不高兴的程度相当，则输出时间最靠前的一天。

%solve

solve satisfy;

%output

output[if fix(count(i in 1..7)(unhappy[i]==true))==0 then "0" else "\(longest)" endif];
%如果不会不高兴则输出0，如果会则输出最不高兴的是周几（用1, 2, 3, 4, 5, 6, 7分别表示周一，周二，周三，周四，周五，周六，周日）。
