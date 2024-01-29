**Swiss System**

**Problem Description**

2\*N players numbered from 1 \~ 2N play R rounds in total. Before the start of each round, as well as after all competitions, the contestants are ranked in descending order of their total score. The total score of a contestant is the sum of the initial score before the start of the first round plus the score of all competitions in which the player has participated. For the players with the same total score, the player with the smaller serial number is ranked first.

The match-up arrangement of each round is related to the ranking before the start of each round: 1^st^ and 2^nd^, 3^rd^ and 4^th^,\... (2k-1)^th^ and 2k^th^\..., (2N-1)^th^ and 2N^th^, each play a match. In each game, the winner gets 1 point and the loser gets 0 points. This means that, except for the first round, the arrangement of the other rounds cannot be determined in advance, but depends on the performance of the players in the previous matches.

Now, given each player's initial score and strength, try to calculate the serial number of the player ranked Q after R rounds. We assume that players have different strength values and that the one with the higher strength value in each match always wins.

**Input**

The first line of the input is three positive integers N, R, and Q, separated by a space to indicate that there are 2\*N players, R rounds, and the ranking Q which we care about.

The second line contains 2\*N non-negative integers s~1~, s~2~,\..., s~2N~, every two numbers are separated by a space, where s~i~ denotes the initial score of the player numbered i.

The third row contains 2\*N positive integers w~1~, w~2~,\..., w~2N~, every two numbers are separated by a space, where w~i~ represents the strength value of the player numbered i.

1 ≤ N ≤ 100,000, 1 ≤ R ≤ 50, 1 ≤ Q ≤ 2N, 0 ≤ s~1~, s~2~, \... , s~2N~ ≤ 10^8^, 1 ≤ w~1~, w~2~ , \... , w~2N~ ≤ 10^8^

**Output**

The output is a single line that contains an integer, which is the serial number of the player ranked Q^th^ after R rounds.

**Sample Input**

2 4 2

7 6 6 7

10 5 20 15

**Sample Output**

1
