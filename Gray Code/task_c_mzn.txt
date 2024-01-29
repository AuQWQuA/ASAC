%CSP2019-S D1T1
%input

int: n;
int: k;

%description

int: max_n=pow(2,n);
array[1..n,1..max_n,1..n] of var 0..1: gray;
constraint gray[1,1,1]=0 /\ gray[1,2,1]=1;
%1 位格雷码由两个 1 位二进制串组成，顺序为：0，1。
constraint forall(i in 1..n-1)(forall(j in 1..pow(2,i))(forall(t in 1..i)(gray[i+1,j,t+1]=gray[i,j,t]) /\ gray[i+1,j,1]=0)
%n+1 位格雷码的前 2^n个二进制串，可以由依此算法生成的 n 位格雷码（总共 2^n个 n 位二进制串）按顺序排列，再在每个串前加一个前缀 0 构成。
/\ forall(j in 1..pow(2,i))(forall(t in 1..i)(gray[i+1,pow(2,i+1)-j+1,t+1]=gray[i,j,t]) /\ gray[i+1,pow(2,i+1)-j+1,1]=1));
%n+1 位格雷码的后 2^n个二进制串，可以由依此算法生成的 n 位格雷码（总共 2^n个 n 位二进制串）按逆序排列，再在每个串前加一个前缀 1 构成。

%solve

solve satisfy;

%output

output["\(gray[n,k+1,i])" | i in 1..n];
%请你求出按上述算法生成的 n 位格雷码中的 k 号二进制串