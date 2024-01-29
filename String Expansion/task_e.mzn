%NOIP2007-S T2
%input

int: p1;
int: p2;
int: p3;
int: m;
array[1..m] of string: str;

%description

array[1..100] of var string: expansion;

array[1..36] of string: lower_alphabet=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"];

array[1..36] of string: upper_alphabet=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"];

array[1..1] of string: star=["*"];
function var int:index_of_array(array[1..36] of string: alphabet, string: str)=
min([i | i in 1..36 where alphabet[i]=str]);

%output

output[
if (p=1\/p=m) then str[p] elseif str[p-1]="-"\/ str[p+1]="-" then str[p] else
(
if str[p]="-" /\ ( (index_of_array(lower_alphabet,str[p-1])<=26 /\ index_of_array(lower_alphabet,str[p+1])<=26 /\ index_of_array(lower_alphabet,str[p-1])<index_of_array(lower_alphabet,str[p+1])) \/ 
(index_of_array(lower_alphabet,str[p-1])>26 /\ index_of_array(lower_alphabet,str[p+1])>26 /\ index_of_array(lower_alphabet,str[p-1])<index_of_array(lower_alphabet,str[p+1]))
)then 
if p3=2 then 
(if p1=1 
then concat(reverse(t in fix(index_of_array(lower_alphabet,str[p-1]))+1..fix(index_of_array(lower_alphabet,str[p+1]))-1,l in 1..p2)(lower_alphabet[t]))
elseif p1=2 
then concat(reverse(t in fix(index_of_array(lower_alphabet,str[p-1]))+1..fix(index_of_array(lower_alphabet,str[p+1]))-1,l in 1..p2)(upper_alphabet[t]))
else concat(reverse(t in fix(index_of_array(lower_alphabet,str[p-1]))+1..fix(index_of_array(lower_alphabet,str[p+1]))-1,l in 1..p2)(star[1])) endif)
else 
(if p1=1 
then concat(t in fix(index_of_array(lower_alphabet,str[p-1]))+1..fix(index_of_array(lower_alphabet,str[p+1]))-1,l in 1..p2)(lower_alphabet[t])
elseif p1=2 
then concat(t in fix(index_of_array(lower_alphabet,str[p-1]))+1..fix(index_of_array(lower_alphabet,str[p+1]))-1,l in 1..p2)(upper_alphabet[t])
else concat(t in fix(index_of_array(lower_alphabet,str[p-1]))+1..fix(index_of_array(lower_alphabet,str[p+1]))-1,l in 1..p2)(star[1]) endif) endif
else str[p] endif)
endif | p in 1..m];





