%NOIP2008-S T3
%input

int: m;
int: n;
array[1..m,1..n] of int: students;

%description

array[1..m+n,1..2] of var int: first;
array[1..m+n,1..2] of var int: second;

int: L=m+n-1;

constraint forall(i in 1..L)(first[i,1]>=1 /\ first[i,2]<=m);
constraint forall(i in 1..L)(second[i,1]>=1 /\ second[i,2]<=n);

constraint (first[1,1]=1 /\ first[1,2]=1) /\ (first[m+n,1]=m /\ first[m+n,2]=n);
constraint (second[1,1]=m /\ second[1,2]=n) /\ (second[m+n,1]=1 /\ second[m+n,2]=1);
%小渊坐在矩阵的左上角，坐标(1,1)，小轩坐在矩阵的右下角，坐标(m,n)
predicate neighbor(array[1..2] of var int: a,array[1..2] of var int: b)=
(b[1]=a[1] /\ b[2]=a[2]+1) \/ (b[2]=a[2] /\ b[1]=a[1]+1);
%从小渊传到小轩的纸条只可以向下或者向右传递，从小轩传给小渊的纸条只可以向上或者向左传递。

constraint forall(i in 1..L-1)(neighbor(first[i,1..2],first[i+1,1..2]));
constraint forall(i in 1..L-1)(neighbor(second[i+1,1..2],second[i,1..2]));

constraint forall(i,j in 2..L-1)(not(first[i,1]=second[j,1] /\ first[i,2]=second[j,2]));
%在活动进行中，小渊希望给小轩传递一张纸条，同时希望小轩给他回复。班里每个同学都可以帮他们传递，但只会帮他们一次，也就是说如果此人在小渊递给小轩纸条的时候帮忙，那么在小轩递给小渊的时候就不会再帮忙。

var int: value;
constraint value=sum([ students[first[i,1],first[i,2]] | i in 1..L ]) + sum([ students[second[i,1],second[i,2]] | i in 1..L ]);
%小渊和小轩希望尽可能找好心程度高的同学来帮忙传纸条，即找到来回两条传递路径，使得这两条路径上同学的好心程度只和最大。

%solve

solve maximize value;

%output

output[show(value)];


