%NOIP2018-S D2T2
%input

int: n;
int: m;

%desctiption

int: max_mn=product(i in m..m+n-2)(i) div product(i in 1..n-1)(i);
int: max_t=pow(2,m*n);
array[1..max_t,1..n,1..m] of var 0..1: table;
array[1..max_mn,1..m+n-2] of var 0..1: direction;
array[1..max_t,1..max_mn,1..m+n-1] of var 0..1: track;

constraint forall(i,j in 1..max_t where i!=j)(not(forall(x in 1..n,y in 1..m)(table[i,x,y]=table[j,x,y])));
constraint forall(i in 1..max_mn)(count(j in 1..m+n-2)(direction[i,j]=0)=n-1 /\ count(j in 1..m+n-2)(direction[i,j]=1)=m-1);
constraint forall(i,j in 1..max_mn where i!=j)(not(forall(k in 1..m+n-2)(direction[i,k]=direction[j,k])));

function array[1..m+n-1] of var 0..1: get_track(array[1..n,1..m] of var 0..1: t, array[1..m+n-2] of var 0..1: d)=
let{
array[1..m+n-1] of var 0..1: tmp;
constraint tmp[1]=t[1,1] /\ tmp[m+n-1]=t[n,m];
%这条路径从矩形表格的左上角的格子(0,0)出发，到矩形的右下角格子(n − 1, m − 1)结束；
constraint forall(i in 1..m+n-2)(tmp[i]=t[count(j in 1..i-1)(d[j]=0)+1,count(j in 1..i-1)(d[j]=1)+1]);
%将每条合法路径 P 经过的每个格子上填入的数字依次连接后，会得到一个长度为n + m − 1的 01 字符串
} in tmp;

predicate larger(array[1..m+n-2] of var 0..1: d1,array[1..m+n-2] of var 0..1: d2)=
exists(i in 1..m+n-2)(forall(k in 1..i-1)(d1[k]=d2[k]) /\ d1[i]>d2[i]);
%我们说字符串 a 比字符串 b 小，当且仅当字符串 a 的字典序小于字符串 b 的字典序

constraint forall(t in 1..max_t)(forall(i in 1..max_mn)(track[t,i,1..m+n-1]=get_track(table[t,1..n,1..m],direction[i,1..m+n-2])));
array[1..max_t] of var 0..1: ans;
constraint forall(t in 1..max_t)
(if forall(i,j in 1..max_mn where i!=j /\ larger(direction[i,1..m+n-2],direction[j,1..m+n-2]))
(larger(track[t,i,1..m+n-2],track[t,j,1..m+n-2])) then ans[t]=1 else ans[t]=0 endif);
%使得对于两条路径𝑃1，P2，如果w(P1) >w(P2)，那么必须s(P1) ≤ s(P2)

%solve

solve satisfy;

%output

output[show(sum(ans))];



