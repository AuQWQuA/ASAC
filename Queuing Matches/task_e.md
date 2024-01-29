**Queuing Matches**

**Problem Description**

Hanhan has two boxes of matches, each containing n matches, and each match has a height. Now arrange the matches in each box in a row. The height of the matches in the same row is not the same. The distance between the two rows is defined as ∑(a~i~-b~i~)^2^

Where a~i~ is the height of the i~th~ match in the first row and b~i~ is the height of the i~th~ match in the second row.

The positions of two adjacent matches in each row can be swapped so that the distance between the two rows can be minimized by swapping. What is the minimum number of swaps needed to get this minimum distance? If this number is too large, output this minimum number of swaps modulo 10^\^^8-3.

**Input**

There are three lines, the first of which contains an integer n for the number of matches in each box.

The second line has n integers, separated by spaces, indicating the height of the matches in the first row.

The third line has n integers, separated by spaces, indicating the height of the matches in the second row.

**Output**

An integer representing the minimum number of swaps modulo 10^8^-3.

**Sample Input 1**

4

2 3 1 4

3 2 1 4

**Sample Output 1**

1

**Sample Input 2**

4

1 3 4 2

1 7 2 4

**Sample Output 2**

2

**Hint**

**\[Explanation of Sample 1\]**

The minimum distance is 0, and at least one exchange is required, for example: exchange the first 2 matches in column 1 or exchange the first 2 matches in column 2.

**\[Explanation of Sample 2\]**

The minimum distance is 10, and it needs to be exchanged at least twice. For example, the positions of the middle two matches in the first column are exchanged, and the positions of the last two matches in the second column are exchanged.

**\[Data Range\]**

For 10% of the data, 1 ≤ n ≤ 10;

For 30% of the data, 1 ≤ n ≤ 100;

For 60% of the data, 1 ≤ n ≤ 10^3^;

For 100% of the data, 1 ≤ n ≤ 10^5^, 0 ≤ match height \< 2^31^.
