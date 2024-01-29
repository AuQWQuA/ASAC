% NOIP2010-S T1
% input

int: M;
int: N;
array[1..N] of int: words;

% description

enum op = {hit, seek};
array[0..N, 1..M] of var int: memory;
array[1..N] of var op: action;

constraint forall(i in 1..M)(memory[0, i] = -1);
constraint forall(i in 1..N)(if count(j in 1..M)(words[i] = memory[i-1, j]) > 0 then action[i] = hit /\
                            memory[i, 1..M] = memory[i-1, 1..M] 
                            % For each English word, the software first looks for its Chinese meaning in memory. 
                            % If it's found in memory, the software uses it for translation.
                            else action[i] = seek /\
                            forall(k in 1..M-1)(memory[i, k] = memory[i-1, k+1]) /\
                            memory[i, M] = words[i] endif);
% If it's not found in memory, the software searches for it in the external dictionary, finds the Chinese meaning, 
% translates it, and stores the word and its translation in memory for future lookups and translations.

%solve

solve satisfy;

%output

output["\(count(i in 1..N)(fix(action)[i] = seek))"];
