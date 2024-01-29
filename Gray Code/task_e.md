**Gray Code**

**Problem Description**

In general, it is customary to arrange all n-bit binary strings in lexicographic order, for example, all 2-bit binary strings in lexicographic order from smallest to largest: 00,01,10,11.

Gray Code is a special type of n-bit binary string arrangement that requires that two adjacent binary strings **differ** by **exactly** one bit. In particular, the first string counts as adjacent to the last string.

An example of a Gray code arrangement for all 2-bit binary strings is: 00,01,11,10.

There is more than one type of n-bit Gray code, and the algorithm to generate one of these Gray codes is given below:

1\. A 1-bit Gray code consists of two 1-bit binary strings in the order: 0, 1.

2\. The first 2^n^ binary strings of the n+1-bit Gray code can be formed by the n-bit Gray code generated by this algorithm (2^n^ binary strings of n bits in total) arranged in **order** and a prefix of 0 before each string.

3\. The last 2^n^ binary strings of the n+1-bit Gray code can be formed by the n-bit Gray code generated by this algorithm (2^n^ binary strings of n bits in total) in **reverse order**, and a prefix of 1 before each string.

In summary, the n+1 bit Gray code is composed of the 2^n^ binary strings of the n bit Gray code arranged in order followed by prefix 0, and the reverse order followed by prefix 1, a total of 2^n+1^ binary strings. In addition, for the 2^n^ binary strings in the n-bit Gray code, we number them from 0 to 2^n-1^ in the order obtained by the above algorithm.

According to this algorithm, a 2-bit Gray code can be derived as follows:

1\. The 1-bit Gray code is known to be 0,1.

2\. The first two Gray codes are 00, 01. The last two Gray codes are 11,10. They are combined to get 00, 01, 11, 10, numbered from 0 to 3.

Similarly, a 3-bit Gray code can be derived as follows:

1\. The 2-bit Gray code is known to be: 00,01,11,10.

2\. The first four Gray codes are: 000, 001, 011, 010. The last four gray codes are: 110, 111, 101, 100. After combination, we get: 000, 001, 011, 010, 110, 111, 101, 100, numbered from 0 to 7.

Now given n and k, please find the k^th^ binary string in the n-bit Gray code generated by the above algorithm.

**Input**

Just one line of two integers n and k, the meanings of which are described in the title description.

**Output**

Just one n-bit binary string per line represents the answer.

**Sample Input 1**

2 3

**Sample Output 1**

10

**Sample Input 2**

3 5

**Sample Output 2**

111

**Sample Input 3**

44 1145141919810

**Sample Output 3**

00011000111111010000001001001000000001100011

**Hint**

**\[Explanation of Sample 1\]**

The 2-bit Gray codes are: 00, 01, 11, 10 and are numbered from 0 to 3, so the third string is 10.

**\[Explanation of Sample 2\]**

The 3-bit Gray codes are: 000, 001, 011, 010, 110, 111, 101, 100, numbered from 0 to 7, so the fifth string is 111.

**\[Data Range\]**

For 50% of the data: n ≤ 10

For 80% of the data: k ≤ 5×10^6^

For 95% of the data: k ≤ 2^63^ -1

For 100% of the data: 1 ≤ n ≤ 64, 0 ≤ k \< 2^n^