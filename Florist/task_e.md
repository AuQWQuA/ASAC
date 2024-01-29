**Florist**

**Problem Description**

Dongdong, the florist, planted a row of flowers, each with a height. As the flowers grew bigger and bigger, they became more and more crowded. Dongdong decides to move some of the flowers from the row and leave the rest where they are so that the rest of the flowers have room to grow. He also wants the rest of the flowers to be arranged in a unique way.

Specifically, the height of Dong Dong\'s flowers can be viewed as a column of integers h~1~, h~2~,\..., h~n~. Let the height of the remaining flowers be g~1~, g~2~,\..., g~m~, then Dongdong wants at least one of the following two conditions to be satisfied:

Condition A: For all g~2i~\> g~2i-1~, g~2i~\> g~2i+1~

Condition B: For all g~2i~\<g~2i-1~,g~2i~\< g~2i+1~

Note that both of the above conditions are satisfied when m=1, and at most one of them is satisfied when m \> 1.

What is the maximum number of flowers Dongdong can leave in this place?

**Input**

The first line contains an integer n, which represents the number of flowers at the beginning.

The second line contains n integers, h~1~, h~2~,\..., h~n~, which represent the height of the flowers.

**Output**

An integer m represents the number of flowers that can be left in place at most.

**Sample Input**

5

5 3 2 1 2

**Sample Output**

3

**Hint**

**\[Explanation of Sample\]**

There are various ways to keep three flowers, for example, leaving the first, fourth, and fifth flowers with heights 5, 1, and 2, respectively, which will satisfy Condition B.

**\[Data Range\]**

For 20% of the data, n ≤ 10;

For 30% of the data, n ≤ 25;

For 70% of the data, n ≤ 1000,0 ≤ h~i~≤ 1000;

For 100% of the data, 1 ≤ n ≤ 100,000,000, 0 ≤ h~i~≤ 1,000,000, all h~i~ are randomly generated, and all random numbers obey the uniform distribution in a certain interval.
