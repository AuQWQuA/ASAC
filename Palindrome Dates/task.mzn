% NOIP2016-J T2
% input

int: s;
int: t;

% description

var int: res;
predicate val_ymd(var int: y, var int: m, var int: d) =
  m >= 1 /\ m <= 12 /\ d >= 1 /\ (m in {1, 3, 5, 7, 8, 10, 12} -> d <= 31) /\ (m in {4, 6, 9, 11} -> d <= 30) /\
  (m = 2 -> d <= 29) /\ ((m = 2 /\ (y mod 4 != 0 \/ (y mod 400 != 0 /\ y mod 100 == 0))) -> d <= 28);
% 每一年中都有12个月份：
% 其中，1、3、5、7、8、10、12月每个月有31天；4、6、9、11月每个月有30天，而对于2月，闰年时有29天，平年时有28天。
% 一个年份是闰年当且仅当它满足下列两种情况的其中一种:1.这个年份是4的整数倍，但不是100的整数倍；2.这个年份是400的整数倍

predicate val_pal(var int: w) =
  w mod 10 == w div 10000000 /\ w div 10 mod 10 == w div 1000000 mod 10 /\ w div 100 mod 10 = w div 100000 mod 10 /\ w div 1000 mod 10 == w div 10000 mod 10;
 %一个８位数字是回文的，当且仅当对于所有的i(1<=i<=8)从左向右数的第i个数字和第9-i个数字(即从右向左数的第i个数字)是相同
predicate val_date(var int: w) =
  val_ymd(w div 10000, w div 100 mod 100, w mod 100) /\ val_pal(w);
  
predicate val_num(var int: s, var int: t, var int: num) =
  if val_date(s) then 
    (s = t /\ num = 1) \/ (s < t /\ val_num(s + 1, t, num - 1))
  else 
    (s = t /\ num = 0) \/ (s < t /\ val_num(s + 1, t, num))
  endif; 
  
constraint val_num(s, t, res);
  
% solve

solve satisfy; 

% output

output["res=" ++ show(res)];