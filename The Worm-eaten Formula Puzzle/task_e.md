**The Worm-eaten Formula Puzzle**

**Problem Description**

The worm-eaten formula puzzle is that the original calculation is partially eaten by the worms, and we need to determine the missing part based on the remaining numbers. Here is a simple example:

43\#9865\#045

> \+ 8468\#6633

44445509678

The \# represents the number eaten by the worm. It's easy to tell from the formula: Two numbers in the first line are 5 and 3, and number in the second line is 5.

Now, let's make two restrictions on the problem:

First of all, we just consider the additive worm-eaten formula puzzle. The addition here is n-nary, where all three numbers have n digits and leading zeros are allowed.

Second, the worms eat up all the numbers, and all we know is which numbers are the same. We use the same letter for the same number, and different letters for different numbers. If the formula is n-nary, we take the first n uppercase letters of the English alphabet to represent the n different numbers in the formula from 0 to n-1 (but the n letters do not necessarily represent 0 to n-1 in order). Make sure that the input data have n letters appear at least once each.

BADC

\+ CBDA

DCCC

The above formula is a 4-nary formula. And obviously, to make this work, we just need to make ABCD stand for 0123 respectively. Your task is to find the numbers represented by the n different letters for a given n-nary addition formula so that the addition formula holds. The input data ensures that there is one and only one set of solutions.

**Input**

The input file contains four lines. The first line has a positive integer n, representing the base of the formula.

From the second to the forth line, each line has a string of uppercase letters representing two addends and the sum, respectively. These three strings have no spaces left and right, in which the characters from left to right represent number from higher order digit to lower order digit respectively, and have exactly n bits.

**Output**

The output file includes a line which contains n integers, denoting the number A, B,\... represents respectively, and every two adjacent digits are separated by a space.

**Sample Input**

5

ABCED

BDACE

EBBAA

**Sample Output**

1 0 3 4 2

**Data Size**

For 30% of the data, it is ensured that n≤10;

For 50% of the data, it is ensured that n≤15;

For all data, it is ensured that 1≤n≤26.
