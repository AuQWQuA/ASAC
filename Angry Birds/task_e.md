**Angry Birds**

**Problem Description**

Kiana has recently become addicted to a magical game.

To put it simply, the game is played on a flat surface.

There is a slingshot located at (0,0), which Kiana can use to launch a red bird into the first quadrant each time. The bird's flight path is shaped like a curve y=ax^2^+bx, where a and b are the parameters specified by Kiana, and must satisfy a \< 0. a and b are real numbers.

When the bird falls back to the ground (i.e. the x-axis), it disappears instantly.

At one level of the game, there are n green pigs in the first quadrant of the plane, where the i^th^ pig is located at coordinate (x~i~, y~i~).

If a bird's trajectory passes (x~i~, y~i~), the i^th^ piggy is killed and the bird continues on its original trajectory.

If a bird's flight path does not pass (x~i~, y~i~), then the entire flight of the bird will have no effect on the i^th^ piggy.

For example, if two pigs are located at (1, 3) and (3, 3), Kiana can choose to launch a bird with a trajectory y=-x^2^+4x, so that both piglets will be killed by the bird together.

The goal of the game is to kill all the pigs by launching the birds.

Each level of this magical game is difficult for Kiana, so Kiana also enters some mysterious instructions to make it easier for her to complete the game. These instructions are detailed in \[Input\].

Let\'s say there are T levels in the game, and now Kiana wants to know, for each level, at least how many birds need to be fired to kill all the pigs. Since she can't do the math, she wants you to tell her.

**Input**

The first line contains a positive integer T, representing the total number of levels in the game.

Then, the information for each of these T levels is entered in turn below. The first line of each level contains two non-negative integers n and m, representing the number of pigs in that level and the type of mysterious instruction Kiana entered, respectively. In the next n lines, the i^th^ line contains two positive real numbers x~i~ and y~i~, indicating that the i^th^ pig is at the coordinate (x~i,~ y~i~). The data ensures that there are no two pigs with the exact same coordinates in the same level.

If m=0, Kiana entered an instruction that did nothing.

If m=1, then the level will satisfy that: at most ⌈n/3+1⌉ little birds will kill all the pigs.

If m=2, then the level will satisfy that: there must exist an optimal solution where there is a single bird that kills at least ⌊n/3⌋pigs.

Make sure that 1 ≤ n ≤ 18, 0 ≤ m ≤ 2, 0 \< x~i,~ y~i~ \< 10, and the real numbers in the input are kept to two decimal places.

Above, the symbols ⌈c⌉and ⌊ c ⌋ denote rounding up and rounding down c, respectively, as in the following example: ⌈2.1⌉= ⌈2.9⌉= ⌈3.0⌉= ⌊3.0⌋= ⌊3.1⌋= ⌊3.9⌋= 3.

**Output**

Output one line of answers for each level in turn.

Each line of the output contains a positive integer indicating the minimum number of birds needed to kill all the pigs in the corresponding level.

**Sample Input 1**

2

2 0

1.00 3.00

3.00 3.00

5 2

1.00 5.00

2.00 8.00

3.00 9.00

4.00 8.00

5.00 5.00

**Sample Output 1**

1

1

**Sample Input 2**

3

2 0

1.41 2.00

1.73 3.00

3 0

1.11 1.41

2.34 1.79

2.98 1.49

5 0

2.72 2.72

2.72 3.14

3.14 2.72

3.14 3.14

5.00 5.00

**Sample Output 2**

2

2

3

**Sample Input 3**

1

10 0

7.16 6.28

2.02 0.38

8.33 7.78

7.68 2.09

7.46 7.86

5.77 7.44

8.24 6.72

4.42 5.11

5.42 7.79

8.15 4.99

**Sample Output 3**

6

**Hint**

**\[Explanation of Sample 1\]**

There are two levels in this data set.

The first level is similar to the situation in \[Problem Description\]. Two pigs are located at (1.00, 3.00) and (3.00, 3.00), and they are killed by launching a small bird with a trajectory of y = -x^2^ + 4x.

In the second level, there are 5 pigs, but on observation, we can see that their coordinates are on the parabola y = -x^2^ + 6x, so Kiana only needs to launch one bird to kill all of them.

**\[Data Range\]**

  ----------- -------- -------- --------
  Test Data   **n⩽**   **m=**   **T⩽**
  1           2        0        10
  2           2        0        30
  3           3        0        10
  4           3        0        30
  5           4        0        10
  6           4        0        30
  7           5        0        10
  8           6        0        10
  9           7        0        10
  10          8        0        10
  11          9        0        30
  12          10       0        30
  13          12       1        30
  14          12       2        30
  15          15       0        15
  16          15       1        15
  17          15       2        15
  18          18       0        5
  19          18       1        5
  20          18       2        5
  ----------- -------- -------- --------
