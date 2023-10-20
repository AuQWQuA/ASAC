%NOIP2018-J T4
% input

int: n;
array [1..n] of -1..n: l;
array [1..n] of -1..n: r;
array [1..n] of 1..1000: c;

% description

array [1..n] of var 0..n: father;
array [1..n, 1..n] of var 0..n: a;
array [1..n, 1..n] of var bool: vis;
array [1..n, 1..n] of var bool: val;
array [1..n] of var 1..n: size;
var 1..n: pos;
var int: ans;

constraint father[1] = 0;
constraint forall (i in 1..n)(
  (l[i] != -1 -> father[l[i]] = i) /\ (r[i] != -1 ->father[r[i]] = i)
);

constraint forall (i in 1..n)(vis[i,i] = true);
constraint forall (i in 1..n, j in 1..n)(
  vis[i,j] = true -> (
    (i = j \/ (father[j] != 0 /\ vis[i, father[j]])) /\
    (l[j] = -1 \/ vis[i, l[j]]) /\
    (r[j] = -1 \/ vis[i, r[j]])
  )
);

predicate pushup(var 1..n: root, var 1..n: i) =
  a[root, i] > 0 -> (
    vis[root, i] /\ (i = root \/ father[a[root, i]] = a[root, father[i]])
);

predicate match(var 1..n: root, var -1..n: k1, var -1..n: k2) = 
  (k1 = -1 -> (k2 = -1 \/ a[root, k2] = 0)) /\
  (k2 = -1 -> (k1 = -1 \/ a[root, k1] = 0)) /\
  ((k1 != -1 /\ k2 != -1) -> (a[root, k1] = k2 /\ a[root, k2] = k1))
;

predicate pushdown(var 1..n: root, var 1..n: i) =
  let {var int: m = a[root, i]; var int: l1 = l[i]; var int: l2 = l[m]; var int: r1 = r[i]; var int: r2 = r[m]} in
    (a[root, m] = i /\ match(root, l1, r2) /\ match(root, l2, r1))
;
constraint forall (i in 1..n)(a[i,i] = i);
constraint forall (root in 1..n, i in 1..n) (a[root, i] > 0 -> (pushup(root, i) /\ pushdown(root, i))); 

predicate size_ok(var 1..n: i) =
  let {var int: lsize = if (l[i] = -1) then 0 else size[l[i]] endif, var int: rsize = if (r[i] = -1) then 0 else size[r[i]] endif} in
    size[i] = lsize + rsize + 1
;
constraint forall (i in 1..n)(size_ok(i));

predicate check_val(var 1..n: root, var 1..n: i) =
  val[root, i] <-> (vis[root, i] /\ a[root, i] > 0 /\ c[i] = c[a[root, i]] /\
    (if (l[i] == -1) then true else val[root, l[i]] endif) /\
    (if (r[i] == -1) then true else val[root, r[i]] endif)
);
constraint forall (root in 1..n, i in 1..n)(check_val(root, i));

constraint ans = if (val[pos, pos]) then size[pos] else 0 endif;

%solve

solve maximize ans;

%output

output ["\(ans)"]
