**Hopscotch**

**Problem Description**

Hopscotch is a worldwide children's game and is also one of the traditional folk sports games in China.

The rules of hopscotch are as follows:

Determine a starting point on the ground, and then draw n squares to the right of the starting point, all on the same line. Each square contains a number (integer) that represents the number of points you can get to reach that cell. The player jumps to the right from the starting point for the first time, into a grid to the right of the starting point. Then, take a second jump to the right from the current position, and so on. The rules state:

Each time the player must jump into a square to the right of the current position. The player can end the game at any time, and the points the player gets are the sum of the numbers in the previous squares.

Now R has developed a bouncing robot to take part in the game. But this robot has a very serious defect, it can only bounce to the right for a fixed distance d. R wants to improve his robot. If he spends g gold coins to improve his robot, then his robot's flexibility will increase by g, but it should be noted that the distance of each bounce is at least 1. Specifically, when g\<d, his robot can choose the right bounce distance from d−g, d−g+1, d−g+2,\..., d+g−2, d+g−1, d+g; Otherwise (when g≥d), his robot can choose to bounce to the right at a distance of 1, 2, 3\..., d+g−2, d+g−1, d+g.

Now R wants to get at least K points. How many gold coins should he spend at least on improving his robot?

**Input**

The three positive integers n, d, and k in the first line represent the number of squares, the fixed distance the robot bounces before improvement, and the number of points R wants to get at least. Two adjacent numbers are separated by a space.

For the next n lines, each line contains two integers x~i~ and s~i~, representing the distance from the starting point to the i^th^ square and the number of points of the i^th^ square. The two numbers are separated by a space. Make sure that xi is entered in the order from smallest to largest.

**Output**

There is one line containing an integer indicating how many gold coins it would take to improve R's robot. If he can't get at least K points anyway, output −1.

**Sample Input**

7 4 10

2 6

5 -3

10 3

11 -3

13 1

17 6

20 2

**Sample Output**

2

**Hint**

**Sample Input 2**

7 4 20\
2 6\
5 -3\
10 3\
11 -3\
13 1\
17 6\
20 2

**Sample Output 2**

-1

**\[Explanation for Sample 1\]**

After the improvement of 2 gold coins, the robot successively bounce to the right with a distance of 2,3,5,3,4,3, and reaches the positions of 2,5,10,13,17,20, corresponding to the 6 squares numbered 1,2,3,5,6,7. The sum of the numbers in these squares, 15, is the score that R gets.

**\[Explanation for Sample 2\]**

Since the maximum number of possible combinations of seven squares in the sample is only 18, R can't get 20 points anyway.

**Data Size and Constraints**

In this question, there are 10 groups of data, and each group of data is 10 points.

For all of the data, 1 ≤ n ≤ 500000, 1 ≤ d ≤ 2000, 1 ≤ x~i,\ k~ ≤ 10^9^, \|s~i~\| \< 10^5^;

For groups 1 and 2, n≤10;

For groups 3, 4, and 5, n≤500;

For groups 6, 7 and 8, d = 1.
