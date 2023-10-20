int: n;
var int: ans;
array[1..n, 1..n] of -1..1: color;
array[1..n*n] of var 1..n: x;
array[1..n*n] of var 1..n: y;
array[1..n*n] of var 0..1: tc;
array[1..n*n] of var 0..1: cost1;
array[1..n*n] of var {0,2}: cost2;
array[1..n*n] of var 0..3: way;
var 1..n*n: len;

constraint x[1]=1;
constraint y[1]=1;
constraint x[len]=n;
constraint y[len]=n;
constraint forall(i in 1..len-1)(
  (way[i]==0<->x[i]==x[i+1]/\y[i]==y[i+1]+1)/\
  (way[i]==1<->x[i]==x[i+1]/\y[i]==y[i+1]-1)/\
  (way[i]==2<->x[i]==x[i+1]+1/\y[i]==y[i+1])/\
  (way[i]==3<->x[i]==x[i+1]-1/\y[i]==y[i+1])
);
constraint forall(i in 1..len)(
  color[x[i],y[i]]>=0->tc[i]=color[x[i],y[i]]
);
constraint forall(i in 1..len-1)(
  color[x[i],y[i]]!=-1\/color[x[i+1],y[i+1]]!=-1
);
constraint forall(i in 1..len-1)(
  tc[i]=tc[i+1]<->cost1[i]=0
);
constraint forall(i in 1..len-1)(
  color[x[i+1],y[i+1]]=-1<->cost2[i]=2
);

constraint ans = sum(i in 1..len-1)(cost1[i]+cost2[i]);

solve minimize ans;
output ["ans=\(ans)"];

