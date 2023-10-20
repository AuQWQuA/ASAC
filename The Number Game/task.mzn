% CSP2019-J T1
%input

string: numstr;

%description

int: num_length=string_length(numstr);
var int: one_num;
constraint one_num=sum(i in 1..num_length where numstr[i]="1")(1);
%小P同学想知道字符串中有多少个1

%solve

solve satisfy;

%output

output ["\(one_num)"];