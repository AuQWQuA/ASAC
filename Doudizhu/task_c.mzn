%NOIP2015-S D1T3
%input

int: T;
int: n;
array[1..T,1..n,1..2] of int: cards;

%description

predicate valid(var int: order,var set of 1..n:card_set)=
(card(card_set)=2
/\ exists(i in card_set)(cards[order,i,1]==0 /\ cards[order,i,2]==1) 
/\ exists(i in card_set)(cards[order,i,1]==0 /\ cards[order,i,2]==2)) \/
%火箭 即双王（双鬼牌）。
(card(card_set)=4
/\ exists(j in 1..13)(forall(i in card_set)(cards[order,i,1]=j))
) \/ 
%炸弹 四张同点牌。如四个 A。
(card(card_set)=1) \/
%单张牌 单张牌，比如 3。
(card(card_set)=2
/\ exists(j in 1..13)(forall(i in card_set)(cards[order,i,1]=j))) \/
%对子牌 两张码数相同的牌。
(card(card_set)=3
/\ exists(j in 1..13)(forall(i in card_set)(cards[order,i,1]=j))) \/
%三张牌 三张码数相同的牌。
(card(card_set)=4
/\ exists(j in 1..13)(sum(k in card_set where cards[order,k,1]=j)(1)=3)) \/
%三带一 三张码数相同的牌 + 一张单牌。例如：三张 3+单 4
(card(card_set)=5
/\ exists(j in 1..13,l in 1..13 where j!=l)
(sum(k in card_set where cards[order,k,1]=j)(1)=3 /\ sum(k in card_set where cards[order,k,1]=l)(1)=2  )) \/
%三带二 三张码数相同的牌 + 一对牌。例如：三张 3+对 4
(card(card_set)>=5
/\ exists(j in 3..13)
(forall(k in 1..card(card_set))(sum(c in card_set where cards[order,c,1]=k+j-1)(1)=1))) \/
%单顺子 五张或更多码数连续的单牌（不包括 2点和双王）例如：单 7+单 8+单 9+单 10+单 J。
%另外，在顺牌（单顺子、双顺子、三顺子）中，牌的花色不要求相同。
(card(card_set)>=6 /\ card(card_set) mod 2=0
/\ exists(j in 3..13)
(forall(k in 1..card(card_set) div 2)(sum(c in card_set where cards[order,c,1]=k+j-1)(1)=2))) \/
%双顺子 三对或更多码数连续的对牌（不包括 2点和双王）。例如：对 3+对 4+对 5。
(card(card_set)>=6 /\ card(card_set) mod 3=0
/\ exists(j in 3..13)
(forall(k in 1..card(card_set) div 3)(sum(c in card_set where cards[order,c,1]=k+j-1)(1)=3))) \/
%三顺子 二个或更多码数连续的三张牌（不能包括 2 点和双王）。例如：三张 3+三张 4+三张 5。
(card(card_set)=6
/\ exists(j in 1..13)
(sum(k in card_set where cards[order,k,1]=j)(1)=4)) \/
(card(card_set)=8
/\ exists(j in 1..13,l in 1..13,p in 1..13 where not(j==l \/ j==p \/ p==l))
(sum(k in card_set where cards[order,k,1]=j)(1)=4 /\ sum(k in card_set where cards[order,k,1]=l)(1)=2 
/\ sum(k in card_set where cards[order,k,1]=p)(1)=2 )) \/
%四带二 四张码数相同的牌+任意两张单牌（或任意两对牌）例如：四张 5+单 3+单 8 或 四张 4+对 5+对 7
(card(card_set)=0);

array[1..T,1..n] of var set of 1..n: card_order;

constraint forall(i in 1..T)(array_union(card_order[i,1..n])=1..n);
constraint forall(i in 1..T)(forall(j in 1..n,k in 1..n where j!=k)( card_order[i,j] intersect card_order[i,k]={}));
constraint forall(i in 1..T,j in 1..n)(valid(i,card_order[i,j]));

array[1..T] of var 1..n: ans;
constraint forall(i in 1..T)(ans[i]=count(j in 1..n)(card(card_order[i,j])>0));
%对于自己的若干组手牌，分别最少需要多少次出牌可以将它们打光。

%solve

solve satisfy;

%output

output[show(ans)];
  
