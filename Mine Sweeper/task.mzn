% NOIP2015-J T2
%input

int: n;
int: m;
array[int,int] of int: a;

%description

array[1..n,1..m] of var int: b;

function int: getval(int: x, int: y) = if (x < 1 \/ x > n \/ y < 1 \/ y > m) then 0 else a[x,y] endif;
%玩家翻开一个非地雷格时，该格将会出现一个数字——提示周围格子中有多少个是地雷格。

constraint forall(i in 1..n) (forall(j in 1..m) (0 <= a[i,j] /\ a[i,j] <= 1));
constraint forall(i in 1..n) (forall(j in 1..m) (if(a[i,j] == 1  ) then (b[i,j] == -1) else (b[i,j] = getval(i - 1, j - 1) + getval(i - 1, j) + getval(i - 1, j + 1) + getval(i, j - 1) + getval(i, j + 1) + getval(i + 1, j - 1) + getval(i + 1, j) + getval(i + 1, j + 1)) endif));
%一个格子的周围格子包括其上、下、左、右、左上、右上、左下、右下八个方向上与之直接相邻的格子。

%solve

solve satisfy;

%output

output [(if fix(b[i,j])!=-1 then show(b[i,j]) else "*" endif) ++ (if j==m then "\n" else "" endif)| i in 1..n,j in 1..m];
 