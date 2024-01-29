%in large_scale cases, the solver is too slow
int: n;
int: q;
array [1..n] of int: index;
array [1..q] of int: reader_token;
array [1..q] of int: reader_bit;

array [1..q] of var 1..n+1: object;

%fit or book_id=n+1(indicate that no fit)
predicate fit(var int: book_id,int: reader_id)= 
   book_id==n+1 \/ (index[book_id] mod  pow(10,reader_bit[reader_id]))== reader_token[reader_id];
  
constraint forall(i in 1..q)(fit(object[i],i)/\ forall(k in 1..n)(not (fit(k,i) /\ (object[i]==n+1 \/ index[k]<index[object[i]]))));

solve satisfy;

output["\(if object[i]<n+1 then index[object[i]] else -1 endif)\n"|i in 1..q];