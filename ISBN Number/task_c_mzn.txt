%NOIP2008-J T1
%input

string(13): isbn;

%description

function int: convert_str(string: s)=
if s="1" then 1
elseif s="2" then 2
elseif s="3" then 3
elseif s="4" then 4
elseif s="5" then 5
elseif s="6" then 6
elseif s="7" then 7
elseif s="8" then 8
elseif s="9" then 9
elseif s="0" then 0
elseif s="X" then 10 
else -1 endif;

array[1..11] of string: str_list=["0","1","2","3","4","5","6","7","8","9","X"]; 

int: answer=(convert_str(isbn[1])*1 + convert_str(isbn[3])*2 + convert_str(isbn[4])*3 + convert_str(isbn[5])*4 +
convert_str(isbn[7])*5 + convert_str(isbn[8])*6 + convert_str(isbn[9])*7 + convert_str(isbn[10])*8 + convert_str(isbn[11])*9) mod 11;
bool: right=if convert_str(isbn[13])==answer then true else false endif;

string(12): isbn_part=concat([isbn[i] | i in 1..12]);
string(1): last_num=str_list[answer+1];
string(13): correct=if right then "Right" else isbn_part++last_num  endif;

%solve

solve satisfy;
%首位数字乘以1加上次位数字乘以2……以此类推，用所得的结果mod 11，所得的余数即为识别码，如果余数为10，则识别码为大写字母X

%output

output[show(correct)];
%编写程序判断输入的ISBN号码中识别码是否正确，如果正确，则仅输出“Right”；如果错误，则输出你认为是正确的ISBN号码。