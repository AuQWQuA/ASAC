**Circle**

**Problem description**

Lele is a clever and studious child. He always likes to explore the law of things. One day, he suddenly became interested in positive integer powers of logarithms.

We all know that the last digit of a positive integer power of 2 is always repeating 2, 4, 8, 6, 2, 4, 8, 6\... We say that the last bit of the positive integer power of 2 has a circle length of 4 (in fact, any multiple of 4 can be a circle length, but we only consider the smallest circle length). Similarly, the last digit of the positive integer power of the rest of the numbers also has a similar circular phenomenon:

  -------- ------------ ----------------------
  Number   Circle       The length of circle
  2        2, 4, 8, 6   4
  3        3, 9, 7, 1   4
  4        4, 6         2
  5        5            1
  6        6            1
  7        7, 9, 3, 1   4
  8        8, 4, 2, 6   4
  9        9,1          2
  -------- ------------ ----------------------

Here comes Lele's question: Is it only the last digit that has this circle? For an integer N to a positive integer power, does the last k digits have such circle? If it does, what is the length of the circle?

**Note:**

1\. If the number of digits of a positive integer to the power of n is less than k, then the high digit of the number is considered to be 0.

2\. If the circle length is L, then it means that for any positive integer a, n to the a power and n to the a + L power have the same last k digits.

**Input**

The input file is a single line and contains two integers n and k, separated by a space, indicating to find the length of the circle of the last k digits to the positive integer power of n.

**Output**

The output file contains an integer indicating the length of the circle. If the circle does not exist, output -1.

**Sample Input**

32 2

**Sample Output**

4

**Data Size**

For 30% of the data, k ≤ 4;

For 100% of the data, 1 ≤ n ≤ 10^100^, 1≤ k ≤ 100.
