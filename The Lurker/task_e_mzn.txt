% NOIP2009-S T1
% Input

int: n;
array[1..n] of string: encrypt;
array[1..n] of string: origin;
int: m;
array[1..m] of string: translate;

% Description

array[1..26] of string: alphabet=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

array[1..n] of var 1..26: encrypt_int;
array[1..n] of var 1..26: origin_int;
array[1..m] of var 1..26: translate_int;
array[1..m] of var 1..26: out_int;
array[1..26] of var 1..26: code;

function var int:index_of_alphabet(string: str) =
    min([i | i in 1..26 where alphabet[i]=str]);

constraint forall(i in 1..n)(encrypt_int[i]=index_of_alphabet(encrypt[i]));
constraint forall(i in 1..n)(origin_int[i]=index_of_alphabet(origin[i]));
constraint forall(i in 1..m)(translate_int[i]=index_of_alphabet(translate[i]));
% S country has specified a corresponding "secret letter" for each letter. The encryption process is to replace all letters in the original information with their corresponding "secret letters".

var bool: if_fail;
var bool: condition1;
var bool: condition2;

constraint condition1=(card(array2set(origin_int)) < 26 \/ card(array2set(encrypt_int)) < 26);
% 1. After scanning all the information, all 26 letters 'A'-'Z' have appeared in the original information and have received the corresponding "secret letters".
% 2. After scanning all the information, it is found that there exists some letter(s) that did not appear in the original information.
constraint condition2=(exists(i,j in 1..n where i!=j)(origin_int[i]=origin_int[j] /\ encrypt_int[i]!=encrypt_int[j]));
% 3. During the scanning, it is discovered that the information obtained has obvious contradictions or errors (violating the encoding rules of S country's code). For example, if a message "XYZ" is translated to "ABA," it violates the rule of "different letters corresponding to different secret letters."

constraint if not condition1 /\ not condition2 then if_fail=false else if_fail=true endif;
% Continue in this way until you stop in one of the following states

constraint if not if_fail then forall(i in 1..n)(code[origin_int[i]]=encrypt_int[i]) else forall(i in 1..26)(code[i]=i) endif;
constraint forall(i in 1..m)(out_int[i]=code[translate_int[i]]);

% Solve

solve satisfy;

% Output

output[if fix(if_fail) then "Failed" else "\(concat([alphabet[fix(out_int)[i]]| i in 1..m]))"  endif];
