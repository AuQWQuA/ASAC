***The Big Bang Theory* edition Rock-Paper-Scissors Game**

**Problem Description**

Rock Paper Scissors is a common guessing game: rocks win scissors, scissors win papers, papers win rocks. If two punches are the same, there is no win or loss. An updated version of the rock-paper-scissors game was introduced in season 2, episode 8 of *The Big Bang Theory*.

The updated game takes the traditional rock-paper-scissors game and adds two new gestures:

Spock: One of *Star Trek*'s protagonists.

Lizard: The villain of *Star Trek*.

The winners and losers of these five gestures are shown in Table 1, which lists the results of the game A versus B.
| A/B      | Scissors | Rock | Paper | Lizard | Spock |
| -------- | -------- | ---- | ----- | ------ | ----- |
| Scissors | Even     | Lose | Win   | Win    | Lose  |
| Rock     |          | Even | Lose  | Win    | Lose  |
| Paper    |          |      | Even  | Lose   | Win   |
| Lizard   |          |      |       | Even   | Win   |
| Spock    |          |      |       |        | Even  |
Now, A and B try to play this upgraded version of this game. Their punches are known to be periodic, but not necessarily of equal length. For example: if A punches with a "Rock - Paper - Rock - Scissors - Lizard -Spock" cycle of length 6, then his punching sequence is "Rock - Paper - Rock - Scissors-Lizard - Spock - Rock - Paper - Rock - Scissors - Lizard - Spock-\...", whereas if B punches with a cycle of length 5 of "Scissors - Rock-Paper - Spock-Lizard", then his punching sequence is "Scissors - Rock - Paper - Spock - Lizard - Scissors - Rock - Paper - Spock - Lizard -\...".

It is known that A and B perform a total of N guesses. Each time the winner gets 1 point and the loser gets 0 points; Both players get 0 points if the game result is even. Now please figure out the score of two people after N guesses.

**Input**

The first line contains three integers: N, N~A~, N~B~, which represent the total number of games, the length of A's punching cycle, and the length of B's punching cycle, respectively. The integers are separated by spaces.

The second line contains N~A~ integers indicating the cycle of A's punches, and the third row contains N~B~ integers indicating the cycle of B's punches. Here, 0 means "Scissors", 1 means "Rock", 2 means "Paper", 3 means "Lizard", and 4 means "Spock". The numbers are separated by spaces.

**Output**

Output a line containing two integers, separated by a space, representing the score of A and B, respectively.

**Sample Input 1**

10 5 6

0 1 2 3 4

0 3 4 2 1 0

**Sample Output 1**

6 2

**Sample Input 2**

9 5 5

0 1 2 3 4

1 0 3 2 4

**Sample Output 2**

4 4

**Hint**

For 100% of the data, 0 \< N ≤ 200, 0 \< N~A~ ≤ 200, and 0 \< N~B~ ≤ 200.
