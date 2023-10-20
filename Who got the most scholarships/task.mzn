%NOIP2005-S T1
%input

int: n;
%输入文件的第一行是一个整数 N(1 <= N <= 100)，表示学生的总数。
array[1..n] of string: name;
%接下来的 N 行每行是 一位学生的数据，从左向右依次是姓名
array[1..n] of int: score;
%期末平均成绩
array[1..n] of int: review;
%班级评议成绩
array[1..n] of string: if_leader;
%是否是学生干部
array[1..n] of string: if_west;
%是否是西部省份学生
array[1..n] of int: paper;
%以及发表的论文数

%description

array[1..n] of var int: scholarship;

function var int: fellow(int: score,int: paper)=
if score>80 /\ paper>=1 then 8000 else 0 endif;
%院士奖学金，每人80008000元，期末平均成绩高于8080分（>80>80），并且在本学期内发表11篇或11篇以上论文的学生均可获得；

function var int: mayfourth(int: score,int: review)=
if score>85 /\ review>80 then 4000 else 0 endif;
%五四奖学金，每人40004000元，期末平均成绩高于8585分（>85>85），并且班级评议成绩高于8080分（>80>80）的学生均可获得；

function var int: grade(int: score)=
if score>90 then 2000 else 0 endif;
%成绩优秀奖，每人20002000元，期末平均成绩高于9090分（>90>90）的学生均可获得；

function var int: west(int: score,string: if_west)=
if score>85 /\ if_west="Y" then 1000 else 0 endif;
%西部奖学金，每人10001000元，期末平均成绩高于8585分（>85>85）的西部省份学生均可获得；

function var int: contribution(int: review,string: if_leader)=
if review>80 /\ if_leader="Y" then 850 else 0 endif;
%班级贡献奖，每人850850元，班级评议成绩高于8080分（>80>80）的学生干部均可获得；

constraint forall(i in 1..n)(scholarship[i]=
fellow(score[i],paper[i]) + mayfourth(score[i],review[i]) + grade(score[i]) + west(score[i],if_west[i]) + contribution(review[i],if_leader[i]));
%只要符合条件就可以得奖，每项奖学金的获奖人数没有限制，每名学生也可以同时获得多项奖学金。

%solve

solve satisfy;

%output

output[
"\(name[arg_max(fix(scholarship))])\n"++
"\(max(fix(scholarship)))\n"++
"\(sum(scholarship))"
];
%第1行是获得最多奖金的学生的姓名。
%第2行是这名学生获得的奖金总数。如果有两位或两位以上的学生获得的奖金最多，输出他们之中在输入文件中出现最早的学生的姓名。
%第3行是这NN个学生获得的奖学金的总数
