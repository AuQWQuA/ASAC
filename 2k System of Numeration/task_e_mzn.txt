%NOIP2006-S T4
%input

int: k;
int: w;
% The input file has only one line, which is two positive integers separated by a space: k W

%description

int: scale=pow(2,k);
int: maxnum=pow(2,w);

var 0..maxnum: optnum;
array[1..maxnum] of var 2..w: len;
% r is at least a 2-digit number in 2k base.
array[1..maxnum,1..w] of var 0..scale-1: r;

predicate different(var int: len1,var int: len2,array[1..w] of var int: r1,array[1..w] of var int: r2)=
 (len1!=len2) \/ ((len1==len2)/\(not forall(i in 1..len1)(r1[i]==r2[i])));
 
function var int: binary(array[1..w] of var int:r, var int: length) =
if length>0 then r[length]+2*binary(r,length-1)
else 0
endif;

constraint forall(i in 1..optnum)(r[i,1]!=0);
constraint forall(i in 1..optnum,j in 1..len[i]-1)(r[i,j]<r[i,j+1]);
% As a 2k base number, except for the last digit, each digit of r is strictly less than the digit to its right.
constraint forall(i,j in 1..optnum where i!=j)(different(len[i],len[j],r[i,1..w],r[j,1..w]));

constraint forall(i in 1..optnum)(binary(r[i,1..w],len[i]) < pow(2,w));
% After converting r to a binary number q, the total number of digits of q does not exceed w.

%solve

solve maximize optnum;

%output

output[show(optnum)];
% The output file is 1 line, which is a positive integer, which is the calculated result, that is, the number of different r that meet the conditions