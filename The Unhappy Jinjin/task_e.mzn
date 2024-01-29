% NOIP2004-J T1
%input

array[1..7,1..2] of int: time;
% Each row includes two non-negative integers less than 10, separated by a space, representing Jincheng's school hours and the time arranged by her mother for her classes.

%description

array[1..7] of var bool: unhappy;
constraint forall(i in 1..7)(unhappy[i]=(time[i,1]+time[i,2]>8));
% However, Jincheng will be unhappy if she has more than eight hours of classes in a day.

var int: longest=arg_max(i in 1..7)(time[i,1]+time[i,2]);
% Moreover, the longer she has classes, the unhappier she becomes.
% If two or more days have equal levels of unhappiness, output the earliest day.

%solve

solve satisfy;

%output

output[if fix(count(i in 1..7)(unhappy[i]==true))==0 then "0" else "\(longest)" endif];
% If she won't be unhappy, output 0. If she will be unhappy, output the day of the week when she's unhappiest (using 1, 2, 3, 4, 5, 6, 7 to represent Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, respectively).
