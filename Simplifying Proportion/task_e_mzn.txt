% NOIP2014-J T2
% input

int: A;
int: B;
int: L;

% description

predicate mutuality(var int: x, var int: y) =
let{
    var int: m = min(x, y);
} in forall(i in 2..m)(not(x mod i == 0 /\ y mod i == 0));

var 1..L: A_s;
var 1..L: B_s;
% Please simplify A compared to B as A' compared to B', ensuring that both A' and B' are not greater than L.
constraint A_s/B_s >= A/B;
% A'/B' ≥ A/B

constraint mutuality(A_s, B_s);
% And under the condition that A' and B' are coprime

%solve

solve minimize A_s * B - A * B_s;
% And make A'/B' - A/B as small as possible.

% output

output["\(A_s) \(B_s)"];
