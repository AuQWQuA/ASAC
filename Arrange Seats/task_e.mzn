%NOIP2008-J T2
%input

include"alldifferent.mzn";
int: M;
int: N;
int: K;
int: L;
int: D;
array[1..D,1..4] of int: students;

%description

array[1..K] of var 1..M: horizontal;
array[1..L] of var 1..N: vertical;
var 0..D: total;

constraint alldifferent(horizontal);
constraint alldifferent(vertical);
predicate horizontal_separate(array[1..K] of var 1..M: horizontal,var int:i)=
exists(j in horizontal)((students[i,1]=j /\ students[i,3]=j+1 ) \/ (students[i,1]=j+1 /\ students[i,3]=j ) );

predicate vertical_separate(array[1..L] of var 1..N: vertical,var int:i)=
exists(j in vertical)((students[i,2]=j /\ students[i,4]=j+1 ) \/ (students[i,2]=j+1 /\ students[i,4]=j ) );
% If a passage separates two students who would whisper to each other, then they will not whisper to each other.

function var int: count(array[1..K] of var 1..M: horizontal,array[1..L] of var 1..N: vertical,var int:i)=
if(horizontal_separate(horizontal,i)) then 1 elseif (vertical_separate(vertical,i)) then 1 else 0 endif;

constraint total=sum([count(horizontal,vertical,i) | i in 1..D]);

%solve

solve maximize total;
% Under this plan, the number of pairs of students whispering to each other during class is minimized.

%output

output[show(horizontal[arg_sort(fix(horizontal))[i]])++if i!=K then " " else "\n" endif | i in 1..K];
output[show(vertical[arg_sort(fix(vertical))[i]])++if i!=L then " " else "\n" endif| i in 1..L];



