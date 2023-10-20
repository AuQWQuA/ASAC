%NOIP2018-J T1
%input

string: title;

%description

int: title_length=string_length(title);
var int: answer;
constraint answer=sum(i in 1..title_length where title[i]!=" ")(1);
%统计标题字符数时，空格和换行符不计算在内。

%solve

solve satisfy;

%output

output[show(answer)];