%NOIP2011-J T2
%input

string: find_str;
string: text_str;

%description

int: find_len=string_length(find_str);
int: text_len=string_length(text_str);

function string: to_lower(string: s) = if s=="A" then "a"
elseif s=="B" then "b"
elseif s=="C" then "c"
elseif s=="D" then "d"
elseif s=="E" then "e"
elseif s=="F" then "f"
elseif s=="G" then "g"
elseif s=="H" then "h"
elseif s=="I" then "i"
elseif s=="J" then "j"
elseif s=="K" then "k"
elseif s=="L" then "l"
elseif s=="M" then "m"
elseif s=="N" then "n"
elseif s=="O" then "o"
elseif s=="P" then "p"
elseif s=="Q" then "q"
elseif s=="R" then "r"
elseif s=="S" then "s"
elseif s=="T" then "t"
elseif s=="U" then "u"
elseif s=="V" then "v"
elseif s=="W" then "w"
elseif s=="X" then "x"
elseif s=="Y" then "y"
elseif s=="Z" then "z"
else s endif;

array[1..find_len] of var string: find_str_list=[to_lower(find_str[i]) | i in 1..find_len];
array[1..text_len] of var string: text_str_list=[to_lower(text_str[i]) | i in 1..text_len];
%匹配单词时，不区分大小写

array[1..text_len-find_len+1] of var bool: answer=
[forall(j in 1..find_len)(find_str_list[j]==text_str_list[i+j-1]) /\ 
(if i>1 then text_str_list[i-1]==" " else true endif /\ if i+find_len-1<text_len then text_str_list[i+find_len]==" " else true endif)
| i in 1..text_len-find_len+1];
%但要求完全匹配，即给定单词必须与文章中的某一独立单词在不区分大小写的情况下完全相同（参见样例 1），如果给定单词仅是文章中某一单词的一部分则不算匹配（参见样例 2）。
var int: num=sum(answer);

%solve

solve satisfy;

int: final_ans=if fix(num)>0 then fix(num) else -1 endif;
int: t= if fix(num)>0 then min(i in 1..text_len-find_len+1 where fix(answer[i]))(i) -1 else -1 endif;

%output

output[show(final_ans)++show(t)];
