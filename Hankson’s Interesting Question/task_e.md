**Hankson's Interesting Question**

**Problem Description**

Dr. Hanks is a well-known expert in BT (Bio-Tech), and his son is named Hankson. Now Hankson, who has just returned from school, is pondering an interesting question.

Today in class, the teacher explained how to find the greatest common divisor and least common multiple of two positive integers c~1~ and c~2~. Now that Hankson thought he had this knowledge in hand, he began to think of an "inverse problem" of problems such as "finding common divisor" and "finding common multiples". The problem was like this: Given the positive integers a~0~,a~1~,b~0~,b~1~, let an unknown positive integer x satisfy:

1.  The greatest common divisor of x and a~0~ is a~1~;

2.  The least common multiple of x and b~0~ is b~1~.

Hankson's "inverse problem" is to find the positive integer x that satisfies the conditions. But after some thought, he realized that such x is not unique, and may not even exist. So, instead, he started thinking about how to solve for the number of x that satisfy the conditions. Please help him program the problem.

**Input**

The first line contains a positive integer n, indicating that there are n sets of input data. The following n line has a set of input data for each line, which are four positive integers a~0~,a~1~,b~0~,b~1~, separated by a space between every two integers. The input data ensures that a~0~ is divisible by a~1~ and b~1~ is divisible by b~0~.

**Output**

There are n lines. The output of each set of input data takes up one line, and it is an integer.

For each set of data: if no such x exists, please output 0; if such x exists, please output the number of x that meet the conditions;

**Sample Input**

2

41 1 96 288

95 1 37 1776

**Sample Output**

6

2

**Hint**

**\[Explanation of the Sample\]**

For the first set of input data, x could be 9,18,36,72,144,288, so the number of x is 6 in total.

For the second set of input data, x could be 48 or 1776, so the number of x is 2 in total.

**\[Data Range\]**

-For 50% of the data, it is ensured that 1≤a~0~,a~1~,b~0~,b~1~≤10000, and n≤100.

-For 100% of the data, it is ensured that 1≤a~0~,a~1~,b~0~,b~1~≤2×10^9^, and n≤2000.
