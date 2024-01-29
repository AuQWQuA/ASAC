**Spinning Game**

**Problem Description**

N players (numbered from 0 to n-1) sit in a circle and play this game. Number the n positions in a clockwise direction, from 0 to n -1. Initially, player 0 is in position 0, player 1 is in position 1,\..., and so on. The rules of the game are as follows: in each round, the player in position 0 moves clockwise to position m, the player in position 1 moves clockwise to position m+1,\...and so on, the player in position n-m goes to position 0, the player in position n-m+1 goes to position 1,\...and the player in position n-1 goes clockwise to position m-1.

Now, after a total of 10^k^ rounds, please answer which position player x finally went to.

**Input**

There is only one line, containing four integers n, m, k, and x, separated by a space between every two integers.

**Output**

An integer indicating the number of the position of the player x after 10^k^ rounds.

**Sample Input**

10 3 4 5

**Sample Output**

5

**Hint**

For 30% of the data, 0 \< k \< 7;

For 80% of the data, 0 \< k \< 10^7^;

For 100% of the data, 1 \< n \< 10^6^, 0 \< m \< n, 1 ≤ x ≤ n, 0 \< k \< 10^9^.
