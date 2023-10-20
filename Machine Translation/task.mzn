%NOIP2010-S T1
%input

int: M;
int: N;
array[1..N] of int: words;

%description

enum op={hit,seek};
array[0..N,1..M] of var int: memory;
array[1..N] of var op: action;


constraint forall(i in 1..M)(memory[0,i]=-1);
constraint forall(i in 1..N)(if count(j in 1..M)(words[i]=memory[i-1,j])>0 then action[i]=hit /\ memory[i,1..M]=memory[i-1,1..M] 
%对于每个英文单词，软件会先在内存中查找这个单词的中文含义，如果内存中有，软件就会用它进行翻译
else action[i]=seek /\ forall(k in 1..M-1)(memory[i,k]=memory[i-1,k+1]) /\ memory[i,M]=words[i] endif);
%如果内存中没有，软件就会在外存中的词典内查找，查出单词的中文含义然后翻译，并将这个单词和译义放入内存，以备后续的查找和翻译。

%solve

solve satisfy;

%output

output["\(count(i in 1..N)(fix(action)[i]=seek))"];