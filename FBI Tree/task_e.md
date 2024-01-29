**FBI Tree**

**Problem Description**

We can classify strings consisting of "0" and "1" into three categories: all "0" are called B strings, all "1" are called I strings, and strings containing both "0" and "1" are called F strings.

FBI tree is a binary tree^1^, and its node types also include F node, B node and I node. An FBI tree T can be constructed from a string S of "01" with a length of 2^N^, and the recursive construction method is as follows:

1\) The root node of T is R, and its type is the same as that of string S;

2\) If the length of string S is greater than 1, separate the string S from the middle and divide it into equal length left and right substrings S~1~ and S~2;~ the left subtree T~1~ of R is constructed from the left substring S~1~, and the right subtree T~2~ of R is constructed from the right substring S~2~.

Now given a "01" string of length 2^N^, construct an FBI tree using the above construction method and output its post-order traversal^2^ sequence.

**Input**

The first line of the input file is an integer N(0≤N≤10), and the second line is a "01" string of length 2^N^.

**Output**

The output file contains a line that contains only one string, which is the post-traversal sequence of the FBI tree.

**Sample Input**

3

10001011

**Sample Output**

IBFBBBFIBFIIIFF

**Data Size**

For 40% of data, N≤2;

For all of the data, N≤10.
