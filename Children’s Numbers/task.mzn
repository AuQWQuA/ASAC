% NOIP2013-J T3
%input

int: n;
int: p;
array [1 .. n] of int: a;

%description

array [1 .. n] of var int: character;
array [1 .. n] of var int: score;
var int: ans;

constraint forall(i in 1..n)(
character[i]=max(j,k in 1..i where j<=k)(sum(l in j..k)(a[l]))
);
%规定每个小朋友的特征值等于排在他前面（包括他本人）的小朋友中连续若干个（最少有一个）小朋友手上的数字之和的最大值。

constraint score[1]=character[1]; 
%第一个小朋友的分数是他的特征值

constraint forall(i in 2 .. n)( 
  score[i]=max(j in 1..i-1)(character[j]+score[j])
);
%其它小朋友的分数为排在他前面的所有小朋友中（不包括他本人），小朋友分数加上其特征值的最大值。

constraint ans = (max(i in 1 .. n)(score[i])) mod p;
%请计算所有小朋友分数的最大值，输出时保持最大值的符号，将其绝对值对 p 取模后输出。

%solve

solve satisfy;

%output

output[show(ans)];