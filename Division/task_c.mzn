%CSP2019-S D2T2
%input

int: n;
array[1..n] of int: a;

%description

var 0..n-1: part_num;
array[1..n] of var 1..n: k;
array[1..n] of var 1..n: begin;
array[1..n] of var 1..n: end;
constraint begin[1]=1 /\ forall(i in 1..part_num)(begin[i+1]=k[i]+1);
constraint end[part_num+1]=n /\ forall(i in 1..part_num)(end[i]=k[i]);
constraint forall(i in 1..part_num-1)(k[i]<k[i+1]) /\ if part_num>0 then k[part_num]<n endif;
%明需要找到一些分界点1<=k_1<k_2<...<k_p<n
constraint forall(i in 1..part_num)(sum(j in begin[i]..end[i])(a[j]) <= sum(j in begin[i+1]..end[i+1])(a[j]));
%使得\sum_{i=1}^{k_1}a_i<=\sum_{i=1}^{k_2+1}a_i<=...<=\sum_{i=1}^{k_p+1}a_i
var int: ans;
constraint ans=sum(i in 1..part_num+1)(sum(j in begin[i]..end[i])(a[j])* sum(j in begin[i]..end[i])(a[j]));
%也就是最小化(\sum_{i=1}^{k_1}a_i)^2+(\sum_{i=k_1+1}^{k_2}a_i)^2+...+(\sum_{i=k_p+1}^{n}a_i)^2

%solve

solve minimize ans;

%output

output[show(ans)];
