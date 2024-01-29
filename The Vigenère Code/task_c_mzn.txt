%NOIP2012-S D1T1
%input

string: M;
string: k;

%description

array[1..26,1..26] of string: Vigenere=
[|"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"|
"B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A"|
"C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B"|
"D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C"|
"E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D"|
"F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E"|
"G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F"|
"H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G"|
"I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H"|
"J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I"|
"K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J"|
"L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K"|
"M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L"|
"N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M"|
"O","P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N"|
"P","Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"|
"Q","R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"|
"R","S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"|
"S","T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R"|
"T","U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S"|
"U","V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T"|
"V","W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U"|
"W","X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V"|
"X","Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W"|
"Y","Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X"|
"Z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y"|];

function int: to_int(string: s) = if s=="A" \/ s=="a" then 1
elseif s=="B" \/ s=="b" then 2
elseif s=="C" \/ s=="c" then 3
elseif s=="D" \/ s=="d" then 4
elseif s=="E" \/ s=="e" then 5
elseif s=="F" \/ s=="f" then 6
elseif s=="G" \/ s=="g" then 7
elseif s=="H" \/ s=="h" then 8
elseif s=="I" \/ s=="i" then 9
elseif s=="J" \/ s=="j" then 10
elseif s=="K" \/ s=="k" then 11
elseif s=="L" \/ s=="l" then 12
elseif s=="M" \/ s=="m" then 13
elseif s=="N" \/ s=="n" then 14
elseif s=="O" \/ s=="o" then 15
elseif s=="P" \/ s=="p" then 16
elseif s=="Q" \/ s=="q" then 17
elseif s=="R" \/ s=="r" then 18
elseif s=="S" \/ s=="s" then 19
elseif s=="T" \/ s=="t" then 20
elseif s=="U" \/ s=="u" then 21
elseif s=="V" \/ s=="v" then 22
elseif s=="W" \/ s=="w" then 23
elseif s=="X" \/ s=="x" then 24
elseif s=="Y" \/ s=="y" then 25
elseif s=="Z" \/ s=="z" then 26
else 1 endif;

int: M_len=string_length(M);
int: k_len=string_length(k);

%solve

solve satisfy;

array[1..M_len] of int: y=[to_int(fix(M[i])) | i in 1..M_len];
array[1..M_len] of int: x=[to_int(fix(k[((i-1) mod k_len)+1])) | i in 1..M_len];
%当明文 M 的长度大于密钥 k 的长度时，将密钥 k 重复使用。
array[1..M_len] of var int: z=[min(j in 1..26 where Vigenere[j,fix(x[i])]=Vigenere[1,fix(y[i])])(j)|i in 1..M_len];
string: out_str=concat(i in 1..M_len)(Vigenere[1,fix(z[i])]);

%output

output[show(out_str)];





