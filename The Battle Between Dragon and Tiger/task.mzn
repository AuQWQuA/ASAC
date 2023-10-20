% NOIP2018-J T2
% input 

int: n;
array[1..n] of int: num;
int: m;
int: p1;
int: s1;
int: s2;

%description

var 1..n: p2;
var int: left;
var int: right;


constraint left = sum(i in 1..(m-1))(num[i] * (m - i)) + 
                      if p1 < m then s1 * (m - p1) else 0 endif + 
                      if p2 < m then s2 * (m - p2) else 0 endif;
constraint right = sum(i in (m+1)..n)(num[i] * (i - m)) + 
                      if p1 > m then s1 * (p1 - m) else 0 endif +
                      if p2 > m then s2 * (p2 - m) else 0 endif;
%他们以 m 号兵营作为分界，靠左的工兵属于龙势力，靠右的工兵属于虎势力，而第 𝐦 号兵营中的工兵很纠结，他们不属于任何一方。                     
%一个兵营的气势为：该兵营中的工兵数 × 该兵营到 m 号兵营的距离；参与游戏一方的势力定义为：属于这一方所有兵营的气势之和。
%游戏过程中，某一刻天降神兵，共有 𝑠1 位工兵突然出现在了 𝑝1 号兵营。作为轩轩和凯凯的朋友，你知道如果龙虎双方气势差距太悬殊，轩轩和凯凯就不愿意继续玩下去了。为了让游戏继续，你需要选择一个兵营 𝑝2，并将你手里的 𝑠2 位工兵全部派往兵营 𝑝2，使得双方气势差距尽可能小。

% solve

solve minimize abs(left - right);

% output

output["p2="++show(p2)];