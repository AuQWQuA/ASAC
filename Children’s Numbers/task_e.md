**Children's Numbers**

**Problem Description**

There are n children in a row. Every child has a number in his hand, which can be positive or negative. It is stipulated that the characteristic value of each child is equal to the maximum value of the sum of the numbers of consecutive children (at least one) ranked in front of him (including himself). As the teacher of these children, you need to give each child a score. The score is specified as follows: The score of the first child is his eigenvalue, and the score of any other child is defined as follows: calculate the sum of the score and the characteristic value of each child in front of him (excluding himself), and the score is defined as the maximum of these sums.\
Please calculate the maximum value of all children's scores, keep the sign of the maximum value when outputting, and output its absolute value modulo p.

**Input**

The first line contains two positive integers n and p, separated by a space. 

The second line contains n numbers, representing the numbers in each child's hand. Every two integers are separated by a space.

**Output**

The output is only one line, containing an integer, which represents the result of the maximum score modulo p.

**Sample Input**

5 997

1 2 3 4 5

**Sample Output**

21

**Hint**

**Sample Input 2**

5 7\
-1 -1 -1 -1 -1

**Sample Output 2**

-1

**\[Explanation for Sample 1\]**

The children's characteristic values are 1, 3, 6, 10, and 15, and the scores are 1, 2, 5, 11, and 21. The maximum value, 21, modulo 997 is 21.

**\[Explanation for Sample 2\]**

The children's characteristic values are -1, -1, -1, -1, and -1, and the scores are -1, -2, -2, -2, and -2. The maximum value, -1, modulo 77 is -1, so output -1.

For 50% of the data, 1 ≤ n ≤ 1,000, 1 ≤ p ≤ 1,000, the absolute value of all numbers is at most 1000;

For 100% of the data, 1 ≤ n ≤ 1,000,000, 1 ≤ p ≤ 10^9^, the absolute value of all numbers is at most 10^9^.
