%NOIP2016-S D2T3
%input

int: T;
array[1..T] of int: n;
int: sum_n=sum(n);
array[1..sum_n] of float: x;
array[1..sum_n] of float: y;

%description

array[1..T] of int: split_n=[ sum(j in 1..i-1)(n[j]) | i in 1..T];

int: max_n=max(n);
array[1..sum_n] of var set of 1..sum_n: bird;

constraint forall(i in 1..T)(array_union(bird[split_n[i]+1..split_n[i]+n[i]])=split_n[i]+1..split_n[i]+n[i]);

array[1..sum_n] of var float: a;
array[1..sum_n] of var float: b;
constraint forall(i in 1..sum_n)(a[i]<0 /\ a[i]>=-10 /\ b[i]<=10 /\ b[i]>=-10);

constraint forall(i in 1..T)(forall(j in split_n[i]+1..split_n[i]+n[i])
(card(bird[j])=0 \/ (card(bird[j])>0 /\ 
  forall(k in bird[j])
  (a[j]*x[k]*x[k]+b[j]*x[k]=y[k]))));
  
array[1..T] of var int: answer;
constraint forall(t in 1..T)( answer[t]=sum(i in split_n[t]+1..split_n[t]+n[t] where card(bird[i])>0)(1));

%solve

solve:: float_search(a,input_order,indomain_min)
 minimize sum(answer);

%output

output[show(answer)];
