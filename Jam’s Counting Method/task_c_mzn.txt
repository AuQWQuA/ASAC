%NOIP2006-J T3
%input

int: s;
int: t;
int: w;
array[1..w] of string: str;
%输入文件有 2 行，第 1 行为 3 个正整数，用一个空格隔开:s t w(其中 s 为所使用的最小的字母的序号，t 为所使用的最大的字母的序号。w 为数字的位数， 这 3 个数满足:1≤s<t≤26, 2≤w≤t-s )
%第 2 行为具有 w 个小写字母的字符串，为一个符合要求的 Jam 数字。 所给的数据都是正确的，不必验证。

%description

array[int] of string: alphabet=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
function int: get_num(string: letter)=
if letter=="a" then 1 elseif letter=="b" then 2 elseif letter=="c" then 3 elseif letter=="d" then 4 elseif letter=="e" then 5 elseif letter=="f" then 6 elseif letter=="g" then 7 elseif letter=="h" then 8 elseif letter=="i" then 9 elseif letter=="j" then 10 elseif letter=="k" then 11 elseif letter=="l" then 12 elseif letter=="m" then 13 elseif letter=="n" then 14 elseif letter=="o" then 15 elseif letter=="p" then 16 elseif letter=="q" then 17 elseif letter=="r" then 18 elseif letter=="s" then 19 elseif letter=="t" then 20 elseif letter=="u" then 21 elseif letter=="v" then 22 elseif letter=="w" then 23 elseif letter=="x" then 24 elseif letter=="y" then 25 else 26 endif;

function var int: distance(array[1..w] of var int: x1,array[1..w] of var int: x2) =
sum(i in 1..w)((x2[i]-x1[i])*pow(t-s+1,w-i));
int: set_len=t-s+1;

predicate larger(array[1..w] of var s..t: l,array[1..w] of var s..t: r,var int:pointer)=
if pointer=w+1 then false
else l[pointer]>r[pointer] \/ (l[pointer]=r[pointer] /\ larger(l,r,pointer+1)) endif;

array[1..w] of int: str_int=[ get_num(str[i]) | i in 1..w];
array[0..5,1..w] of var s..t: str_list;
%次，Jam还指定使用字母的范围，例如，从2到10，表示只能使用{b,c,d,e,f,g,h,i,j}这些字母。
constraint str_list[0,1..w]=str_int;
constraint forall(i in 1..5)(forall(j,k in 1..w where j!=k)(str_list[i,j]!=str_list[i,k]));
%在Jam数字中，每个字母互不相同
constraint not exists(i,j in 1..5 where i!=j)(forall(k in 1..w)(str_list[i,k]=str_list[j,k]));
constraint forall(i in 1..5)(forall(j in 1..w-1)(str_list[i,j]<str_list[i,j+1]));
%而且从左到右是严格递增的
constraint forall(i,j in 0..5 where i<j)(larger(str_list[j,1..w],str_list[i,1..w],1));

var int: d=distance(str_list[0,1..w],str_list[5,1..w]);

%solve

solve minimize d;

%output

output[alphabet[fix(str_list[k,i])] ++ if i==w then "\n" else "" endif | k in 1..5,i in 1..w];
%输出文件最多为5行，为紧接在输入的Jam数字后面的5个Jam数字，如果后面没有那么多 Jam 数字，那么有几个就输出几个。每行只输出一个 Jam 数字，是由 w 个小写字母组成的字 符串，不要有多余的空格。