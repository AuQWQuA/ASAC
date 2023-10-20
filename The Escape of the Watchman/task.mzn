%NOIP2007-J T3
%input

int: M;
int: S;
int: T;

%description

enum action={run,flash,rest};
%守望者跑步、闪烁或休息活动均以秒(s)为单位，且每次活动的持续时间为整数秒。

var 1..T:min_time;
var int: max_dis;

array[1..T] of var action: action_list;
array[0..T] of var int: current_mana;
array[0..T] of var int: current_dis;

constraint current_dis[0]=0;
constraint current_mana[0]=M;

constraint forall(i in 1..T)(current_mana[i]>=0);
constraint forall(i in 1..T)(
if action_list[i]=run then current_mana[i]=current_mana[i-1]
elseif action_list[i]=flash then current_mana[i]=current_mana[i-1]-10
else current_mana[i]=current_mana[i-1]+4 endif
);
%每次使用闪烁法术都会消耗魔法值10点。守望者的魔法值恢复的速度为4点/s，只有处在原地休息状态时才能恢复。

constraint forall(i in 1..T)(
if action_list[i]=run then current_dis[i]=current_dis[i-1]+17
elseif action_list[i]=flash then current_dis[i]=current_dis[i-1]+60
else current_dis[i]=current_dis[i-1] endif
);
%守望者的跑步速度为17m/s，以这样的速度是无法逃离荒岛的。庆幸的是守望者拥有闪烁法术，可在1s内移动60m，

constraint max_dis=current_dis[T];
var int:score;

constraint if max_dis>=S then current_dis[min_time]>=S /\ current_dis[min_time-1]<S else min_time=T endif;
constraint score=if max_dis>=S then 300000-min_time else max_dis endif;
%写一个程序帮助守望者计算如何在最短的时间内逃离荒岛，若不能逃出，则输出守望者在剩下的时间内能走的最远距离。

%solve

solve::int_search(array1d(action_list),input_order, indomain, complete)
 maximize score;

%output

output[if fix(max_dis)>=S then "Yes\n\(min_time)" else "No\n\(max_dis)" endif];
%第1行为字符串“Yes”或“No”（区分大小写），即守望者是否能逃离荒岛。
%第2行包含一个整数。第一行为“Yes”（区分大小写）时表示守望者逃离荒岛的最短时间；第一行为“No”（区分大小写）时表示守望者能走的最远距离。

