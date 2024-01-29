%NOIP2015-S D1T3
%input

int: T;
int: n;
array[1..T,1..n,1..2] of int: cards;

%description

predicate valid(var int: order, var set of 1..n: card_set) =
(card(card_set) = 2
/\ exists(i in card_set)(cards[order,i,1] == 0 /\ cards[order,i,2] == 1) 
/\ exists(i in card_set)(cards[order,i,1] == 0 /\ cards[order,i,2] == 2)) \/
% Rocket, which is a pair of kings (double joker).

(card(card_set) = 4
/\ exists(j in 1..13)(forall(i in card_set)(cards[order,i,1] = j))
) \/
% Bomb, which is four cards of the same rank, e.g., four Aces.

(card(card_set) = 1) \/
% Single card, a single card, e.g., 3.

(card(card_set) = 2
/\ exists(j in 1..13)(forall(i in card_set)(cards[order,i,1] = j))) \/
% Pair card, two cards with the same rank.

(card(card_set) = 3
/\ exists(j in 1..13)(forall(i in card_set)(cards[order,i,1] = j))) \/
% Three of a kind, three cards with the same rank.

(card(card_set) = 4
/\ exists(j in 1..13)(sum(k in card_set where cards[order,k,1] = j)(1) = 3)) \/
% Three with one, three cards with the same rank + one single card. E.g., three 3s + one 4.

(card(card_set) = 5
/\ exists(j in 1..13, l in 1..13 where j != l)
(sum(k in card_set where cards[order,k,1] = j)(1) = 3 /\ sum(k in card_set where cards[order,k,1] = l)(1) = 2)) \/
% Three with two, three cards with the same rank + one pair. E.g., three 3s + one pair of 4s.

(card(card_set) >= 5
/\ exists(j in 3..13)
(forall(k in 1..card(card_set))(sum(c in card_set where cards[order,c,1] = k + j - 1)(1) = 1))) \/
% Single straight, five or more consecutive rank cards (excluding 2s and double jokers).
% In addition, in straight hands (single straight, double straight, triple straight), the suits of the cards are not required to be the same.

(card(card_set) >= 6 /\ card(card_set) mod 2 = 0
/\ exists(j in 3..13)
(forall(k in 1..card(card_set) div 2)(sum(c in card_set where cards[order,c,1] = k + j - 1)(1) = 2))) \/
% Double straight, three or more pairs of consecutive rank cards (excluding 2s and double jokers). E.g., pairs 3 + pairs 4 + pairs 5.

(card(card_set) >= 6 /\ card(card_set) mod 3 = 0
/\ exists(j in 3..13)
(forall(k in 1..card(card_set) div 3)(sum(c in card_set where cards[order,c,1] = k + j - 1)(1) = 3))) \/
% Triple straight, two or more groups of consecutive rank cards with three of a kind (excluding 2s and double jokers). E.g., three 3s + three 4s.

(card(card_set) = 6
/\ exists(j in 1..13)
(sum(k in card_set where cards[order,k,1] = j)(1) = 4)) \/
(card(card_set) = 8
/\ exists(j in 1..13, l in 1..13, p in 1..13 where not(j == l \/ j == p \/ p == l))
(sum(k in card_set where cards[order,k,1] = j)(1) = 4 /\ sum(k in card_set where cards[order,k,1] = l)(1) = 2 
/\ sum(k in card_set where cards[order,k,1] = p)(1) = 2)) \/
% Four with two, four cards with the same rank + any two single cards (or any two pairs of cards). E.g., four 5s + single 3 + single 8 or four 4s + pairs 5 + pairs 7.
(card(card_set) = 0);

array[1..T,1..n] of var set of 1..n: card_order;

constraint forall(i in 1..T)(array_union(card_order[i,1..n]) = 1..n);
constraint forall(i in 1..T)(forall(j in 1..n,k in 1..n where j != k)(card_order[i,j] intersect card_order[i,k] = {}));
constraint forall(i in 1..T,j in 1..n)(valid(i,card_order[i,j]));

array[1..T] of var 1..n: ans;
constraint forall(i in 1..T)(ans[i] = count(j in 1..n)(card(card_order[i,j]) > 0));
% For each set of hands, determine the minimum number of times they need to play to get rid of all of them.

%solve

solve satisfy;

%output

output[show(ans)];
