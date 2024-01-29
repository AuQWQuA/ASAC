% CSP2019-S D1T1
% input

int: n;
int: k;

%description

int: max_n=pow(2,n);
array[1..n,1..max_n,1..n] of var 0..1: gray;
constraint gray[1,1,1]=0 /\ gray[1,2,1]=1;
% 1-bit Gray code consists of two 1-bit binary strings: 0, 1.

constraint forall(i in 1..n-1)(
  forall(j in 1..pow(2,i))(
    forall(t in 1..i)(
      gray[i+1,j,t+1]=gray[i,j,t]
    ) /\ gray[i+1,j,1]=0
  )
  % (n+1)-bit Gray code's first 2^n binary strings are generated from n-bit Gray codes
  /\ forall(j in 1..pow(2,i))(
    forall(t in 1..i)(
      gray[i+1,pow(2,i+1)-j+1,t+1]=gray[i,j,t]
    ) /\ gray[i+1,pow(2,i+1)-j+1,1]=1
  )
  % (n+1)-bit Gray code's last 2^n binary strings are generated from reversed n-bit Gray codes
);

%solve

solve satisfy;

%output

output["\(gray[n,k+1,i])" | i in 1..n];
% Calculate the k-th binary string in the generated n-bit Gray code.
