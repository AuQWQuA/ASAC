%NOIP2013-S D2T2
%input

int: n;
array[1..n] of int: h;
%栋栋的花的高度可以看成一列整数h1, h2, … , hn。

%description

var 1..n: m;
array[1..n] of var int: g;
%剩下的花的高度依次为g1, g2, … , gm
array[1..n] of var 1..n: chosen;
constraint forall(i in 1..m-1)(chosen[i]<chosen[i+1]);
constraint forall(i in 1..m)(g[i]=h[chosen[i]]);

%希望下面两个条件中至少有一个满足
constraint forall(i in 1..m where i mod 2==0)(if i-1>0 then g[i]>g[i-1] else true endif 
/\ if i+1<=m then g[i]>g[i+1] else true endif) \/ 
%条件 A：对于所有的𝑖，g_2i > g_2i−1，且g_2i > g_2i+1；
forall(i in 1..m where i mod 2==0)(if i-1>0 then g[i]<g[i-1] else true endif 
/\ if i+1<=m then g[i]<g[i+1] else true endif);
%条件 B：对于所有的𝑖，g_2i < g_2i−1，且g_2i < g_2i+1；

%solve

solve maximize m;
%栋栋最多能将多少株花留在原地。

%output

output[show(m)];


