**Matrix Number Game**

**Problem description**

Shuaishuai often plays a matrix number game with his classmates: For a given n × m matrix, each element a~i,j~ in the matrix is a non-negative integer. The game rules are as follows:

1\. One element must be removed from each line each time, a total of n elements. It takes m times to remove all the elements of the matrix;

2\. Each element to be removed must be at the beginning or end of the line where the element belongs.

3\. Each removal has a score value, which is the sum of the scores of each line, and the score of each line = the value of the element to be taken × 2^i^, where i represents the i^th^ removal (numbered from 1);

4\. The total score at the end of the game is the sum of m times removal score value.

Shuaishuai would like to ask you to write a program that can find the maximum score for any matrix.

**Input**

The input file contains n+1 lines:

Line 1 contains two integers n and m separated by a space.

Line 2 to n+1 is an n × m matrix, where each line has m non-negative integers separated by spaces.

**Output**

The output file contains only one line, which includes an integer, that is, the maximum score for the input matrix.

**Sample Input**

2 3

1 2 3

3 4 2

**Sample Output**

82

**Hint**

**\[Data Range\]**

For 60% of the data, 1 ≤ n, m ≤ 30, the answer is no more than 10^16^

For 100% of the data, 1 ≤ n, m ≤ 80, 0 ≤ a~i,j~ ≤ 1000
