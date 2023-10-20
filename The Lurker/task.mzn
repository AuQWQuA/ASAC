%NOIP2009-S T1
%input

int: n;
array[1..n] of string: encrypt;
array[1..n] of string: origin;
int: m;
array[1..m] of string: translate;

%description

array[1..26] of string: alphabet=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

array[1..n] of var 1..26: encrypt_int;
array[1..n] of var 1..26: origin_int;
array[1..m] of var 1..26: translate_int;
array[1..m] of var 1..26: out_int;
array[1..26] of var 1..26: code;


function var int:index_of_alphabet(string: str)=
min([i | i in 1..26 where alphabet[i]=str]);

constraint forall(i in 1..n)(encrypt_int[i]=index_of_alphabet(encrypt[i]));
constraint forall(i in 1..n)(origin_int[i]=index_of_alphabet(origin[i]));
constraint forall(i in 1..m)(translate_int[i]=index_of_alphabet(translate[i]));
%S 国对于每个字母规定了对应的“密字”。加密的过程就是将原信息中的所有字母替换为其对应的“密字”

var bool: if_fail;
var bool: condition1;
var bool: condition2;

constraint condition1=(card(array2set(origin_int)) <26 \/ card(array2set(encrypt_int)) <26);
%1．所有信息扫描完毕，‘A’-‘Z’ 所有 26 个字母在原信息中均出现过并获得了相应的“密字”。
%2. 所有信息扫描完毕，但发现存在某个（或某些）字母在原信息中没有出现。
constraint condition2=(exists(i,j in 1..n where i!=j)(origin_int[i]=origin_int[j] /\ encrypt_int[i]!=encrypt_int[j]));
%3. 扫描中发现掌握的信息里有明显的自相矛盾或错误（违反 S 国密码的编码规则）。例如某条信息“XYZ”被翻译为“ABA”就违反了“不同字母对应不同密字”的规则。
constraint if not condition1 /\ not condition2 then if_fail=false else if_fail=true endif;
%如此进行下去直到停止于如下的某个状态

constraint if not if_fail then forall(i in 1..n)(code[origin_int[i]]=encrypt_int[i]) else forall(i in 1..26)(code[i]=i) endif;
constraint forall(i in 1..m)(out_int[i]=code[translate_int[i]]);

%solve

solve satisfy;

%output

output[if fix(if_fail) then "Failed" else "\(concat([alphabet[fix(out_int)[i]]| i in 1..m]))"  endif];
