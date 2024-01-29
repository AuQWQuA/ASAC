% NOIP2012-J T2
% Input
int: N;
int: M;
array[1..N, 1..M] of 0..1: stairs;
array[1..N, 1..M] of int: number;
int: p;

% Description
function var int: distance(var int: begin, var int: target) =
    if target >= begin then target - begin
    else target + M - begin endif;

function var int: round_next(var int: begin, var int: d, var int: len) =
    if (begin + d) <= len then begin + d
    else ((begin + d - 1) mod len) + 1 endif;

function var int: go_up(array[1..M] of 0..1: layer_stairs, array[1..M] of int: layer_number, var int: enter) =
    let{
        array[int] of int: room_with_stairs = [i | i in 1..M where layer_stairs[i] == 1];
        var int: stair_len = card(index_set(room_with_stairs));
        var int: d = min(i in 1..M where layer_stairs[i] == 1)(distance(enter, i));
        var int: begin = round_next(enter, d, M);
        var int: begin_loc;
        constraint room_with_stairs[begin_loc] = begin;
    } in room_with_stairs[round_next(begin_loc, layer_number[enter] - 1, stair_len)];
% Each room has a signboard with a number x, indicating that starting from this room, choose the xth room with stairs in a counterclockwise direction.

array[1..N] of var int: code;
constraint code[1] = p + 1;
constraint forall(i in 1..N-1)(code[i + 1] = go_up(stairs[i, 1..M], number[i, 1..M], code[i]));

var int: answer = sum(i in 1..N)(number[i, code[i]]) mod 20123;
% Find the sum of the numbers on the signboards in each room (i.e., the number on the signboard in the first room entered on each floor) as the key to open the chest.
% Output the result modulo 20123.

%solve

solve satisfy;

% Output
output[show(answer)];
